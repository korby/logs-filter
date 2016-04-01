#!/bin/sh
cwd=`pwd`
cp lgfilter.sh debian_package/usr/share/logs-filter/
cp -R lib debian_package/usr/share/logs-filter/
cd debian_package/usr/bin/;
ln -s ../share/logs-filter/lgfilter.sh lgfilter
chmod +x lgfilter;
cd $cwd;
dpkg --build debian_package lgfilter.deb

rm -rf debian_package/usr/share/logs-filter/*
rm debian_package/usr/bin/*
