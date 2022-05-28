##########
Alpine-Tcc
##########

`Tiny C Compiler <https://bellard.org/tcc/>`_ on Alpine Linux, whose image size is `21 MB`

`https://hub.docker.com/r/naokihori/alpine-tcc <https://hub.docker.com/r/naokihori/alpine-tcc>`_

*****
Usage
*****

Pull Docker image from DockerHub and build:

.. code-block:: console

   $ docker build -t naokihori/alpine-tcc:latest -f Dockerfile .

Run container (mounting files under current directory to ``/home``):

.. code-block:: console

   $ docker run -it --rm -v ${PWD}:/home naokihori/alpine-tcc:latest

*******
Example
*******

Compile ``main.c``, which is

.. code-block:: c

   #include <stdio.h>
   #include <stdlib.h>
   #include <stddef.h>
   #include <math.h>


   int main(void){
     const size_t nitems = 10;
     double *data = NULL;
     data = calloc(nitems, sizeof(double));
     for(size_t i = 0; i < nitems; i++){
       data[i] = sqrt(i);
     }
     for(size_t i = 0; i < nitems; i++){
       printf("%3zu % .7f\n", i, data[i]);
     }
     free(data);
     return 0;
   }

by

.. code-block:: console

   $ /usr/local/bin/tcc main.c

and execute:

.. code-block:: console

   $ ./a.out

giving

.. code-block:: text

   0  0.0000000
   1  1.0000000
   2  1.4142136
   3  1.7320508
   4  2.0000000
   5  2.2360680
   6  2.4494897
   7  2.6457513
   8  2.8284271
   9  3.0000000

****
Note
****

``complex.h`` cannot be used.

