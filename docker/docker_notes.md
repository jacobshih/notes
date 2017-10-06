
# docker

1. [docker basic](#docker_basic)
2. [install docker](#install_docker)
   1. [set up docker repository](#set_up_docker_repository)
   1. [install docker ce](#install_docker_ce)

3. [basic docker operations](#basic_docker_operations)
   1. [list docker images](#list_docker_images)
   1. [run a docker and check ubuntu version of docker image](#run_a_docker_and_check_ubuntu_version_of_docker_image)
   1. [create a container](#create_a_container)
   1. [create a container with specified name](#create_a_container_with_specified_name)
   1. [create a container with admin privilege](#create_a_container_with_admin_privilege)
   1. [start a container](#start_a_container)
   1. [stop a container](#stop_a_container)
   1. [attach local stdin, stdout and stderr streams to a running container](#attach_tty_io_to_a_running_container)
   1. [list container](#list_container)
   1. [run a container](#run_a_container)
   1. [stop a container](#stop_a_container)
   1. [export container](#export_container)
   1. [import container](#import_container)
4. [examples](#examples)
   1. [create and install applcations in a ubuntu 14.04 container](#example_create_ubuntu_1404_container)

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
```
docker images
```
```
jacob_shih:~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              f7b3f317ec73        5 months ago        117MB
ubuntu              14.04               302fa07d8117        5 months ago        188MB
ubuntu              10.04               e21dbcc7c9de        3 years ago         183MB
```

<a name="run_a_docker_and_check_ubuntu_version_of_docker_image" />

### run a docker and check ubuntu version of docker image
```
docker run ubuntu:10.04 lsb_release -a
```
```
docker run ubuntu:14.04 lsb_release -a
```

<a name="create_a_container" />

### create a container
```
docker create -it ubuntu:14.04
```

<a name="create_a_container_with_specified_name" />

### create a container with specified name
```
docker create -it --name myubuntu_1404 ubuntu:14.04
```

<a name="create_a_container_with_admin_privilege" />

### create a container with admin privilege
```
docker create -it --name ubt1404 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH ubuntu:14.04
```

<a name="start_a_container" />

### start a container
```
docker start myubuntu_1404
```

<a name="stop_a_container" />

### stop a container
```
docker stop myubuntu_1404
```

<a name="attach_tty_io_to_a_running_container" />

### attach local stdin, stdout and stderr streams to a running container
```
docker attach myubuntu_1404
```

<a name="list_container" />

### list container
1. to show only running containers
```
docker ps
```

2. to show all containers
```
docker ps -a
```

3. to show the latest created container
```
docker ps -l
```

4. to show only running containers
```
docker ps
```

<a name="run_a_container" />

### run a container
```
sudo docker start -i {ID}
```

<a name="stop_a_container" />

### stop a container
```
sudo docker stop {ID}
```

<a name="export_container" />

### export container
```
sudo docker export {ID} > mycontainer.tar
```

<a name="import_container" />

### import container
```
cat mycontainer.tar | sudo docker export - test/ubuntu:v1.0
```

---

<a name="examples" />

## examples

<a name="example_create_ubuntu_1404_container" />

### create and install applcations in a ubuntu 14.04 container
1. create a container with admin privilege and start it.
```
docker create -it --name ubt1404 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH ubuntu:14.04
docker start ubt1404
docker attach ubt1404
```

2. install necessary applications in the container.
```
apt-get update
apt-get install -y git wget curl samba nfs-kernel-server python
```

3. stop the container
```
docker stop ubt1404
```

4. export the container
```
docker export ubt1404 > ubt1404.tar
```

