FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn 

# docker run -p 8080:8080 --net music_stack --name=ympd -d alpine-ympd:dev

ENV YMPD_VERSION 1.3.0

RUN chmod o+r /etc/resolv.conf

ADD sources.list /etc/apt/

RUN apt-get -qq -y update \
    && apt-get install -y -q build-essential cmake libmpdclient-dev libmpdclient2 openssl libssl-dev \ 
    && apt-get clean

RUN curl -fsSlL https://www.ympd.org/downloads/ympd-1.2.3-armhf.tar.bz2 -o ympd.tar.bz2 \
    && tar -xvf ympd.tar.bz2
 
EXPOSE 8080

CMD ["./ympd", "-h", "mpd", "-p", "6600", "-w", "8080"]
