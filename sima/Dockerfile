FROM balenalib/raspberry-pi-debian:latest

ENV SIMA_VERSION 0.15.3

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends python3 python3-pip curl xz-utils python-urllib3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sudo pip3 install urllib3

ADD MPD_sima-$SIMA_VERSION /MPD_sima-$SIMA_VERSION

RUN python3 MPD_sima-$SIMA_VERSION/vinstall.py

COPY sima.conf /MPD_sima-$SIMA_VERSION/sima.conf
WORKDIR /MPD_sima-$SIMA_VERSION

CMD ["./MPD_sima-0.15.3/vmpd-sima", "-c", "sima.conf"]
