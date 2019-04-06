bit-field
===

## tutorial
### [bit tutorial](https://www.tutorialspoint.com/cprogramming/c_bit_fields.htm)

#### Declaration
```c
struct {
	type member_name: width;
};

// type: int, signed int, unsigned int;
// member_name: bit field name;
// width: the width of the bit fields which is <= size of type
```

#### Example
```c
#include <stdio.h>
#include <string.h>

struct {
	unsigned int widthV;
	unsigned int heightV;
} status1;

struct {
	unsigned int widthV : 1;
	unsigned int heightV : 1;
} status2;

struct {
	unsigned int widthV : 32;
	unsigned int heightV : 1;
} status3;

struct {
	char widthV;
	char heightV;
} status4;

struct {
	char widthV : 1;
	char heightV : 1;
} status5;

struct {
	char widthV : 8;
	char heightV : 1;
} status6;

int main() {

	// size of unsigned int: 4 bytes
	printf("two unsigned int status1 size: %ld\n", sizeof(status1));
	printf("two unsigned int status2 size: %ld\n", sizeof(status2));
	printf("two unsigned int status3 size: %ld\n", sizeof(status3));

	// size of char: 1 bytes
	printf("char status4 size: %ld\n", sizeof(status4));
	printf("char status5 size: %ld\n", sizeof(status5));
	printf("char status6 size: %ld\n", sizeof(status6));

	return 0;
}


// output
two unsigned int status1 size: 8
two unsigned int status2 size: 4
two unsigned int status3 size: 8
char status4 size: 2
char status5 size: 1
char status6 size: 2
```

### Reference
-  [geeksforgeeks](https://www.geeksforgeeks.org/bit-fields-c/)


## lecture
### Example
#### Code
```c
#include <stdbool.h>
#include <stdio.h>

bool is_one(int i) {
	return i == 1;
}

int main() {
	struct {
		signed int a: 1;
	} obj = { .a = 1 };
	puts(is_one(obj.a) ? "one" : "not one");
	return 0;
}

// output
not one
```

#### jersv's explaination
在 struct {int a : 1;} obj = {.a = 1 }; 的地方，原本 int 這個資料型態需要 4 bytes 的空間，也就是總共 32 bits ，而我們指定只用其中一個 bit 來放值。

但是因為 a 是 signed integer 所以 two complement 在 1 bit 的範圍內只能表示 0 ~ -1，因此結果是 not one

而決定 1-bit binary 1 為 -1 的是編譯器所定義，可以看到前面的引用提到 implementation-defined 這個詞，代表這個寫法結果是由實作品 (通常是指編譯器) 所決定，並且對於該定義有義務在文件內說明與告知。

如果題目的 int 並沒有說是 signed 或 unsigned ，那麼 bit-field 宣告之後究竟該是 signed / unsigned 是由編譯器所決定的。

## Reference
- [struct (C programming language)](https://en.wikipedia.org/wiki/Struct_(C_programming_language))
