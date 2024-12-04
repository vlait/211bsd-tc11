#!bin/sh

curdir=`pwd`
dtime=`date -u | sed s/\://g | awk '{ printf "%d%s%02d%06d\n",$6,$2,$3,$4}'`
cd /
cat ${curdir}/filelist | xargs tar cvf ${curdir}/bck-${dtime}.tar

