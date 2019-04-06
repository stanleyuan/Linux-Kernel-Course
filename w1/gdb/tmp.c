#include <stdio.h>
#include <string.h>

int main() {

	/*Remember the NUL terminator!*/
	enum { str_length = 18U };
	char src[str_length] = "This is a string.", dst[str_length];

	 /*The function call operator in action (notice the function pointer on the left side).*/
	strcpy(dst, src);
	printf("dst: %s\nsrc: %s\n", dst, src);
	printf("strcpy: %p\n", strcpy);
	printf("&strcpy: %p\n", &strcpy);
	printf("-------------------\n");

	/*An ordinary function declaration, for reference*/
	char *strcpy(char *dst, const char *src);
	/*Pointer to strcpy-like function*/
	char *(*strcpy_ptr)(char *dst, const char *src) = &strcpy;
	/*Pointer to pointer to strcpy-like function*/
	char *(**strcpy_ptr_ptr)(char *dst, const char *src) = &strcpy_ptr;
	/*works*/
	strcpy(dst, "this is new strcpy\n");
	/*works*/
	strcpy_ptr(dst, "this is strcpy_ptr\n");
	/*does not work*/
	*strcpy_ptr_ptr(dst, "this is strcpy_ptr\n");

	/*works*/
	strcpy_ptr = strcpy;
	/*This works too*/
	strcpy_ptr = &strcpy;
	printf("strcpy_ptr: %p\n", strcpy_ptr);
	printf("*strcpy_ptr_ptr: %p\n", *strcpy_ptr_ptr);

	strcpy(dst, "this is new strcpy\n");
	printf("dst after strcpy: %s", dst);
	strcpy_ptr(dst, "this is strcpy_ptr\n");
	printf("dst after strcpy_ptr: %s\n", dst);
	/*called object type 'char *(**)(char *, const char *)' is not a function or function pointer*/
	/**strcpy_ptr_ptr(dst, "this is strcpy_ptr\n");*/
	printf("dst after strcpy_ptr: %s\n", dst);

	return 0;
}

// output
dst: This is a string.
src: This is a string.
strcpy: 0x4004d0
&strcpy: 0x4004d0
-------------------
new strcpy: 0x4004d0
new &strcpy: 0x4004d0
strcpy_ptr: 0x4004d0
*strcpy_ptr_ptr: 0x4004d0
dst after strcpy: this is new strcpy
dst after strcpy_ptr: this is strcpy_ptr

dst after strcpy_ptr: this is strcpy_ptr
