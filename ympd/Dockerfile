FROM balenalib/raspberry-pi-debian:latest

ENV YMPD_VERSION 1.2.3

RUN apt-get -qq -y update \
    && apt-get install -qq -y --no-install-recommends build-essential cmake libmpdclient-dev libssl-dev \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSlL https://ympd.org/downloads/ympd-$YMPD_VERSION-armhf.tar.bz2 -o ympd.tar.bz2 \
    && tar -xvf ympd.tar.bz2

CMD ["./ympd", "-h", "mpd", "-p", "6700", "-w", "8080"]
