# Simple containerized leak detector

Could be useful pattern to detect leaks in CI.

## Running

Here's how to run it

```bash
make docker
```

The `valgrind` output correctly suggests that we are not `free`'ing the allocated memory on line 5
in [`leak.cpp`](./leak.cpp)


```
Program ran successfully
==12== 
==12== HEAP SUMMARY:
==12==     in use at exit: 400 bytes in 1 blocks
==12==   total heap usage: 3 allocs, 2 frees, 77,200 bytes allocated
==12== 
==12== 400 bytes in 1 blocks are definitely lost in loss record 1 of 1
==12==    at 0x4886B58: operator new[](unsigned long) (vg_replace_malloc.c:640)
==12==    by 0x108963: main (leak.cpp:5)
==12== 
==12== LEAK SUMMARY:
==12==    definitely lost: 400 bytes in 1 blocks
==12==    indirectly lost: 0 bytes in 0 blocks
==12==      possibly lost: 0 bytes in 0 blocks
==12==    still reachable: 0 bytes in 0 blocks
==12==         suppressed: 0 bytes in 0 blocks
==12== 
==12== For lists of detected and suppressed errors, rerun with: -s
==12== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```
