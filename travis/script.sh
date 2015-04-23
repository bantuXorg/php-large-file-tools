#!/bin/bash -ex
. travis/common.sh

xdebug=xdebug.so
if [ $($prootcmd "$phpbin" -r "echo (int) version_compare(PHP_VERSION, '5.5.0', '<');") == "1" ]
then
    xdebug=$(find "$phptarget" -type f -name "$xdebug")
fi

$prootcmd \
  "$phpbin" \
    -d zend_extension="$xdebug" \
    vendor/bin/phpunit \
      --coverage-clover coverage.xml \
      --verbose
