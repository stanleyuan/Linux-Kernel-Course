#include <stdio.h>

#define CLEARBIT(a, pos) (a &= ~(1 << pos))

int main() {
	/* 'z': 122(=01111010) */
	char a = 'z';

	char aOut = CLEARBIT(a, 5);

	printf("aOut=%c\n", aOut);
	return 0;
}
