zero-width bit field
===

### Course example
In the course, there is an example of zero-width bit field demonstrates the padding.
```c
struct foo {
    int a : 3;
    int b : 2;
    int : 0; /* Force alignment to next boundary */
    int c : 4;
    int d : 3;
};

int main() {
    int i = 0xFFFF;
    struct foo *f = (struct foo *)&i;
	printf("&f: %p\n", &f);
    printf("a=%d\nb=%d\nc=%d\nd=%d\n", f->a, f->b, f->c, f->d);
    return 0;
}
```

### Steps
1. list the observation and question
	- d is different
	- d's range -4 ~ 3
	- how about c?

2. idea and thoughts
3. learn gdb(another md note)
4. experiment
5. result and conclusion

### items
1. little endian
2. int: 32 bits(4 bytes)

### experiment

&i = &(f->a) = 0x7fffffffd18c
```
(gdb) p &i
$10 = (int *) 0x7fffffffd18c
(gdb) p &(f->a)
$11 = (int *) 0x7fffffffd18c
```

&(f->c) = 0x7fffffffd190
```shell
(gdb) p &(f->c)
$9 = (int *) 0x7fffffffd190
(gdb) x/t 0x7fffffffd190
0x7fffffffd190: 11111111111111111101000110001100
```

```shell
400596:       55                      push   rbp
400597:       48 89 e5                mov    rbp,rsp
40059a:       48 83 ec 20             sub    rsp,0x20

(gdb) p $rbp
$7 = (void *) 0x7fffffffd1a0
(gdb) p $rsp
$8 = (void *) 0x7fffffffd180

(gdb) p f
$9 = (struct foo *) 0x7fffffffd280
(gdb) p &f
$10 = (struct foo **) 0x7fffffffd190

(gdb) p &(f->a)
$17 = (int *) 0x7fffffffd280
(gdb) p &(f->b)
$18 = (int *) 0x7fffffffd280
(gdb) p &(f->c)
$19 = (int *) 0x7fffffffd284
(gdb) p &(f->d)
$20 = (int *) 0x7fffffffd284
(gdb) p f
$21 = (struct foo *) 0x7fffffffd280

rbp-0x8
rbp-0x14
rbp-0x10

(gdb) x/t 0x7fffffffd190
0x7fffffffd190: 11111111111111111101 | 0010 | 1000 | 0000
(gdb) n
18              printf("a: %d\nb: %d\nc: %d\nd: %d\n", f->a, f->b, f->c, f->d);
(gdb) x/t 0x7fffffffd190
0x7fffffffd190: 11111111111111111101 | 0001 | 1000 | 1100
```
[Hack the virtual memory, chapter 4: the stack, registers and assembly code](https://github.com/holbertonschool/Hack-The-Virtual-Memory/tree/master/04.%20The%20Stack%2C%20registers%20and%20assembly%20code)
check if pointer f point to [rsp-4]
what's [rsp-8]

[記憶體中每個位址所佔的容量](https://www.ptt.cc/bbs/CSSE/M.1273025039.A.CBB.html)
[PC Assembly Language 學習筆記(1) - Computer Organization](http://godleon.blogspot.com/2008/01/memory-1-byte-byte-byte-memory-address.html)

each memory unit: 1 byte / 8 bits

check memory high address or low address

- memory layout of c pro
[Stack frame layout on x86-64](https://eli.thegreenplace.net/2011/09/06/stack-frame-layout-on-x86-64/)

xdd???
