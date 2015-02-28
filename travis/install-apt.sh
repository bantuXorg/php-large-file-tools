#!/bin/sh
PKG=''
if [ "$phpint" -eq "64" ]
then
  PKG="$PKG libcurl4-openssl-dev"
else
  PKG="$PKG libcurl4-openssl-dev:i386 gcc-multilib"
fi

sudo apt-get update
sudo apt-get install $PKG
