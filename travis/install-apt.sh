#!/bin/sh
if [ "$phpint" == "32" ]
then
  sudo apt-get update
  sudo apt-get install gcc-multilib
fi
