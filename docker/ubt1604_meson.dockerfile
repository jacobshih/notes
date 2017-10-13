FROM ubuntu:16.04
MAINTAINER jacob_shih
WORKDIR /home

# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get install -y git subversion build-essential wget curl samba nfs-kernel-server python
RUN apt-get install -y python3 python3-pip ninja-build
RUN pip3 install meson
