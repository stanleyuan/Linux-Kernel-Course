#include <stdio.h>

struct foo {
	int a: 3;
	int b: 2;
	int : 0;
	int c: 4;
	int d: 3;
};


int main() {

	int i = 0xFFFF;
	struct foo *f = (struct foo *)&i;
	printf("a: %d\nb: %d\nc: %d\nd: %d\n", f->a, f->b, f->c, f->d);

	return 0;
}
