bit operation
===

## Operation
```c
// bitwise xor
x ^ y

// left shift
// times by 2^n
1 << n

// right shift
// divied by 2^b
1 >> n
```

## Trick
#### set, clear, toggle, most, sign bit
```c
// set a bit
unsigned char a |= (1 << n);

// clear a bit
unsigned char b &= ~(1 << n);

// toggle a bit
unsigned char c ^= (1 << n);

// test a bit
unsigned char e = d & (1 << n);

// the right/left most byte
// assuming 16bits/2-byte short integer
unsigned char right = val & 0xff;
unsigned char left = (val >> 8) & 0xff;

// sign bit
bool sign = val & 0x8000;
```

**Example: clear a bit**
```c
#include <stdio.h>

#define CLEARBIT(a, pos) (a &= ~(1 << pos))

int main() {
	/* 'z': 122(=01111010) */
	char a = 'z';

	char aOut = CLEARBIT(a, 5);

	printf("aOut = %c\n", aOut);
	return 0;
}
```

**Example: Setting and Clearing a Bit**
```c
#include <stdio.h>
#include <stdbool.h>

void binary(unsigned int n) {
	for (int i = 256; i > 0; i /= 2) {
		if (n & i)
			printf(" 1");
		else
			printf(" 0");
	}
	printf("\n");
}

bool getBit(int n, int index) {
	return ((n & (1 << index)) > 0);
}

int setBit(int n, int index, bool b) {
	if (b)
		return (n | (1 << index));
	return (n & ~(1 << index));
}

int main() {
	int num = 16, index;

	printf("Input\n");
	binary(num);

	index = 6;
	printf("setting %d-th bit\n", index);
	num = setBit(num, index, true);
	binary(num);

	index = 4;
	printf("unsetting %d-th bit\n", index);
	num = setBit(num, index, false);
	binary(num);

	return 0;
}
```

## Test Q1
```c
#include <stdint.h>
	uint32_t func(uint32_t x) {
		uint32_t n = x;
        n = ((n & 0xffff0000) >> 16) | ((n & 0x0000ffff) << 16);
        n = ((n & 0xff00ff00) >>  8) | ((n & 0x00ff00ff) <<  8);
        n = ((n & 0xf0f0f0f0) >>  4) | ((n & 0x0f0f0f0f) <<  4);
        n = ((n & 0xcccccccc) >>  2) | ((n & 0x33333333) <<  2);
        n = ((n & 0xaaaaaaaa) >>  1) | ((n & 0x55555555) <<  1);
        return n;
    }
```

**check**
```c
#include <stdint.h>
#include <stdio.h>

void binary (uint32_t n) {
	int num = 31;
	while (num >= 0) {
		if (n & (1 << num))
			printf(" 1");
		else
			printf(" 0");

		if (num % 4 == 0 && num != 0)
			printf(" ,");

		num -= 1;
	}
	printf("\n");
}

uint32_t func(uint32_t x) {
	// swap bits of x
	uint32_t n = x;
	printf("0x%x\n", n);
	binary(n);
	// swap two bytes
	n = ((n & 0xffff0000) >> 16) | ((n & 0x0000ffff) << 16);
	printf("0x%x\n", n);
	binary(n);
	// swap byte
	n = ((n & 0xff00ff00) >>  8) | ((n & 0x00ff00ff) <<  8);
	printf("0x%x\n", n);
	binary(n);
	// swap half byte
	n = ((n & 0xf0f0f0f0) >>  4) | ((n & 0x0f0f0f0f) <<  4);
	printf("0x%x\n", n);
	binary(n);
	// swap consecutive pairs
	n = ((n & 0xcccccccc) >>  2) | ((n & 0x33333333) <<  2);
	printf("0x%x\n", n);
	binary(n);
	// swap consecutive bits
	n = ((n & 0xaaaaaaaa) >>  1) | ((n & 0x55555555) <<  1);
	printf("0x%x\n", n);
	binary(n);
	return n;
}

int main() {
	uint32_t n = 0x12345678;
	func(n);

	return 0;
}

// outut
0x12345678
 0 0 0 1 , 0 0 1 0 , 0 0 1 1 , 0 1 0 0 , 0 1 0 1 , 0 1 1 0 , 0 1 1 1 , 1 0 0 0
0x56781234
 0 1 0 1 , 0 1 1 0 , 0 1 1 1 , 1 0 0 0 , 0 0 0 1 , 0 0 1 0 , 0 0 1 1 , 0 1 0 0
0x78563412
 0 1 1 1 , 1 0 0 0 , 0 1 0 1 , 0 1 1 0 , 0 0 1 1 , 0 1 0 0 , 0 0 0 1 , 0 0 1 0
0x87654321
 1 0 0 0 , 0 1 1 1 , 0 1 1 0 , 0 1 0 1 , 0 1 0 0 , 0 0 1 1 , 0 0 1 0 , 0 0 0 1
0x2d951c84
 0 0 1 0 , 1 1 0 1 , 1 0 0 1 , 0 1 0 1 , 0 0 0 1 , 1 1 0 0 , 1 0 0 0 , 0 1 0 0
0x1e6a2c48
 0 0 0 1 , 1 1 1 0 , 0 1 1 0 , 1 0 1 0 , 0 0 1 0 , 1 1 0 0 , 0 1 0 0 , 1 0 0 0
```

#### for loop version
```c
#include <stdint.h>
#include <stdio.h>

void print_binary(uint32_t x) {
	int num = 31;
	while (num >= 0) {
		if (x & (1 << num))
			printf(" 1");
		else
			printf(" 0");
		if (num % 4 == 0 && num != 0)
			printf(" ,");

		num -= 1;
	}
}

uint32_t reverse_bits_32(uint32_t x) {
	uint32_t reverse_x = 0;
	for (int i = 0; i < 32; i += 1) {
		// if ((x & (1 << i)))
			// reverse_x |= (1 << (32-1-i));
		reverse_x |= ((x >> (32-1-i) & 1) << i);
	}
	return reverse_x;
}

int main() {
	uint32_t reverse = 0x12345678;
	print_binary(reverse);
	printf(" %x\n", reverse);
	reverse = reverse_bits_32(reverse);
	print_binary(reverse);
	printf(" %x\n", reverse);
	reverse = reverse_bits_32(reverse);
	print_binary(reverse);
	printf(" %x\n", reverse);

}

// output
0 0 0 1 , 0 0 1 0 , 0 0 1 1 , 0 1 0 0 , 0 1 0 1 , 0 1 1 0 , 0 1 1 1 , 1 0 0 0 12345678
0 0 0 1 , 1 1 1 0 , 0 1 1 0 , 1 0 1 0 , 0 0 1 0 , 1 1 0 0 , 0 1 0 0 , 1 0 0 0 1e6a2c48
0 0 0 1 , 0 0 1 0 , 0 0 1 1 , 0 1 0 0 , 0 1 0 1 , 0 1 1 0 , 0 1 1 1 , 1 0 0 0 12345678
```

#### 16 bits version
```c
#include <stdint.h>
#include <stdio.h>

void print_binary(uint16_t x) {
	int n = 16-1;
	for (int i = n; i >= 0; i -= 1) {
		if (x & (1 << i))
			printf(" 1");
		else
			printf(" 0");

		if (i % 4 == 0 && i > 0)
			printf(",");
	}
	printf("\n");
}

void func(uint16_t x) {
	uint16_t n = x;
	printf("0x%x\n", n);
	print_binary(n);
	// swap byte
	n = ((n & 0xff00) >>  8) | ((n & 0x00ff) <<  8);
	printf("0x%x\n", n);
	print_binary(n);
	// swap half byte
	n = ((n & 0xf0f0) >>  4) | ((n & 0x0f0f) <<  4);
	printf("0x%x\n", n);
	print_binary(n);
	// swap consecutive pairs
	n = ((n & 0xcccc) >>  2) | ((n & 0x3333) <<  2);
	printf("0x%x\n", n);
	print_binary(n);
	// swap consecutive bits
	n = ((n & 0xaaaa) >>  1) | ((n & 0x5555) <<  1);
	printf("0x%x\n", n);
	print_binary(n);
}

uint16_t reverse_bits_16(uint16_t x) {
	uint16_t reverse_x = 0;
	for (int i = 0; i < 16; i += 1)
		reverse_x |= ((x >> (16-1-i) & 1) << i);
	return reverse_x;
}

int main() {
	uint16_t test = 0x1234;
	func(test);
	printf("-----------------------------------\n");
	for(int i = 0; i < 2; i += 1){
	print_binary(test);
	test = reverse_bits_16(test);
	}

	return 0;
}
```

## Application of bit reversing
### [C program to check little vs. big endian](https://stackoverflow.com/questions/12791864/c-program-to-check-little-vs-big-endian/12792301#12792301)
### c code
```c
int main()
{
  int x = 1;

  char *y = (char*)&x;

  printf("%c\n",*y+48);
}
```

#### Little endian
```c
	higher memory
          ----->
    +----+----+----+----+
    |0x01|0x00|0x00|0x00|
    +----+----+----+----+
    A
    |
   &x

(char*)(&x) == 1, and *y+48 == '1'

// in gdb

(gdb) p &x
$1 = (int *) 0x7fffffffd16c
(gdb) p y
$2 = 0x7fffffffd16c "\001"
(gdb) x/t 0x7fffffffd16c
//						high  	<- 		low
0x7fffffffd16c: 0000, 0000 | 0000, 0000 | 0000, 0000 | 0000,0001
(gdb) p *y
$3 = 1 '\001'
```

#### Big endian
```c
	+----+----+----+----+
    |0x00|0x00|0x00|0x01|
    +----+----+----+----+
    A
    |
   &x
(char*)(&x) == 0, and *y+48 == '0'
```

### [Big endian and little endian](https://betterexplained.com/articles/understanding-big-and-little-endian-byte-order/)

#### Number and Data
##### Number
A number is an abstract concept, such as a count of something. You have ten fingers.
The idea of "ten" doesn't change, no matter what representation you use: ten, 10, diez (Spanish), ju (Japanese), 1010 (binary), X (Roman numeral)...
these representations all point to the same concept of "ten".

##### Data
Contrast this with data. Data is a physical concept, a raw sequence of bits and bytes stored on a computer.
Data has no inherent meaning and must be interpreted by whoever is reading it.
Data is like human writing, which is simply marks on paper. There is no inherent meaning in these marks.
If we see a line and a circle (like this: |O) we may interpret it to mean "ten".

##### Data format aggrement
- bit has two values (on or off, 1 or 0)
- A byte is a sequence of 8 bits
	- The "leftmost" bit in a byte is the biggest. So, the binary sequence 00001001 is the decimal number 9. 00001001 = (23 + 20 = 8 + 1 = 9).
	- Bits are numbered from right-to-left. Bit 0 is the rightmost and the smallest; bit 7 is leftmost and largest.

#### Problem
Problems happen when computers try to read multiple bytes.
Some data types contain multiple bytes, like long integers or floating-point numbers.
A single byte has only 256 values, so can store 0 - 255.

Now problems start - when you read multi-byte data, where does the biggest byte appear?
- Big endian machine: Stores data big-end first. When looking at multiple bytes, the first byte (lowest address) is the biggest.
- Little endian machine: Stores data little-end first. When looking at multiple bytes, the first byte is smallest.
	- x86 machine

##### Example
```c
Byte Name:    W       X       Y       Z
Location:     0       1       2       3
Value (hex):  0x12    0x34    0x56    0x78

short *s; // pointer to a short int (2 bytes)
s = 0;    // point to location 0; *s is the value
```
- Big endian machine: 0x1234
- Little endian machine: 0x3412

##### NUXI Problem

Big endian machine
```
Byte:     U N I X
Location: 0 1 2 3
```

Little endian machine
```
Byte:     N U X I
Location: 0 1 2 3
```

##### reason
Each byte-order system has its advantages.

Little-endian machines let you read the lowest-byte first, without reading the others.
You can check whether a number is odd or even (last bit is 0) very easily, which is cool if you're into that kind of thing.

Big-endian systems store data in memory the same way we humans think about data (left-to-right), which makes low-level debugging easier.
