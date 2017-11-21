FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn 

ENV YMPD_VERSION 1.2.3

RUN apt-get -qq -y update \
    && apt-get install -qq -y --no-install-recommends build-essential cmake libmpdclient-dev libssl-dev \ 
    && apt-get clean

RUN curl -fsSlL https://www.ympd.org/downloads/ympd-$YMPD_VERSION-armhf.tar.bz2 -o ympd.tar.bz2 \
    && tar -xvf ympd.tar.bz2
 
EXPOSE 8080

CMD ["./ympd", "-h", "mpd", "-p", "6600", "-w", "8080"]
