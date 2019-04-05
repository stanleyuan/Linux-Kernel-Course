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
