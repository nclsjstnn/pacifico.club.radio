FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ENV SIMA_VERSION 0.14.4

RUN apt-get -qq -y update \
    && apt-get -qq -y install python3 \
    && apt-get -qq -y install curl \
    && apt-get -qq -y install xz-utils \
    && apt-get clean

RUN curl -fsSl http://media.kaliko.me/src/sima/releases/MPD_sima-$SIMA_VERSION.tar.xz -o ./sima.tar.xz \
    && tar -xJf ./sima.tar.xz \
    && sed -i 's,https://raw.github.com/pypa/pip/master/contrib/get-pip.py,https://bootstrap.pypa.io/get-pip.py,g' MPD_sima-$SIMA_VERSION/vinstall.py \
    && rm -rf ./sima.tar.xz \
    && python3 MPD_sima-$SIMA_VERSION/vinstall.py \
    && apt-get clean

COPY sima.conf /MPD_sima-$SIMA_VERSION/sima.conf
WORKDIR MPD_sima-$SIMA_VERSION

CMD ["./vmpd-sima", "-c", "sima.conf"]
