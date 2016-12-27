FROM ubuntu:16.04
MAINTAINER Mattias Giese <giese@b1-systems.de>

ENV YED_VERSION 3.16.2.1

# Add a PPA repo that provides Oracle Java.
# Ref: <https://launchpad.net/~webupd8team/+archive/ubuntu/java>.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7B2C3B0889BF5709A105D03AC2518248EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/java.list

# Auto-accept the Oracle license.
# Ref: <http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html>.
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get update ;\
    apt-get -y dist-upgrade ;\
    apt-get -y install libxi-dev libxrender-dev libxtst6 oracle-java8-installer unzip wget

RUN wget --output-document=yed.zip http://www.yworks.com/products/yed/demo/yEd-${YED_VERSION}.zip && \
    unzip /yed.zip -d /opt/

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh ;\
    useradd -m user ;\
    mkdir /work && chown user /work
ENV HOME /home/user
USER user
ENTRYPOINT /entrypoint.sh
