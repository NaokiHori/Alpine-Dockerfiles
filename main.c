#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>


int main(void){
  const size_t nitems = 10;
  double *data = NULL;
  data = calloc(nitems, sizeof(double));
  for(size_t i = 0; i < 2*nitems; i++){ // illegal memory access
    printf("%3zu % .7f\n", i, data[i]);
  }
  free(data);
  return 0;
}

