FROM ubuntu:16.04
MAINTAINER jacob_shih

# update ubuntu software repository
RUN apt-get update

# install necessary tools
RUN apt-get install -y git subversion build-essential wget curl samba nfs-kernel-server
RUN apt-get install -y sudo vim tzdata
RUN apt-get install -y u-boot-tools cpio bc

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
WORKDIR /home/user
ENV HOME /home/user

# set timezone
#ENV TZ=Asia/Taipei
#RUN dpkg-reconfigure -f noninteractive tzdata
