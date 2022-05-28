############
Alpine-CUnit
############

C unit test for personal use

`https://hub.docker.com/r/naokihori/alpine-cunit <https://hub.docker.com/r/naokihori/alpine-cunit>`_

*****
Usage
*****

Pull Docker image from DockerHub and build:

.. code-block:: console

   $ docker build -t naokihori/alpine-cunit:latest -f Dockerfile .

Run container (mounting files under current directory to ``/home``):

.. code-block:: console

   $ docker run -it --rm -v ${PWD}:/home naokihori/alpine-cunit:latest

Compiling and executing tests by

.. code-block:: console

   $ cd test; make; ./test.out

gives e.g.,

.. code-block:: text

   Starting CUnit test:
    ./a.out
   JUnit XML:
    a.out-Results.xml

   Running Suite : my-suite
        Running Test : test_simple_pass1 ..PASSED

   Run Summary       -      Run    Failed  Inactive   Skipped
        Suites       :        1         0         0         0
        Asserts      :        1         0       n/a       n/a
        Tests        :        1         0         0         0

   Elapsed Time: 0.000(s)

