FROM ubuntu
MAINTAINER richardspop@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y g++ curl make net-tools wget git pkg-config

RUN mkdir -p /root/cmake

COPY cmake/* /root/cmake/
RUN /root/cmake/cmake-* --skip-license --prefix=/root/cmake/

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/cmake/bin

