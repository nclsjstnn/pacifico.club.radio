FROM resin/raspberrypi3-debian
MAINTAINER d@davo.io

################
# SSH
################

RUN apt-get update && apt-get install -yq --no-install-recommends \
    openssh-server

# Set up config for openSSH.
# Default root password is root, but can be overridden by setting ROOT_PASS env var
RUN mkdir /var/run/sshd \
    && echo "root:${ROOT_PASS:=root}" | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config


################
# Docker Hypriot
################

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    vim \
    git \
    tmux

# Install Docker from hypriot repos
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 37BBEE3F7AD95B3F && \
    echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ wheezy main" > /etc/apt/sources.list.d/hypriot.list && \
    apt-get update && \
    apt-get install -y docker-hypriot docker-compose

# Remove apt lists, this reduces the size of the docker image
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Folder for local builds
COPY ./apps /apps
WORKDIR /apps

# Enable systemd init system in the container, so it never closes. Helps to debug.
# http://docs.resin.io/runtime/runtime/#init-system
ENV INITSYSTEM on

ADD start /start
CMD /start
