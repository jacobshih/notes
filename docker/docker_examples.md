
# docker examples

1. [create a ubuntu 14.04 container for arm 4.3.2 toolchain](#create_ubuntu_1404_container_for_arm_toolchain)
1. [create a ubuntu 16.04 container for meson build system](#create_ubuntu_1604_container_for_meson_build_system)
1. [create a ubuntu 16.04 container for hc1892 sdk](#create_ubuntu_1604_container_for_hc1892_sdk)
1. [create a ubuntu 16.04 container for dhpw310ava1](#create_ubuntu_1604_container_for_dhpw310ava1)

---

<a name="create_ubuntu_1404_container_for_arm_toolchain" />

### create a ubuntu 14.04 container for arm 4.3.2 toolchain
1. create a container with admin privilege and start it.
```
docker create -it --name ubt1404 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH ubuntu:14.04
docker start ubt1404
docker attach ubt1404
```

2. install necessary applications in the container.
```
apt-get update
apt-get install -y git subversion build-essential wget curl samba nfs-kernel-server python
```

3. install necessary libraries for arm 4.3.2 toolchain in the container.
```
apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
```

4. install arm 4.3.2 toolchain.
```
mkdir -p /usr/local/arm/4.3.2
tar jxvf arm-2011.03.tar.bz2
mv arm-2011.03/* /usr/local/arm/4.3.2/
```

5. stop the container
```
docker stop ubt1404
```

6. create a docker image.
```
docker commit -m 'arm-4.3.2' -a 'jacob_shih' ubt1404 alphadocker/ubt1404_arm-4.3.2:0.01
```

7. create a container from the created image.
```
docker run -it --name ubt1404_working alphadocker/ubt1404_arm-4.3.2:0.01
```

8. working.
```
mkdir -p /home/ipcam; cd /home/ipcam
svn co http://172.19.176.90/hwtest/AHAL/AMD-H161
svn co http://172.19.176.90/hwtest/AHAL/h
cd AMD-H161/
source source.arm
make
```

9. to save the image to tar file.
```
docker save -o ubt1404_arm-4.3.2.tar alphadocker/ubt1404_arm-4.3.2:0.01
```

10. load the saved image (from another host maybe...)
```
docker load --input ubt1404_arm-4.3.2.tar
```

---

<a name="create_ubuntu_1604_container_for_meson_build_system" />

### create a ubuntu 16.04 container for meson build system

1. create a dockerfile for meson build system.
```
FROM ubuntu:16.04
MAINTAINER jacob_shih
WORKDIR /home

# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get install -y git subversion build-essential wget curl samba nfs-kernel-server python
RUN apt-get install -y python3 python3-pip ninja-build
RUN pip3 install meson
```

2. build docker image from dockerfile.
```
docker build -f ubt1604_meson.dockerfile -t alphadocker/ubt1604_meson:0.01 .
```

3. create a container from the created image.
```
docker run -it --name ubt1604_meson_working --dns 172.19.10.100 alphadocker/ubt1604_meson:0.01
```

4. working.

- maybe you will install anpm.
- or check out source code and build it with meson/ninja.

5. stop the container
```
docker stop ubt1604_meson_working
```

6. create a docker image.
```
docker commit -m 'meson build system and anpm' -a 'jacob_shih' ubt1604_meson_working alphadocker/ubt1604_meson_working:0.01
```

7. to save the image to tar file.
```
docker save -o ubt1604_meson_anpm.tar alphadocker/ubt1604_meson_working:0.01
```

8. load the saved image (from another host maybe...)
```
docker load --input ubt1604_meson_anpm.tar
```

---
<a name="create_ubuntu_1604_container_for_hc1892_sdk" />

### create a ubuntu 16.04 container for hc1892 sdk
1. create a dockerfile for meson build system.
```
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

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
WORKDIR /home/user
ENV HOME /home/user
```

2. build docker image from dockerfile.
```
docker build -f ubt1604_hc1892_user.dockerfile -t alphadocker/ubt1604_hc1892_user:0.02 .
```

- list the images.
```
docker images
```
```
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
alphadocker/ubt1604_hc1892_user      0.01                ea55005d7402        2 days ago          539MB
alphadocker/ubt1604_hc1892_user      0.02                ea55005d7402        2 days ago          539MB
alphadocker/ubt1604_hc1892_1031      0.01                ea55005d7402        2 days ago          539MB
alphadocker/ubt1604_meson_20171016   0.01                e6089e941d76        2 weeks ago         676MB
alphadocker/ubt1404_arm-4.3.2        0.01                3226ca45cfe8        2 weeks ago         886MB
ubuntu                               16.04               747cb2d60bbe        3 weeks ago         122MB
ubuntu                               14.04               302fa07d8117        6 months ago        188MB
ubuntu                               10.04               e21dbcc7c9de        3 years ago         183MB
```

3. create a container from the created image.
- create a container.
```
docker create -it --name ubt1604_hc1892_user --dns 172.19.10.100 alphadocker/ubt1604_hc1892_user:0.02
```

- or to mount a host folder to the container.
```
docker create -it --name ubt1604_hc1892_user --dns 172.19.10.100 -v /home/jacob_shih/volumes/repo/:/home/user/repo alphadocker/ubt1604_hc1892_user:0.02
```

- start the container.
```
docker start ubt1604_hc1892_user
```

- execute the container.
```
docker exec -it ubt1604_hc1892_user su user -c /bin/bash
```

- note: use **docker run** to create and run a container may cause **fakeroot** forcing to exit the container.
```
jacob_shih:containers$ docker run -it --name ubt1604_hc1892_1031 --dns 172.19.10.100 -v /home/jacob_shih/volumes/repo:/home/user/repo alphadocker/ubt1604_hc1892_1031:0.01
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
user@841eb4aba2e5:~$
user@841eb4aba2e5:~$
user@841eb4aba2e5:~$ fakeroot ls -l
total 4
drwxrwxr-x 6 root root 4096 Oct 31 02:27 repo
jacob_shih:containers$
```

- **docker run** vs **docker exec**

  [https://stackoverflow.com/a/35592000](https://stackoverflow.com/a/35592000)

4. working.
- reconfigure timezone in new container.
```
sudo dpkg-reconfigure tzdata
```

- check out source code and build it.
```
svn checkout http://path.to/project/source working
cd working
source source.me
make
```

5. save the image to tar file.
```
docker save -o ubt1604_hc1892_user-0.01.tar alphadocker/ubt1604_hc1892_user:0.01
```

6. load the saved image (from another host maybe...)
```
docker load --input ubt1604_hc1892_user-0.01.tar
```

7. show the history of the image.
```
Usage:  docker history [OPTIONS] IMAGE
```

```
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
2f66e9ad088a        16 hours ago        /bin/sh -c #(nop)  ENV HOME=/home/user          0B
<missing>           16 hours ago        /bin/sh -c #(nop) WORKDIR /home/user            0B
<missing>           16 hours ago        /bin/sh -c #(nop)  USER [user]                  0B
<missing>           16 hours ago        /bin/sh -c chmod 0440 /etc/sudoers.d/user       29B
<missing>           16 hours ago        /bin/sh -c echo "user ALL=(root) NOPASSWD:...   29B
<missing>           16 hours ago        /bin/sh -c useradd -c 'docker user' -m -d ...   336kB
<missing>           16 hours ago        /bin/sh -c echo no | dpkg-reconfigure dash      1.57MB
<missing>           16 hours ago        /bin/sh -c apt-get install -y u-boot-tools...   1.64MB
<missing>           16 hours ago        /bin/sh -c apt-get install -y sudo vim tzdata   52.3MB
<missing>           16 hours ago        /bin/sh -c apt-get install -y git subversi...   322MB
<missing>           16 hours ago        /bin/sh -c apt-get update                       39.1MB
<missing>           6 days ago          /bin/sh -c #(nop)  MAINTAINER jacob_shih        0B
<missing>           9 days ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           9 days ago          /bin/sh -c mkdir -p /run/systemd && echo '...   7B
<missing>           9 days ago          /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.76kB
<missing>           9 days ago          /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           9 days ago          /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B
<missing>           9 days ago          /bin/sh -c #(nop) ADD file:5b334adf9d9a225...   122MB
```

---
<a name="create_ubuntu_1604_container_for_dhpw310ava1" />

### create a ubuntu 16.04 container for dhpw310ava1
1. create a dockerfile for meson build system.
```
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

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
WORKDIR /home/user
ENV HOME /home/user
```

2. build docker image from dockerfile.
```
docker build -f ubt1604_dhpw310ava1.dockerfile -t alphadocker/ubt1604_dhpw310ava1:0.01 .
```

- list the images.
```
docker images
```
```
REPOSITORY                        TAG                 IMAGE ID            CREATED             SIZE
alphadocker/ubt1604_dhpw310ava1   0.01                ea55005d7402        4 months ago        539MB
alphadocker/ubt1604_hc1892_user   0.02                ea55005d7402        4 months ago        539MB
ubuntu                            16.04               747cb2d60bbe        4 months ago        122MB
ubuntu                            14.04               302fa07d8117        10 months ago       188MB
ubuntu                            10.04               e21dbcc7c9de        3 years ago         183MB
```

3. create a container from the created image.
- create a container.
```
docker create -it --name ubt1604_dhpw310ava1 --dns 172.19.10.100 alphadocker/ubt1604_dhpw310ava1:0.01
```

- or to mount a host folder to the container.
```
docker create -it --name ubt1604_dhpw310ava1 --dns 172.19.10.100 -v /home/jacob_shih/volumes/repo/:/home/user/repo alphadocker/ubt1604_dhpw310ava1:0.01
```

- start the container.
```
docker start ubt1604_dhpw310ava1
```

- execute the container.
```
docker exec -it ubt1604_dhpw310ava1 su user -c /bin/bash
```

- note: use **docker run** to create and run a container may cause **fakeroot** forcing to exit the container.
```
jacob_shih:containers$ docker run -it --name ubt1604_dhpw310ava1_0302 --dns 172.19.10.100 -v /home/jacob_shih/volumes/repo:/home/user/repo alphadocker/ubt1604_dhpw310ava1_0302:0.01
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
user@841eb4aba2e5:~$
user@841eb4aba2e5:~$
user@841eb4aba2e5:~$ fakeroot ls -l
total 4
drwxrwxr-x 6 root root 4096 Oct 31 02:27 repo
jacob_shih:containers$
```

- **docker run** vs **docker exec**

  [https://stackoverflow.com/a/35592000](https://stackoverflow.com/a/35592000)

4. working.
- reconfigure timezone in new container.
```
sudo dpkg-reconfigure tzdata
```

- check out source code and build it.
```
svn checkout http://path.to/project/source working
cd working
make
```

5. save the image to tar file.
```
docker save -o ubt1604_dhpw310ava1-0.01.tar alphadocker/ubt1604_dhpw310ava1:0.01
```

6. load the saved image (from another host maybe...)
```
docker load --input ubt1604_dhpw310ava1-0.01.tar
```

7. show the history of the image.
```
Usage:  docker history [OPTIONS] IMAGE
```

```
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
ea55005d7402        4 months ago        /bin/sh -c #(nop)  ENV HOME=/home/user          0B
107cd5aa0a97        4 months ago        /bin/sh -c #(nop) WORKDIR /home/user            0B
76feef95d719        4 months ago        /bin/sh -c #(nop)  CMD ["su" "user" "-c" "...   0B
49eedff20695        4 months ago        /bin/sh -c cp /etc/skel/.bashrc /home/user...   3.77kB
05dba95aca8f        4 months ago        /bin/sh -c echo no | dpkg-reconfigure dash      1.57MB
ce94764758d7        4 months ago        /bin/sh -c chmod 0440 /etc/sudoers.d/user       29B
99c30131bc03        4 months ago        /bin/sh -c echo "user ALL=(root) NOPASSWD:...   29B
ec151808ff98        4 months ago        /bin/sh -c useradd -c 'docker user' -m -d ...   336kB
de143cdbf249        4 months ago        /bin/sh -c apt-get install -y u-boot-tools...   1.64MB
6dca43a338a8        4 months ago        /bin/sh -c apt-get install -y sudo vim tzdata   52.3MB
018ed3e438eb        4 months ago        /bin/sh -c apt-get install -y git subversi...   322MB
1ca0a1cab407        4 months ago        /bin/sh -c apt-get update                       39.2MB
04e809dd1ec3        4 months ago        /bin/sh -c #(nop)  MAINTAINER jacob_shih        0B
747cb2d60bbe        4 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           4 months ago        /bin/sh -c mkdir -p /run/systemd && echo '...   7B
<missing>           4 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.76kB
<missing>           4 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           4 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B
<missing>           4 months ago        /bin/sh -c #(nop) ADD file:5b334adf9d9a225...   122MB
```


