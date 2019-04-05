# zero width bit field 2

## tech term

### Do not make assumptions regarding the layout of structures with bit-fields
- [reference](https://wiki.sei.cmu.edu/confluence/display/c/EXP11-C.+Do+not+make+assumptions+regarding+the+layout+of+structures+with+bit-fields)

big endian, little endian

bit field overlap
across 8-bit bytes


### o2
```shell
-O2 Optimize even more.  GCC performs nearly all supported optimizations that do not involve a space-speed tradeoff.  As compared to -O,
this option increases both compilation time and the performance of the generated code.

   -O2 turns on all optimization flags specified by -O.  It also turns on the following optimization flags: -fthread-jumps
   -falign-functions  -falign-jumps -falign-loops  -falign-labels -fcaller-saves -fcrossjumping -fcse-follow-jumps  -fcse-skip-blocks
   -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively -fexpensive-optimizations -fgcse  -fgcse-lm
   -fhoist-adjacent-loads -finline-small-functions -findirect-inlining -fipa-cp -fipa-cp-alignment -fipa-sra -fipa-icf
   -fisolate-erroneous-paths-dereference -flra-remat -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole2
   -freorder-blocks -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop -fsched-interblock  -fsched-spec
   -fschedule-insns  -fschedule-insns2 -fstrict-aliasing -fstrict-overflow -ftree-builtin-call-dce -ftree-switch-conversion
   -ftree-tail-merge -ftree-pre -ftree-vrp -fipa-ra

   Please note the warning under -fgcse about invoking -O2 on programs that use computed gotos.

   NOTE: In Ubuntu 8.10 and later versions, -D_FORTIFY_SOURCE=2 is set by default, and is activated when -O is set to 2 or higher.
   This enables additional compile-time and run-time checks for several libc functions.  To disable, specify either -U_FORTIFY_SOURCE
   or -D_FORTIFY_SOURCE=0.
```

### assembly
- **movsx** moves a signed value into a register and sign-extends it with 1.
- **movzx** moves an unsigned value into a register and zero-extends it with zero.
- **SHL** (shift left) instruction performs a logical left shift on the destination operand, filling the lowest bit with 0.
- **SAR** (shift arithmetic right) performs a right arithmetic shift on the destination operand.
- **r8d, r8w and r8b** (the lower 32-bit double-word, 16-bit word and 8-bit byte respectively).
- **lea** mov for address
- 8 bits is a "BYTE", 16 bits is a "WORD", 32 bits is a "DWORD" (double word), and 64 bits is a "QWORD";

EAX is the full 32-bit value
AX is the lower 16-bits
AL is the lower 8 bits
AH is the bits 8 through 15 (zero-based)

RAX, which hold a 64-bit value, and where EAX is mapped to the lower 32 bits.

- [Sign Extending with MOVSX and MOVZX](http://www.c-jump.com/bcc/c261c/ASM/DataTypes/T77_0270_sext_example_movsx.htm)
- [Integer Arithmetic](https://www.csie.ntu.edu.tw/~acpang/course/asm_2004/slides/chapt_07_PartISolve.pdf)
- [What are the names of the new X86_64 processors registers?](https://stackoverflow.com/questions/1753602/what-are-the-names-of-the-new-x86-64-processors-registers)

### c
- An lvalue (locator value) represents an object that occupies some identifiable location in memory (i.e. has an address).

### gdb
#### command
- explore 
- info address
- info symbol

## no printf(f)

### O0

yes

#### asm
```asm
0000000000400572 <main>:
  400572:	55                   	push   rbp
  400573:	48 89 e5             	mov    rbp,rsp
  400576:	48 83 ec 20          	sub    rsp,0x20
  40057a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  400581:	00 00
  400583:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400587:	31 c0                	xor    eax,eax
  400589:	c7 45 ec ff ff 00 00 	mov    DWORD PTR [rbp-0x14],0xffff
  400590:	48 8d 45 ec          	lea    rax,[rbp-0x14]
  400594:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

									// d
  400598:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  40059c:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005a0:	01 c0                	add    eax,eax //shl eax, 0x1
  4005a2:	c0 f8 05             	sar    al,0x5
  4005a5:	0f be f0             	movsx  esi,al

  									// c
  4005a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005ac:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005b0:	c1 e0 04             	shl    eax,0x4
  4005b3:	c0 f8 04             	sar    al,0x4
  4005b6:	0f be c8             	movsx  ecx,al

  									// b
  4005b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005bd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005c0:	c1 e0 03             	shl    eax,0x3
  4005c3:	c0 f8 06             	sar    al,0x6
  4005c6:	0f be d0             	movsx  edx,al
  
  									// a
  4005c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005d0:	c1 e0 05             	shl    eax,0x5
  4005d3:	c0 f8 05             	sar    al,0x5
  4005d6:	0f be c0             	movsx  eax,al

  4005d9:	41 89 f0             	mov    r8d,esi
  4005dc:	89 c6                	mov    esi,eax
  4005de:	bf 94 06 40 00       	mov    edi,0x400694
  4005e3:	b8 00 00 00 00       	mov    eax,0x0
  4005e8:	e8 83 fe ff ff       	call   400470 <printf@plt>
  4005ed:	b8 00 00 00 00       	mov    eax,0x0
  4005f2:	48 8b 7d f8          	mov    rdi,QWORD PTR [rbp-0x8]
  4005f6:	64 48 33 3c 25 28 00 	xor    rdi,QWORD PTR fs:0x28
  4005fd:	00 00
  4005ff:	74 05                	je     400606 <main+0x94>
  400601:	e8 5a fe ff ff       	call   400460 <__stack_chk_fail@plt>
  400606:	c9                   	leave
  400607:	c3                   	ret
  400608:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40060f:	00
```

#### output

```
a: -1
b: -1
c: -4
d: 1
a: -1
b: -1
c: -4
d: -4
a: -1
b: -1
c: -4
d: 2
a: -1
b: -1
c: -4
d: -3
a: -1
b: -1
c: -4
d: 2
```

#### gdb
```
(gdb) p $rbp
$1 = (void *) 0x7fffffffd100
(gdb) p &f
$2 = (struct foo **) 0x7fffffffd0f0
(gdb) p &i
$3 = (int *) 0x7fffffffd0ec
(gdb) p &(f->a)
$4 = (int *) 0x7fffffffd0ec
(gdb) p &(f->c)
$5 = (int *) 0x7fffffffd0f0
```

### O2

no...
#### output

```
a: -1
b: -1
c: 0
d: 0
a: -1
b: -1
c: 0
d: 0
a: -1
b: -1
c: 0
d: 0
a: -1
b: -1
c: 0
d: 0
a: -1
b: -1
c: 0
d: 0
```

#### asm
```asm
00000000004004c0 <main>:
  4004c0:	48 83 ec 18          	sub    rsp,0x18
  4004c4:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  4004c9:	be 94 06 40 00       	mov    esi,0x400694
  4004ce:	bf 01 00 00 00       	mov    edi,0x1
  4004d3:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4004da:	00 00
  4004dc:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  4004e1:	31 c0                	xor    eax,eax
  4004e3:	89 ca                	mov    edx,ecx
  4004e5:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  4004ec:	00
  4004ed:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
  4004f3:	47 8d 0c 00          	lea    r9d,[r8+r8*1]
  4004f7:	41 c1 e0 04          	shl    r8d,0x4
  4004fb:	41 c0 f9 05          	sar    r9b,0x5
  4004ff:	41 c0 f8 04          	sar    r8b,0x4
  400503:	45 0f be c9          	movsx  r9d,r9b
  400507:	45 0f be c0          	movsx  r8d,r8b
  40050b:	e8 90 ff ff ff       	call   4004a0 <__printf_chk@plt>
  400510:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
  400515:	64 48 33 34 25 28 00 	xor    rsi,QWORD PTR fs:0x28
  40051c:	00 00
  40051e:	75 07                	jne    400527 <main+0x67>
  400520:	31 c0                	xor    eax,eax
  400522:	48 83 c4 18          	add    rsp,0x18
  400526:	c3                   	ret
  400527:	e8 54 ff ff ff       	call   400480 <__stack_chk_fail@plt>
  40052c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
```

#### gdb
```shell
ieni@ieni ~/D/L/w/b/b/zero_width_bit_field_d> gdb -q zero_width_bit_field_O_2
Reading symbols from zero_width_bit_field_O_2...done.
(gdb) l
1       #include <stdbool.h>
2       #include <stdio.h>
3
4       struct foo {
5               int a: 3;
6               int b: 2;
7               int : 0;
8               int c: 4;
9               int d: 3;
10      };
(gdb) l
11
12
13      int main() {
14
15              int i = 0xFFFF;
16              struct foo *f = (struct foo *)&i;
17              printf("a: %d\nb: %d\nc: %d\nd: %d\n", f->a, f->b, f->c, f->d);
18
19              return 0;
20      }
(gdb) b main
Breakpoint 1 at 0x4004c0: file ./zero_width_bit_field.c, line 13.
(gdb) b 16
Breakpoint 2 at 0x400510: file ./zero_width_bit_field.c, line 16.
(gdb) r
Starting program: /home/ieni/Documents/Linux_kernel_jersv/w1/bit/bit_field/zero_width_bit_field_d/zero_width_bit_field_O_2

Breakpoint 1, main () at ./zero_width_bit_field.c:13
13      int main() {
(gdb) n
15              int i = 0xFFFF;
(gdb) n
104       return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
(gdb) n
a: -1
b: -1
c: 0
d: 0

Breakpoint 2, main () at ./zero_width_bit_field.c:19
19              return 0;
```

#### gdb
```shell
(gdb) p $rsp
$1 = (void *) 0x7fffffffd0f0
(gdb) p &i
$2 = (int *) 0x7fffffffd0f4
(gdb) p &f
Can't take address of "f" which isn't an lvalue.
(gdb) p f
$3 = (struct foo *) 0x7fffffffd0f4
(gdb) p &(f->a)
$4 = (int *) 0x7fffffffd0f4
(gdb) p &(f->c)
$5 = (int *) 0x7fffffffd0f8
(gdb) x/t 0x7fffffffd0f8
0x7fffffffd0f8: 11010011101111111111010000000000
(gdb) p $rsp+8
$9 = (void *) 0x7fffffffd0f8
(gdb) info symbol 0x7fffffffd0f8
No symbol matches 0x7fffffffd0f8.
```

## printf(f)

### O0

yes

#### asm
```asm
0000000000400572 <main>:
  400572:	55                   	push   rbp
  400573:	48 89 e5             	mov    rbp,rsp
  400576:	48 83 ec 20          	sub    rsp,0x20
  40057a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  400581:	00 00
  400583:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400587:	31 c0                	xor    eax,eax
  400589:	c7 45 ec ff ff 00 00 	mov    DWORD PTR [rbp-0x14],0xffff
  400590:	48 8d 45 ec          	lea    rax,[rbp-0x14]
  400594:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  400598:	48 8d 45 ec          	lea    rax,[rbp-0x14]
  40059c:	48 89 c6             	mov    rsi,rax
  40059f:	bf c4 06 40 00       	mov    edi,0x4006c4
  4005a4:	b8 00 00 00 00       	mov    eax,0x0
  4005a9:	e8 c2 fe ff ff       	call   400470 <printf@plt>
  4005ae:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  4005b2:	48 89 c6             	mov    rsi,rax
  4005b5:	bf cd 06 40 00       	mov    edi,0x4006cd
  4005ba:	b8 00 00 00 00       	mov    eax,0x0
  4005bf:	e8 ac fe ff ff       	call   400470 <printf@plt>
  4005c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005c8:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005cc:	01 c0                	add    eax,eax
  4005ce:	c0 f8 05             	sar    al,0x5
  4005d1:	0f be f0             	movsx  esi,al
  4005d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005d8:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005dc:	c1 e0 04             	shl    eax,0x4
  4005df:	c0 f8 04             	sar    al,0x4
  4005e2:	0f be c8             	movsx  ecx,al
  4005e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005ec:	c1 e0 03             	shl    eax,0x3
  4005ef:	c0 f8 06             	sar    al,0x6
  4005f2:	0f be d0             	movsx  edx,al
  4005f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005fc:	c1 e0 05             	shl    eax,0x5
  4005ff:	c0 f8 05             	sar    al,0x5
  400602:	0f be c0             	movsx  eax,al
  400605:	41 89 f0             	mov    r8d,esi
  400608:	89 c6                	mov    esi,eax
  40060a:	bf d6 06 40 00       	mov    edi,0x4006d6
  40060f:	b8 00 00 00 00       	mov    eax,0x0
  400614:	e8 57 fe ff ff       	call   400470 <printf@plt>
  400619:	b8 00 00 00 00       	mov    eax,0x0
  40061e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  400622:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
  400629:	00 00
  40062b:	74 05                	je     400632 <main+0xc0>
  40062d:	e8 2e fe ff ff       	call   400460 <__stack_chk_fail@plt>
  400632:	c9                   	leave
  400633:	c3                   	ret
  400634:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40063b:	00 00 00
  40063e:	66 90                	xchg   ax,ax
```

#### output

```shell
&i = 0x7ffc1c1a185c
&f = 0x7ffc1c1a1860
a: -1
b: -1
c: -4
d: -3
&i = 0x7fff0408d92c
&f = 0x7fff0408d930
a: -1
b: -1
c: -4
d: 2
&i = 0x7fffbb1621cc
&f = 0x7fffbb1621d0
a: -1
b: -1
c: -4
d: -4
&i = 0x7fff5775d03c
&f = 0x7fff5775d040
a: -1
b: -1
c: -4
d: 3
&i = 0x7ffeb22d97dc
&f = 0x7ffeb22d97e0
a: -1
b: -1
c: -4
d: -3
```

#### gdb
```shell
(gdb) p $rpb
$2 = void
(gdb) p $rbp
$3 = (void *) 0x7fffffffd100
(gdb) p &f
$4 = (struct foo **) 0x7fffffffd0f0
(gdb) p &i
$5 = (int *) 0x7fffffffd0ec
```

### O2

yes
#### output

```shell
&i = 0x7ffe37cd13fc
&f = 0x7ffe37cd1400
a: -1
b: -1
c: -4
d: -1
&i = 0x7ffe31122a3c
&f = 0x7ffe31122a40
a: -1
b: -1
c: -4
d: 3
&i = 0x7ffededa935c
&f = 0x7ffededa9360
a: -1
b: -1
c: -4
d: -3
&i = 0x7ffe8dc12fec
&f = 0x7ffe8dc12ff0
a: -1
b: -1
c: -4
d: -2
&i = 0x7fffc4076d2c
&f = 0x7fffc4076d30
a: -1
b: -1
c: -4
d: 2
```

#### assembly
```asm
00000000004004c0 <main>:
  4004c0:	48 83 ec 28          	sub    rsp,0x28
  4004c4:	be e4 06 40 00       	mov    esi,0x4006e4
  4004c9:	bf 01 00 00 00       	mov    edi,0x1
  4004ce:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4004d5:	00 00
  4004d7:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4004dc:	31 c0                	xor    eax,eax
  4004de:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
  4004e3:	c7 44 24 0c ff ff 00 	mov    DWORD PTR [rsp+0xc],0xffff
  4004ea:	00
  4004eb:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
  4004f0:	e8 ab ff ff ff       	call   4004a0 <__printf_chk@plt>
  4004f5:	48 8d 54 24 10       	lea    rdx,[rsp+0x10]
  4004fa:	be ed 06 40 00       	mov    esi,0x4006ed
  4004ff:	31 c0                	xor    eax,eax
  400501:	bf 01 00 00 00       	mov    edi,0x1
  400506:	e8 95 ff ff ff       	call   4004a0 <__printf_chk@plt>
  40050b:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
  400510:	be f6 06 40 00       	mov    esi,0x4006f6
  400515:	bf 01 00 00 00       	mov    edi,0x1
  40051a:	44 0f b6 40 04       	movzx  r8d,BYTE PTR [rax+0x4]
  40051f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  400522:	31 c0                	xor    eax,eax
  400524:	47 8d 0c 00          	lea    r9d,[r8+r8*1]
  400528:	8d 0c d5 00 00 00 00 	lea    ecx,[rdx*8+0x0]
  40052f:	41 c1 e0 04          	shl    r8d,0x4
  400533:	c1 e2 05             	shl    edx,0x5
  400536:	41 c0 f9 05          	sar    r9b,0x5
  40053a:	41 c0 f8 04          	sar    r8b,0x4
  40053e:	c0 f9 06             	sar    cl,0x6
  400541:	c0 fa 05             	sar    dl,0x5
  400544:	45 0f be c9          	movsx  r9d,r9b
  400548:	45 0f be c0          	movsx  r8d,r8b
  40054c:	0f be c9             	movsx  ecx,cl
  40054f:	0f be d2             	movsx  edx,dl
  400552:	e8 49 ff ff ff       	call   4004a0 <__printf_chk@plt>
  400557:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40055c:	64 48 33 34 25 28 00 	xor    rsi,QWORD PTR fs:0x28
  400563:	00 00
  400565:	75 07                	jne    40056e <main+0xae>
  400567:	31 c0                	xor    eax,eax
  400569:	48 83 c4 28          	add    rsp,0x28
  40056d:	c3                   	ret
  40056e:	e8 0d ff ff ff       	call   400480 <__stack_chk_fail@plt>
  400573:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40057a:	00 00 00
  40057d:	0f 1f 00             	nop    DWORD PTR [rax]
```

#### gdb
```shell
(gdb) p $rsp
$4 = (void *) 0x7fffffffd0e0
(gdb) p &f
$5 = (struct foo **) 0x7fffffffd0f0
(gdb) p &i
$6 = (int *) 0x7fffffffd0ec
```
