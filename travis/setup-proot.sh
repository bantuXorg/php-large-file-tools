#!/bin/bash -ex

if [ ! -e "$prootbin" ]
then
  mkdir -p $(dirname "$prootbin")
  wget http://static.proot.me/proot-x86_64 -O "$prootbin"
  chmod +x "$prootbin"
fi

if [ ! -e "$rootfsdir/etc/passwd" ]
then
  mkdir -p $rootfsdir
  pushd $rootfsdir
  # tar fails because devices can not be created due to not being super user
  curl -L "http://cdimage.ubuntu.com/ubuntu-core/releases/14.04/release/ubuntu-core-14.04.2-core-$rootfsarch.tar.gz" |
    (tar xz 2> /dev/null || true)
  popd
  $prootcmd locale-gen en_US.UTF-8
fi
