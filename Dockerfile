FROM ubuntu
MAINTAINER richardspop@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y g++ curl make net-tools wget git pkg-config apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release

RUN mkdir -p /root/cmake

COPY cmake/* /root/cmake/
RUN /root/cmake/cmake-* --skip-license --prefix=/root/cmake/

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/cmake/bin

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update

RUN apt-get install -y docker-ce docker-ce-cli containerd.io
