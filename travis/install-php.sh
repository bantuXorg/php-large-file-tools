#!/bin/bash
export CCASFLAGS="-m$phpint"
export CPPFLAGS="-m$phpint"
export LDFLAGS="-m$phpint"

if [ -n "$phplfs" ]
then
  export CFLAGS="-m$phpint -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
else
  export CFLAGS="-m$phpint"
fi

# PHP
phpid="php-$phpver"
curl -L "http://php.net/get/$phpid.tar.bz2/from/this/mirror" | tar xj
pushd "$phpid"
./configure \
  --without-pear \
  --with-curl
make
sudo make install
popd

# Xdebug
xdebugid="xdebug-$phpxdebugver"
curl -L "http://xdebug.org/files/$xdebugid.tgz" | tar xz
pushd "$xdebugid"
/usr/local/bin/phpize
./configure --enable-xdebug
make
sudo make install
popd
