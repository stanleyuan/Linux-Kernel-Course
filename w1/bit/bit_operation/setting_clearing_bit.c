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
