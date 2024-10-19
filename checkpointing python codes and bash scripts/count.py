#!/usr/bin/env python
import signal, time, sys
import ctypes
libc = ctypes.CDLL("libc.so.6")

try:
    start = int(open('state','r').read())
except Exception:
    start =1

stop = 500
for i in range(start, stop):
    print(i) 
    with open('state', 'w') as fsock:
        fsock.write(str(i+1))
    sys.stdout.flush()
    libc.sync()
    time.sleep(1)


