FROM resin/raspberrypi3-debian:jessie
MAINTAINER @jstnn

ARG PASSWORD=indico
ARG USERID=sativo

RUN apt-get -qq -y update \
    && apt-get -qq -y install pure-ftpd \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd ftpgroup \
    && useradd -g ftpgroup -m ftpuser

RUN mkdir -p /home/ftpusers/${USERID}

VOLUME ["/home/ftpusers/sativo", "/etc/pure-ftpd"]

RUN ( echo ${PASSWORD} ; echo ${PASSWORD} ) | pure-pw useradd ${USERID} -u ftpuser -g ftpgroup -d /home/ftpuser/${USERID} \
    && pure-pw mkdb

EXPOSE 21 30009
CMD ["pure-ftpd", "--login", "puredb:/etc/pure-ftpd/pureftpd.pdb", "--createhomedir"]
#CMD chown -R 1000 /home/ftpusers/${USERID} && pure-ftpd -c 50 -C 10 -l puredb:/etc/pureftpd.pdb --createhomedir
#CMD pure-ftpd -l puredb:/etc/pureftpd.pdb -E -j -R



# CMD ["pure-ftpd", "--login", "puredb:/etc/pureftpd.pdb", "--createhomedir"]

# ENV PASSWORD indico
# ENV USERID sativo

# ARG PASSWORD=indico
# ARG USERID=sativo

# RUN ( echo ${PASSWORD} ; echo ${PASSWORD} ) | pure-pw useradd ${USERID} -u ftpuser -g ftpgroup -d /home/ftpusers/${USERID} > /dev/null 2>&1 && pure-pw mkdb
# RUN mkdir -p /home/ftpusers/${USERID}
# COPY data/remote /home/ftpusers/${USERID}
# CMD chown -R 1000 /home/ftpusers/${USERID} && /usr/sbin/pure-ftpd -c 50 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30009
