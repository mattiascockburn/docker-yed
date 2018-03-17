docker-yed
==========

yEd is a multi-platform graph editor written in Java: https://www.yworks.com/products/yed
This repository provides Dockerfiles and an example how to run them in order to contain this
beast ^^

* Dockerfile.ubuntu: based on Ubuntu 16.04
* Dockerfile.alpine:  based on Alpine Linux 3.7 and OpenJDK 8 (does not work atm)
* Dockerfile.oracle_jdk: using Alpine and Oracle JRE 8 (current default)

Building
--------

Run `build.sh`

Running
-------

`run.sh.example` shows you how you may run this. Copy it somewhere
(like `/usr/local/bin/yed`) and make it executable or use the
code in a shell function
