###############
Alpine-Valgrind
###############

Memory leak checker for personal use

`https://hub.docker.com/r/naokihori/alpine-valgrind <https://hub.docker.com/r/naokihori/alpine-valgrind>`_

*****
Usage
*****

Pull Docker image from DockerHub and build:

.. code-block:: console

   $ docker build -t naokihori/alpine-valgrind:latest -f Dockerfile .

Run container (mounting files under current directory to ``/home``):

.. code-block:: console

   $ docker run -it --rm -v ${PWD}:/home naokihori/alpine-valgrind:latest

Compile and execute:

.. code-block:: console

   $ make clean; make; valgrind -s --leak-check=full ./a.out

giving e.g.,

.. code-block:: text

   ==53== Memcheck, a memory error detector
   ==53== Copyright (C) 2002-2022, and GNU GPL'd, by Julian Seward et al.
   ==53== Using Valgrind-3.19.0 and LibVEX; rerun with -h for copyright info
   ==53== Command: ./a.out
   ==53==
   ==53== Invalid read of size 8
   ==53==    at 0x10925B: main (in /home/a.out)
   ==53==  Address 0x48b1090 is 0 bytes after a block of size 80 alloc'd
   ==53==    at 0x48A6BEE: calloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
   ==53==    by 0x10923D: main (in /home/a.out)
   ==53==
   ==53==
   ==53== HEAP SUMMARY:
   ==53==     in use at exit: 0 bytes in 0 blocks
   ==53==   total heap usage: 1 allocs, 1 frees, 80 bytes allocated
   ==53==
   ==53== All heap blocks were freed -- no leaks are possible
   ==53==
   ==53== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
   ==53==
   ==53== 1 errors in context 1 of 1:
   ==53== Invalid read of size 8
   ==53==    at 0x10925B: main (in /home/a.out)
   ==53==  Address 0x48b1090 is 0 bytes after a block of size 80 alloc'd
   ==53==    at 0x48A6BEE: calloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
   ==53==    by 0x10923D: main (in /home/a.out)
   ==53==
   ==53== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)

