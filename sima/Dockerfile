FROM resin/raspberrypi3-debian:latest

ENV INITSYSTEM on

ENV SIMA_VERSION 0.15.3

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends python3 python3-pip curl xz-utils \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sudo pip3 install urllib3 requests

RUN curl -fsSl http://media.kaliko.me/src/sima/releases/MPD_sima-$SIMA_VERSION.tar.xz -o ./sima.tar.xz
RUN tar -xJf ./sima.tar.xz
RUN rm -rf ./sima.tar.xz
RUN sed -i 's,https://bootstrap.pypa.io/get-pip.py,https://raw.githubusercontent.com/pypa/get-pip/main/public/3.4/get-pip.py,g' MPD_sima-$SIMA_VERSION/vinstall.py
RUN sed -i 's,https://bitbucket.org/pypa/setuptools/downloads/ez_setup.py,https://bootstrap.pypa.io/ez_setup.py,g' MPD_sima-$SIMA_VERSION/vinstall.py

RUN python3 MPD_sima-$SIMA_VERSION/vinstall.py

COPY sima.conf /MPD_sima-$SIMA_VERSION/sima.conf
WORKDIR /MPD_sima-$SIMA_VERSION

CMD ["./vmpd-sima", "-c", "sima.conf"]