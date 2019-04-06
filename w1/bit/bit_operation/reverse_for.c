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
