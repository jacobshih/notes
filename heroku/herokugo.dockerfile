FROM golang:1.8
MAINTAINER jacob_shih "jacob_shih@hotmail.com"

# update ubuntu software repository
RUN apt-get update

# install heroku cli
RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# install necessary tools
RUN apt-get install -y \
    vim \
    tzdata \
    sudo

# set up working directory
ENV HOME /home/user
ENV GOPATH $HOME/herokugo
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc \
  && echo 'PATH="/usr/local/go/bin:$GOPATH/bin:$HOME/bin:$PATH"' >> /home/user/.bashrc

RUN chown user:user -R /home/user

# set timezone
# ENV TZ=Asia/Taipei
# RUN dpkg-reconfigure -f noninteractive tzdata

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

