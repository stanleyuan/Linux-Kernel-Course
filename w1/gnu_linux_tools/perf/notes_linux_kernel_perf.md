Perf
===

an analysis tool of Linux kernel which can detect hardware, software and tracepoint event of the kernel


## Installation

```bash
# check
cat "/boot/config-`uname -r`" | grep -i "PERF_EVENT"

# install
sudo apt-get install linux-tools-common

# for different version
sudo apt-get install linux-tools-`uname -r` linux-cloud-tools-`uname -r`

# permission value
# 2 : 不允許任何量測。但部份用來查看或分析已存在的紀錄的指令仍可使用，如 perf ls、perf report、perf timechart、 perf trace。
# 1 : 不允許 CPU events data。但可以使用 perf stat、perf record 並取得 Kernel profiling data。
# 0 : 不允許 raw tracepoint access。但可以使用 perf stat、perf record 並取得 CPU events data。
# -1: 權限全開
cat /proc/sys/kernel/perf_event_paranoid

# for checking cache miss event
sudo sh -c "echo 0 > /proc/sys/kernel/kptr_restrict"
```

## Example
perf_top_example.c
```c
#include <stdio.h>
#include <unistd.h>

double compute_pi_baseline(size_t N) {
    double pi = 0.0;
    double dt = 1.0 / N;
    for (size_t i = 0; i < N; i++) {
        double x = (double) i / N;
        pi += dt / (1.0 + x * x);
    }
    return pi * 4.0;
}
int main() {
    printf("pid: %d\n", getpid());
    sleep(10);
    compute_pi_baseline(50000000);
    return 0;
}
```
test with perf
```sh
# compile
gcc -c perf_example
gcc perf_example.o -o example
./example &

# perf
perf top -p $pid

Overhead  Shared O  Symbol
56.35% example   [.] compute_pi_baseline
40.14% [kernel]  [k] exit_to_usermode_loop
1.71%  [kernel]  [k] __softirqentry_text_start
1.14%  [kernel]  [k] finish_task_switch
0.65%  [kernel]  [k] VbglGRPerform
```

## Usage
### perf list
list what event perf support

### perf top
analysis system resource

```sh
# default freq: 4000
# -e: event
# -c: count
perf top -e cache-misses -c 5000
```

### perf stat
for specific target
```c
// before
static char array[10000][10000];
int main (void){
  int i, j;
  for (i = 0; i < 10000; i++)
    for (j = 0; j < 10000; j++)
       array[j][i]++;
  return 0;
}

// locality of reference
//after
static char array[10000][10000];
int main (void){
  int i, j;
  for (i = 0; i < 10000; i++)
    for (j = 0; j < 10000; j++)
       array[i][j]++;
  return 0;
}
```

perf
```sh
# --repeat <n>/-r <n> repeat the process n times
# -e: event

# before
perf stat --repeat 5 -e cache-misses,cache-references,instructions,cycles ./perf_stat_cache_miss

Performance counter stats for './perf_stat_cache_miss' (5 runs):

        19,072,565      cache-misses              #    4.823 % of all cache refs      ( +-  2.16% )
       395,435,246      cache-references                                              ( +-  0.23% )
     2,200,395,357      instructions              #    1.15  insn per cycle           ( +-  0.07% )
     1,909,035,330      cycles                                                        ( +-  0.24% )

       0.576911188 seconds time elapsed                                          ( +-  0.69% )

# after
sudo perf stat --repeat 5 -e cache-misses,cache-references,instructions,cycles ./perf_stat_cache_miss_improved

Performance counter stats for './perf_stat_cache_miss_improved' (5 runs):

         2,343,033      cache-misses              #   83.978 % of all cache refs      ( +-  0.33% )
         2,790,066      cache-references                                              ( +-  2.09% )
     2,199,241,870      instructions              #    2.25  insn per cycle           ( +-  0.07% )
       978,284,569      cycles                                                        ( +-  0.32% )

       0.297923212 seconds time elapsed                                          ( +-  2.14% )
```

### perf record
for specific function

```c
#include<stdlib.h>

#define N 5000000
static int array[N] = { 0 };
void normal_loop(int a) {
    int i;
    for (i = 0; i < N; i++)
        array[i] = array[i]+a;
}
void unroll_loop(int a) {
    int i;
    for (i = 0; i < N; i+=5){
        array[i] = array[i]+1;
        array[i+1] = array[i+1]+a;
        array[i+2] = array[i+2]+a;
        array[i+3] = array[i+3]+a;
        array[i+4] = array[i+4]+a;
    }
}
int main() {
    normal_loop(1);
    unroll_loop(1);
    return 0;
}
```
perf
```sh
# :u: user space event
# -F: frequency

# check max smaple rate
cat /proc/sys/kernel/perf_event_max_sample_rate
18750

perf record -e branch-misses:u,branch-instructions:u ./perf_record_example
# [ perf record: Woken up 1 times to write data ]
# [ perf record: Captured and wrote 0.012 MB perf.data (238 samples) ]

perf report
# Available samples
# 7 branch-misses:u
Samples: 7  of event 'branch-misses:u', Event count (approx.): 1384
Overhead  Command          Shared Object        Symbol
  47.62%  perf_record_exa  ld-2.23.so           [.] _dl_map_object_from_fd
  24.78%  perf_record_exa  ld-2.23.so           [.] _dl_next_ld_env_entry
  22.98%  perf_record_exa  perf_record_example  [.] unroll_loop
   4.62%  perf_record_exa  ld-2.23.so           [.] _dl_start

# 231 branch-instructions:u
Samples: 231  of event 'branch-instructions:u', Event count (approx.): 6026649
Overhead  Command          Shared Object        Symbol
  83.61%  perf_record_exa  perf_record_example  [.] normal_loop
  16.11%  perf_record_exa  perf_record_example  [.] unroll_loop
   0.14%  perf_record_exa  ld-2.23.so           [.] strcmp
   0.08%  perf_record_exa  ld-2.23.so           [.] _dl_relocate_object
```

## Tech term
### Monitoring
- [PMU(Performance Monitoring Unit)](http://rts.lab.asu.edu/web_438/project_final/Talk%209%20Performance%20Monitoring%20Unit.pdf)

	a subsystem which helps in analysis how a application or os are preformance on the processor

- PME(Performance Monitoring Event)

	two types of events: hardware(cpy-cycle, instruction, cache reference) and software(page fault, context-switch)

- MSR(Machine Specific Register)

	A model-specific register (MSR) is any of various control registers in the x86 instruction set used for debugging, program execution tracing, computer performance monitoring, and toggling certain CPU features.

- Approaches for monitoring
	- Counting

		In counting mode, the MSRs are configured before
		monitoring starts and at the end of monitoring period
		the counter values are aggregated.

	- Event Based Sampling

		An event counter is configured to overflow after a
		preset number of events. At overflow the process
		information, like instruction pointer, general purpose
		registers and EFLAG registers, is captured and passed to
		user.

### misses

- cache-misses

	A cache miss is a failed attempt to read or write a piece of data in the cache, which results in a main memory access with much longer latency. There are three kinds of cache misses: instruction read miss, data read miss, and data write miss.

	Cache read misses from an instruction cache generally cause the largest delay, because the processor, or at least the thread of execution, has to wait (stall) until the instruction is fetched from main memory. Cache read misses from a data cache usually cause a smaller delay, because instructions not dependent on the cache read can be issued and continue execution until the data is returned from main memory, and the dependent instructions can resume execution. Cache write misses to a data cache generally cause the shortest delay, because the write can be queued and there are few limitations on the execution of subsequent instructions; the processor can continue until the queue is full.

- locality of reference

	In computer science, locality of reference, also known as the principle of locality, is the tendency of a processor to access the same set of memory locations repetitively over a short period of time. There are two basic types of reference locality – temporal and spatial locality. Temporal locality refers to the reuse of specific data, and/or resources, within a relatively small time duration. Spatial locality refers to the use of data elements within relatively close storage locations. Sequential locality, a special case of spatial locality, occurs when data elements are arranged and accessed linearly, such as, traversing the elements in a one-dimensional array.

- branch-misses

	Branch misprediction occurs when a central processing unit (CPU) mispredicts the next instruction to process in branch prediction, which is aimed at speeding up execution.

### Paging
The basic method for implementing paging involves breaking physical memory into fixed-sized blocks called frames and breaking logical memory into blocks of the same size called pages. When a process is to be executed, its pages are loaded into any available memory frames from their source (a file system or the backing store). The backing store is divided into fixed-sized blocks that are the same size as the memory frames or clusters of multiple frames.

#### fragmentation
- external fragmentation

	between frames

- internal fragmentation

	within frames


```bash
# get page size
getconf PAGESIZE
```

#### page-faults

A page fault (sometimes called #PF, PF or hard fault[a]) is a type of exception raised by computer hardware when a running program accesses a memory page that is not currently mapped by the memory management unit (MMU) into the virtual address space of a process. Logically, the page may be accessible to the process, but requires a mapping to be added to the process page tables, and may additionally require the actual page contents to be loaded from a backing store such as a disk. The processor's MMU detects the page fault, while the exception handling software that handles page faults is generally a part of the operating system kernel. When handling a page fault, the operating system generally tries to make the required page accessible at the location in physical memory, or terminates the program in case of an illegal memory access.


### [IPC(Inter Process Communication)](https://www.geeksforgeeks.org/inter-process-communication/)
A mechanism which allows processes to communicate each other and synchronize their actions.

#### Process type:
- independent process
- co-operating process

#### Communication method:
##### shared memory
- Producer-Consumer problem
- bounded buffer
- unbounded buffer

##### message passing
###### communication link
- direct communication links
- in-directed communication

###### exchanging the messages
- synchronous message passing
- asynchronous message passing
	- blocking send and blocking receive
	- non-blocking send and non-blocking receive
	- non-blocking send and blocking receive(mostly used)
