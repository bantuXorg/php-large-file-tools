#!/bin/sh -ex
. travis/common.sh
travis/setup-proot.sh
composer install
$prootcmd travis/install-apt.sh
$prootcmd travis/install-php.sh
