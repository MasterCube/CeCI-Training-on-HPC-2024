#!/usr/bin/env python
import signal, time, sys


import time
import sys
import ctypes
libc = ctypes.CDLL("libc.so.6")

start = 1 
stop = 500
for i in range(start, stop):
    print(i) 
    sys.stdout.flush()
    libc.sync()
    time.sleep(1)


