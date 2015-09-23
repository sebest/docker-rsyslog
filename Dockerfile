FROM alpine

RUN  apk update \
  && apk add rsyslog \
  && rm -rf /var/cache/apk/*


EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d" ]

# for some reason, the apk comes built with a v5
# config file. using this one for v8:
COPY ./conf/rsyslog.conf /etc/rsyslog.conf

RUN mkdir /etc/rsyslog-docker.d
COPY ./conf/01-default.conf /etc/rsyslog-docker.d/

ENTRYPOINT [ "rsyslogd", "-n" ]
