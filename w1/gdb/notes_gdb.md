gdb
===

## Inndy
```bash
# 用 objdump 反組譯 overflow
objdump -d -M intel overflow

# 把 bin 用 hex 的方式表達，寫入到 bin.hex
xxd bin > bin.hex

# 把 bin.hex 解碼成 binary 檔案，寫入到 bin
xxd -r bin.hex > bin
```

#### gdb
```
x/i ADDRESS 查看 ADDRESS 的地方，有什麼指令
x/8i ADDRESS 查看 ADDRESS 的地方，有什麼資料（8個 byte）
r (run)
r < bin 把 bin 這個檔案當作 standard input 輸入給現在的檔案來執行
c (continue)
Ctrl-C 暫停程式，回到 GDB
q 結束 GDB
```

## tutorial
### [Debugging with GDB](http://www.study-area.org/goldencat/debug.htm)
#### c program
```c
#include <stdio.h>

int main() {
	int a, b, c;
	a = 5;
	b = 10;
	b += a;
	c = b + a;
	printf("%d\n", c);

	return 0;
}
```

#### gdb
```sh
gcc -Wall -g test.c -o test
gdb -q test
```
### [除錯工具 gdb (The GNU Project Debugger)](http://welkinchen.pixnet.net/blog/post/60935296-%E9%99%A4%E9%8C%AF%E5%B7%A5%E5%85%B7-gdb-%28the-gnu-project-debugger%29)

## Commands
### frame
show current line

### x
#### syntax
```
x [Address expression]
x /[Format] [Address expression]
x /[Length][Format] [Address expression]
x
```
#### format
- t - binary
- o - octal
- d - decimal
- x - hexadecimal
- u - unsigned decimal
- f - floating point
- a - address
- c - char
- s - string
- i - instruction

The following size modifiers are supported:
- b - byte
- h - halfword (16-bit value)
- w - word (32-bit value)
- g - giant word (64-bit value)
