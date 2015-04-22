#!/bin/sh -ex
pkg='
build-essential
curl
libcurl4-openssl-dev
libxml2-dev
php5-dev
'

apt-get update -qq
apt-get install -qy $pkg
