#include <stdio.h>

int main() {
	int *rbp = 0;
	int *fs = 0;

	*(rbp-0x8) = rax;
	int eax = 0;
	*(rbp-0x14) = 0xffff;
	int rax = rbp-0x14;
	*(rbp-0x10) = rax;

}
