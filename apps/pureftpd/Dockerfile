FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ARG PASSWORD=indico
ARG USERID=sativo

RUN apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends pure-ftpd \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd ftpgroup && useradd -g ftpgroup -m ftpuser

RUN ( echo ${PASSWORD} ; echo ${PASSWORD} ) | pure-pw useradd ${USERID} -u ftpuser -g ftpgroup -d /home/ftpusers/${USERID} > /dev/null 2>&1 && pure-pw mkdb

RUN mkdir -p /home/ftpusers/${USERID} \
    && chown -R ftpuser /home/ftpusers/${USERID} \
    && chmod g+w /home/ftpusers/${USERID}

EXPOSE 21

CMD ["pure-ftpd", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R"]