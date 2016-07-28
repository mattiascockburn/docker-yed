FROM ubuntu:16.04
MAINTAINER Mattias Giese <giese@b1-systems.de>
ENV YED_VERSION 3.14.3
RUN apt-get update ;\
    apt-get -y dist-upgrade ;\
    apt-get -y install unzip wget default-jre

RUN wget --output-document=yed.zip http://www.yworks.com/products/yed/demo/yEd-${YED_VERSION}.zip && \
    unzip /yed.zip -d /opt/

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh ;\
    useradd -m user ;\
    mkdir /work && chown user /work
ENV HOME /home/user
USER user
ENTRYPOINT /entrypoint.sh
