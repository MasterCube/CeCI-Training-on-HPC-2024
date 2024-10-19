#!/usr/bin/env python
import signal, time, sys

# to avoid buffering of the stdout
import ctypes
libc = ctypes.CDLL("libc.so.6")


interupted=False
def signal_handler(signum, frame):
    global interupted
    interupted = True

signal.signal(signal.SIGINT, signal_handler)

try:
    start = int(open('state','r').read())
except Exception:
    start =1

stop = 500
for i in range(start, stop):
    if interupted:
        break
    print(i) 
    sys.stdout.flush()
    libc.sync()
    time.sleep(1)

with open('state','w') as f:
    f.write(str(i))

if interupted:
    sys.exit(1)


