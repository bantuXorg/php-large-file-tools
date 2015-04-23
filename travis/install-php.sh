#!/bin/bash -ex
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
mkdir -p "$phpdir"
pushd "$phpdir"
if [ ! -e "./LICENSE" ]
then
  curl -L "http://php.net/get/php-$phpver.tar.bz2/from/this/mirror" |
    tar xj --strip-components=1
fi
./configure \
  --disable-cgi \
  --prefix="$(pwd)/target" \
  --without-pear \
  --with-curl \
  > /dev/null
make > /dev/null
make install
popd

# Xdebug
mkdir -p "$xdebugdir"
pushd "$xdebugdir"
if [ ! -e "./LICENSE" ]
then
  curl -L "http://xdebug.org/files/xdebug-$phpxdebugver.tgz" |
    tar xz --strip-components=1
fi
"../$phptarget/bin/phpize"
./configure \
  --enable-xdebug \
  --with-php-config="../$phptarget/bin/php-config" \
  > /dev/null
make > /dev/null
make install
popd
