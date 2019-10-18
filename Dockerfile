FROM alpine:3.10
LABEL maintainer="Takuya KIHARA <gray@tacck.net>" 

RUN \
    apk add --no-cache git g++ libstdc++ make \
&&  git clone https://github.com/microsoft/pict.git /pict \
&&  cd /pict && make \
&&  mv /pict/pict /opt \
&&  rm -rf /pict \
&&  apk del git g++ make \
&&  mkdir /work

WORKDIR /work
VOLUME ["/work"]

ENTRYPOINT [ "/opt/pict" ]
