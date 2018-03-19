# FROM ioft/i386-ubuntu_core
FROM ubuntu:14.04
MAINTAINER jacob_shih "jacob_shih@alphanetworks.com"

# +++ https://github.com/ioft/dockerhub/blob/master/i386-ubuntu/Dockerfile

RUN echo '#!/bin/sh' > /usr/sbin/policy-rc.d \
&& echo 'exit 101' >> /usr/sbin/policy-rc.d \
&& chmod +x /usr/sbin/policy-rc.d \
\
&& dpkg-divert --local --rename --add /sbin/initctl \
&& cp -a /usr/sbin/policy-rc.d /sbin/initctl \
&& sed -i 's/^exit.*/exit 0/' /sbin/initctl \
\
&& echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
\
&& echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean \
&& echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean \
&& echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean \
\
&& echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages \
\
&& echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes
# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade && apt-get autoremove && apt-get clean

# --- https://github.com/ioft/dockerhub/blob/master/i386-ubuntu/Dockerfile

# install necessary tools
RUN dpkg --add-architecture i386 && \
  apt-get update && apt-get -y install \
    libc6:i386 \
    libstdc++6:i386 \
    libbz2-dev:i386 \
    libexpat1-dev:i386 \
    ncurses-dev:i386

RUN dpkg --add-architecture i386 && \
  apt-get update && apt-get -y install \
    apt-utils \
    subversion \
    build-essential \
    wget \
    curl \
    vim \
    tzdata \
    u-boot-tools \
    cpio \
    bc \
    bison \
    flex \
    sharutils \
    libz-dev \
    libncurses5-dev \
    iputils-ping \
    gcc-multilib \
    g++-multilib \
    sudo

RUN dpkg --add-architecture i386 && \
  apt-get update && apt-get -y install \
    binutils \
    patch \
    bzip2 \
    gettext \
    pkg-config \
    unzip \
    zlib1g-dev \
    zlib1g-dev:i386 \
    libc6-dev \
    gawk \
    libxml-parser-perl \
    ocaml-nox \
    cmake

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc

# install toolchain
RUN svn co http://172.19.176.76/repos/Seattle/w310av_AP100beta/boards/hpw310av_ath/toolchain/ \
  && tar zxvf toolchain/mips-db120-gcc-4.3.3-2.19.1_v004.tgz -C / \
  && rm -rf toolchain

# patch toolchain
# to fix socket.h error expected initializer before 'throw'
# http://lists.busybox.net/pipermail/uclibc/2008-December/041567.html
RUN cd /opt/mips-db120-gcc-4.3.3-2.19.1_v004/usr/include/bits/ \
  && sed -i '271 s/__NTH (//' socket.h \
  && sed -i '272 s/__cmsg))/__cmsg)/' socket.h

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
WORKDIR /home/user
ENV HOME /home/user

# set timezone
#ENV TZ=Asia/Taipei
#RUN dpkg-reconfigure -f noninteractive tzdata

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["su", "user", "-c", "/bin/bash"]
ENTRYPOINT ["linux32", "--"]
