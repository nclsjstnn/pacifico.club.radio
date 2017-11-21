FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ARG PASSWORD=indico
ARG USERID=sativo

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends pure-ftpd \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd ftpgroup && useradd -g ftpgroup -m ftpuser

VOLUME ["/home/ftpusers/sativo"]

RUN ( echo ${PASSWORD} ; echo ${PASSWORD} ) | pure-pw useradd ${USERID} -u ftpuser -g ftpgroup -d /home/ftpusers/${USERID} > /dev/null 2>&1 && pure-pw mkdb
RUN mkdir -p /home/ftpusers/${USERID}
CMD chown -R 1000 /home/ftpusers/${USERID}

EXPOSE 21 30009

CMD ["pure-ftpd", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R", "-P", "$PUBLICHOST", "-p", "30000:30009"]
#CMD pure-ftpd -c 50 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30009