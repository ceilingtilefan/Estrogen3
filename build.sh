gmake clean
rm ./packages/*.deb
gmake -j$(sysctl -n hw.ncpu) package DEBUG=0 FINALPACKAGE=1