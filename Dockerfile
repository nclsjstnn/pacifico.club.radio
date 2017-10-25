FROM resin/raspberrypi3-debian
ADD . /usr/src/app
WORKDIR /usr/src/app
CMD start.sh