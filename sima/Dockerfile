FROM balenalib/raspberry-pi-debian:latest

ENV INITSYSTEM on

ENV SIMA_VERSION 0.15.3

RUN if [ %%BALENA_ARCH%% = "i386" ] || [ %%BALENA_ARCH%% = "amd64" ] ; then [ "cross-build-start" ] ; fi

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends python3 python3-pip curl xz-utils mpd-sima \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sudo pip3 install urllib3 requests

RUN if [ %%BALENA_ARCH%% = "i386" ] || [ %%BALENA_ARCH%% = "amd64" ] ; then [ "cross-build-end" ] ; fi

COPY sima.conf /etc/mpd_sima.cfg

CMD ["mpd-sima", "--conf=/etc/mpd_sima.cfg"]º