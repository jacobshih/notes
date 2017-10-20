
# docker

1. [docker basic](#docker_basic)
2. [install docker](#install_docker)
   1. [set up docker repository](#set_up_docker_repository)
   1. [install docker ce](#install_docker_ce)

3. [basic docker operations](#basic_docker_operations)
   1. [list docker images](#list_docker_images)
   1. [run a docker and check ubuntu version of docker image](#run_a_docker_and_check_ubuntu_version_of_docker_image)
   1. [create a container](#create_a_container)
   1. [start a container](#start_a_container)
   1. [stop a container](#stop_a_container)
   1. [attach to a running container](#attach_to_a_running_container)
   1. [list container](#list_container)
   1. [create docker image](#create_docker_image)
   1. [export container](#export_container)
   1. [import container](#import_container)
   1. [save image](#save_image)
   1. [load image](#load_image)
   1. [show history of image](#show_history_of_image)

4. [examples](#examples)
   1. [create a ubuntu 14.04 container for arm 4.3.2 toolchain](#create_ubuntu_1404_container_for_arm_toolchain)
   1. [create a ubuntu 16.04 container for meson build system](#create_ubuntu_1604_container_for_meson_build_system)
   1. [create a ubuntu 16.04 container for hc1892 sdk](#create_ubuntu_1604_container_for_hc1892_sdk)

---

<a name="docker_basic" />

## docker basic
* Docker I/O
* Repository
* Image
   - Images are created with the build command, and they will produce a container when started with run.
   - Images are stored in a Docker registry such as registry.hub.docker.com.
* Container
   - An instance of an image is called a container.
   - you create a new container based on an image.
   - You can think about images and containers as a class and an instance of class.

---

<a name="install_docker" />

## install docker

<a name="set_up_docker_repository" />

### set up docker repository
1. update apt package index.
```
sudo apt-get update
```

2. install packages to allow apt to use a repository over https.
```
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

3. add docker's official GPG key.
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

4. set up the stable docker repository.
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

<a name="install_docker_ce" />

### install docker ce
1. update apt package index.
```
sudo apt-get update
```

2. install the latest version of docker ce.
```
sudo apt-get install docker-ce
```

3. verify if docker is installed correctly.
```
docker run ubuntu:10.04 /bin/echo 'Hello docker'
```

---
<a name='basic_docker_operations'/>

## basic docker operations

<a name="list_docker_images" />

### list docker images
- usage
```
Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]
```

- list docker images
```
jacob_shih:dockertest$ docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
alphadocker/ubt1404_arm-4.3.2   0.00.01             091b0fc7e71f        17 hours ago        886MB
ubuntu                          latest              f7b3f317ec73        5 months ago        117MB
ubuntu                          14.04               302fa07d8117        6 months ago        188MB
ubuntu                          10.04               e21dbcc7c9de        3 years ago         183MB
```

<a name="run_a_docker_and_check_ubuntu_version_of_docker_image" />

### run a docker and check ubuntu version of docker image
```
jacob_shih:dockertest$ docker run --rm ubuntu:10.04 lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 10.04 LTS
Release:        10.04
Codename:       lucid
```

```
jacob_shih:dockertest$ docker run --rm ubuntu:14.04 lsb_release -a
Distributor ID: Ubuntu
Description:    Ubuntu 14.04.5 LTS
Release:        14.04
Codename:       trusty
No LSB modules are available.
```

<a name="create_a_container" />

### create a container

- usage
```
Usage:  docker create [OPTIONS] IMAGE [COMMAND] [ARG...]

Create a new container

Options:
  -e, --env list                       Set environment variables
  -h, --hostname string                Container host name
  -i, --interactive                    Keep STDIN open even if not attached
      --link list                      Add link to another container
      --name string                    Assign a name to the container
  -p, --publish list                   Publish a container's port(s) to the host
  -P, --publish-all                    Publish all exposed ports to random ports
  -t, --tty                            Allocate a pseudo-TTY
  -v, --volume list                    Bind mount a volume
  -w, --workdir string                 Working directory inside the container
```

- create a container with default name
```
docker create -it ubuntu:14.04
```

- create a container with specified name
```
docker create -it --name ubt1404 ubuntu:14.04
```

- create a container with admin privilege
```
docker create -it --name ubt1404 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH ubuntu:14.04
```

- create a container with environment variables
```
docker create -it --name ubt1404 --env PATH=/home/hello --env HELLO=WORLD ubuntu:14.04
```

- mount a host folder to container
```
docker create -it --name ubt1404 -v /home/jacob_shih/temp/dockertest:/tmp/dockertest ubuntu:14.04
```

<a name="start_a_container" />

### start a container
- usage
```
Usage:  docker start [OPTIONS] CONTAINER [CONTAINER...]
```

- start a container with specified name
```
docker start ubt1404
```

<a name="stop_a_container" />

### stop a container
- usage
```
Usage:  docker stop [OPTIONS] CONTAINER [CONTAINER...]
```

- stop a container with specified name
```
docker stop ubt1404
```

<a name="attach_to_a_running_container" />

### attach to a running container
- usage
```
Usage:  docker attach [OPTIONS] CONTAINER
```

- attach local stdin, stdout and stderr streams to a running container
```
docker attach ubt1404
```

<a name="list_container" />

### list container
- usage
```
Usage:  docker ps [OPTIONS]

List containers

Options:
  -a, --all             Show all containers (default shows just running)
```

- to show only running containers
```
docker ps
```

- to show all containers
```
docker ps -a
```

- to show the latest created container
```
docker ps -l
```

- to show only running containers
```
docker ps
```

<a name="create_docker_image" />

### create docker image
- usage:
```
docker commit [-m message] [-a author] CONTAINER REPOSITORY:TAG
```

- example:
```
docker commit -m 'arm-4.3.2' -a 'jacob_shih' ubt1404_arm-4.3.2 alphadocker/ubt1404_arm-4.3.2:0.01
```

<a name="export_container" />

### export container
- usage
```
Usage:  docker export [OPTIONS] CONTAINER

Options:
  -o, --output string   Write to a file, instead of STDOUT
```

- export a container as a tar archive
```
docker export -o ubt1404.tar ubt1404
```

- export a container as a tar archive by redirecting stdout to a tar file
```
docker export ubt1404 > ubt1404.tar
```

<a name="import_container" />

### import container
- usage
```
Usage:  docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
```

- import the contents from a tarball to create a filesystem image
```
docker import ubt1404.tar dockertest/ubt1404:0.01
```

- import docker image from stdin by concatenating tar file to stdout
```
cat ubt1404.tar | docker import - dockertest/ubt1404:0.01
```

<a name="save_image" />

### save image
- usage
```
Usage:  docker save [OPTIONS] IMAGE [IMAGE...]

Options:
  -o, --output string   Write to a file, instead of STDOUT
```

- save one or more images to a tar archive
```
docker save dockertest/ubt1404:0.01 -o saved_ubt1404.tar
```

<a name="load_image" />

### load image
- usage
```
Usage:  docker load [OPTIONS]

Options:
  -i, --input string   Read from tar archive file, instead of STDIN
```

- load an image from a tar archive
```
docker load --input saved_ubt1404.tar
```

<a name="show_history_of_image" />

### show history of image
- usage
```
Usage:  docker history [OPTIONS] IMAGE
```

- show the history of an image
```
docker history alphadocker/ubt1604_hc1892_user:0.01
```

---

<a name="examples" />

## examples

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

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# run as a user
USER user

# set up working directory
WORKDIR /home/user
ENV HOME /home/user
```

2. build docker image from dockerfile.
```
docker build -f ubt1604_hc1892_user.dockerfile -t alphadocker/ubt1604_hc1892_user:0.01 .
```

- list the images.
```
docker images
```
```
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
alphadocker/ubt1604_hc1892_user      0.01                2f66e9ad088a        11 seconds ago      539MB
alphadocker/ubt1604_meson_20171016   0.01                e6089e941d76        3 days ago          676MB
alphadocker/ubt1604_meson            0.01                0209c09aa568        6 days ago          578MB
ubuntu                               16.04               747cb2d60bbe        8 days ago          122MB
ubuntu                               14.04               302fa07d8117        6 months ago        188MB
ubuntu                               10.04               e21dbcc7c9de        3 years ago         183MB
```

3. create a container from the created image.
- create a container and run it.
```
docker run -it --name ubt1604_hc1892_user --dns 172.19.10.100 alphadocker/ubt1604_hc1892_user:0.01
```

- or to mount a host folder to the container.
```
docker run -it --name ubt1604_hc1892_user --dns 172.19.10.100 -v /home/jacob_shih/volumes/hc1892:/home/user alphadocker/ubt1604_hc1892_user:0.01
```

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

