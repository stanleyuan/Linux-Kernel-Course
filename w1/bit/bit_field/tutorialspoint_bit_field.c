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
