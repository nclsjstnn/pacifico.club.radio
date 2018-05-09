FROM resin/raspberrypi3-debian:latest
MAINTAINER @jstnn

ARG USERID=sativo
ARG PASSWORD=indico

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends pure-ftpd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd ftpgroup && useradd -g ftpgroup -m ftpuser

RUN ( echo ${PASSWORD} ; echo ${PASSWORD} ) | pure-pw useradd ${USERID} -u ftpuser -g ftpgroup -d /home/ftpusers/${USERID} > /dev/null 2>&1 && pure-pw mkdb

VOLUME /home/ftpusers/${USERID}

RUN chown -R ftpuser /home/ftpusers/${USERID}

CMD ["pure-ftpd", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R", "-P", "$PUBLICHOST", "-p", "30000:30009"]