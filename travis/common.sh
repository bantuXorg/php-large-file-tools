#!/bin/sh
export phpdir="php-$phpver-$phpint-$phplfs"
export phptarget="$phpdir/target"
export phpbin="$phptarget/bin/php"
export xdebugdir="xdebug-$phpxdebugver-$phpdir"

if [ "$phpint" -eq "32" ]
then
  export rootfsarch='i386'
else
  export rootfsarch='amd64'
fi

export rootfsdir="rootfs-$rootfsarch"
export prootbin='proot/proot-x86_64'
export prootcmd="$prootbin -R $rootfsdir -0"
