#include <stdio.h>


struct bf {
  unsigned int m1 : 8;
  unsigned int m2 : 8;
  unsigned int m3 : 8;
  unsigned int m4 : 8;
};

/*int main() {*/
  /*struct bf data;*/
  /*unsigned char *ptr;*/

  /*data.m1 = 0;*/
  /*data.m2 = 0;*/
  /*data.m3 = 0;*/
  /*data.m4 = 0;*/
  /*ptr = (unsigned char *)&data;*/
  /*(*ptr)++;*/

  /*printf("m1: %d\nm2: %d\nm3: %d\nm4: %d\n", data.m1, data.m2, data.m3, data.m4);*/
  /*return 0;*/
/*}*/
/*struct bf {*/
  /*unsigned int m1 : 6;*/
  /*unsigned int m2 : 4;*/
/*};*/

int main() {
  unsigned char *ptr;
  struct bf data;
  data.m1 = 0;
  data.m2 = 0;
  ptr = (unsigned char *)&data;
  ptr++;
  *ptr += 1;

  printf("m1: %d\nm2: %d\n", data.m1, data.m2);

  return 0;
}
/*int main()*/
/*{*/
  /*// on little endian systems, twoBytes is stored as 0x01, 0x00 and*/
  /*// on big    endian systems, twoBytes is stored as 0x00, 0x01*/
  /*short twoBytes = 0x0001;*/
  /*// get first byte of twoBytes*/
  /*char  oneByte  = *(char*) &twoBytes;*/
  /*if (oneByte == 1)*/
    /*puts("little endian");*/
  /*else*/
    /*puts("big endian");*/
  /*return 0;*/
/*}*/
