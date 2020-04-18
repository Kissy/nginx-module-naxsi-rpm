nginx-rpm
=========

Modified version of [original NGINX RPM packaging](http://hg.nginx.org/pkg-oss/file/tip/rpm) to build [Naxsi](https://github.com/nbs-system/naxsi) dynamic module RPM.

# How to use

Use `wrapper.sh` to build Docker image, then run image to build nginx-module-naxsi RPM.

    ./wrapper.sh build
    ./wrapper.sh run
