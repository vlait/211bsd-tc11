# 211bsd-tc11
tc11 (tu56 dectape) driver for 211bsd

Dec4/2024
-updated disk image to 2.11BSDpl482
-updated patch tbd (install files in the disk image in /home/tu56 though) 

Jan3/2020
-updated the driver to use disklabel and autoconfig, device numbering changed so you *must* recreate the /dev/entries


The driver is almost a copy of unix v7 'tc' driver with minimal changes to make it work on 2.11BSD.

This would likely not work on a real pdp-11 and is really just a proof of concept to run with 
Rene Richarz' Tu56 graphical frontend https://github.com/rricharz/Tu56

2.11BSD_rq.dsk.gz is a (compressed) preconfigured image  (from https://github.com/chasecovello/211bsd-pidp11/ ) 
with the driver already installed.
~~/home/tc/tu56examples contains some usage examples, most expect 2 tape files attached.~~

~~If you want to look at the changes / install the driver yourself there is tc01.tar which contains the changed files
and INSTALL/buildkernel which contain the commands to unpack/build the kernel.~~

~~tc11-211bsd_tq.tap is a tape image containing all the files and install scripts which you can 
attach to tq0 in simh and unpack with tar xf~~

changes required to simh boot.ini:  
```
set tc enabled  
set tc address=17777340  
set tc vector=214  
```
.. and if you want to attach the tapes:  
```
attach  tc0 tu0.tu56  
attach  tc1 tu1.tu56  
```
The above just enables the tc driver on simh and connects the correct memory and interrupt vectors.

The tapes can be used as normal magtapes (but keep in mind they are really block devices and behave like a 
regular disk drive)

The  entries for character devices are /dev/rtcNa where N is the tape unit so creating a tar archive of /home on tape1 would be
```
tar cvf /dev/rtc1a /home
```
.. expect that to fail though as there likely is not enough space on the tape :)

...or you can create a small filesystem on the tape and use is as a normal disk drive:
The block device entries are /dev/tcNa where N is the tape unit.

To create a file system on tape0 and mount it on /tape0
```
disklabel -w -r /dev/rtc0a tu56  
newfs -T tu56 /dev/rtc0a  
fsck -y /dev/rtc0a  
mkdir /tape0  
mount /dev/tc0a /tape0  
```
newfs will read info from /etc/disktab to create a default 'a' partition spanning the entire tape.
fsck is not really mandatory to run as newfs *should* have left the filesystem intact but it doesn't hurt.

/tape0 behaves just like any partition (except it will be *very* slow if you are throttling simh to run at real pdp11 speed)
Note that you really must unmount the tape before detaching/changing tapes - the fs will get very confused otherwise 
and likely ruin the contents of the new tape.



Sorry for the sparse info, if you need more just ask .) 
