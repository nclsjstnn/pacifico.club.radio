FROM resin/raspberrypi3-debian
ADD . /usr/src/app
WORKDIR /usr/src/app
RUN chmod +x ./start.sh
ENTRYPOINT ["./start.sh"]