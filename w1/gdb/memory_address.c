#include <stdio.h>
#include <stdint.h>

uint64_t array[3] = {
	0x0123456789ABCDEF,
	0xAABBCCDD99887766,
	0x1111222233445566
};


int main() {
	printf("&array = %p\n", &array);
	for (int i = 0; i < 3; i += 1) {
		printf("&array[%d] = %p\n", i, &array[i]);
	}
}
