# 211bsd-tc11
tc11 (tu56 dectape) driver for 211bsd

The driver is almost a copy of ynix v7 tc driver with minimal changes.
There is no disktab support so the driver expects /etc/disktab to contain the correct entries 
if the tape is to be mounted.
This would likely not work on a real pdp-11 and is really just a proof of concept to run with 
Rene Richarz' Tu56 graphical frontend https://github.com/rricharz/Tu56

2.11BSD_rq.dsk.gz is a (compressed) preconfigured image  (from https://github.com/chasecovello/211bsd-pidp11/ ) 
with the driver already installed.
/home/tc/tu56examples contains some usage examples, most expect 2 tape files attached.

If you want to look at the changes / install the driver yourself there is tc01.tar which contains the changed files
and INSTALL/buildkernel which contain the commands to unpack/build the kernel.

 tc11-211bsd_tq.tap is a tape image containing all the files which you can attach to tq0 in simh and unpack with tar xf

changes required to simh boot.ini:
set tc enabled
set tc address=17777340
set tc vector=214

.. and if you want to attach the tapes:
attach  tc0 tu0.tu56
attach  tc1 tu1.tu56

The above just enables the tc driver on simh and connects the correct memory and interrupt vectors.

Sorry for the sparse info, if you need more just ask .) 
