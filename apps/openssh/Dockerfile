FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

# here we install apt dependencies. We also remove the apt lists in the same step,
# this reduces the size of the docker image.
RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends openssh-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# here we set up the config for openSSH.
RUN mkdir /var/run/sshd \
    && echo 'root:resin' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# We set the working directory for the next few commands
WORKDIR /usr/src/app

# here we copy all the root of our repo into the containers WORKDIR
COPY . ./

# Start.sh will run when the container starts
CMD ["./start.sh"]
