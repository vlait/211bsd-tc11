#!/bin/sh
cd /usr/src/sys/conf
./config PIDP11
cd /usr/src/sys/PIDP11
make clean
make && make install 
