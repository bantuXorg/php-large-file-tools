#!/bin/bash -ex

genid() {
  echo -n "$1" | md5sum | cut -d ' ' -f 1
}

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
php_configure_args="
  --disable-cgi
  --prefix=$(pwd)/target
  --without-pear
  --with-curl
"
php_build_id=$(genid "$php_configure_args")
if [[ ! -e './.bn2buildid' || "$(cat './.bn2buildid')" != "$php_build_id" ]]
then
  ./configure $php_configure_args > /dev/null
  make > /dev/null
  make install
  echo -n "$php_build_id" > ./.bn2buildid
fi
popd

# Xdebug
mkdir -p "$xdebugdir"
pushd "$xdebugdir"
if [ ! -e "./LICENSE" ]
then
  curl -L "http://xdebug.org/files/xdebug-$phpxdebugver.tgz" |
    tar xz --strip-components=1
fi
xdebug_configure_args="
  --enable-xdebug
  --with-php-config=../$phptarget/bin/php-config
"
xdebug_build_id=$(genid "$xdebug_configure_args")
if [[ ! -e './.bn2buildid' || "$(cat './.bn2buildid')" != "$xdebug_build_id" ]]
then
  "../$phptarget/bin/phpize"
  ./configure $xdebug_configure_args > /dev/null
  make > /dev/null
  make install
  echo -n "$xdebug_build_id" > ./.bn2buildid
fi
popd
