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
