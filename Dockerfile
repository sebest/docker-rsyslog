FROM alpine

RUN  apk update \
  && apk add rsyslog \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/spool/rsyslog

EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d", "/var/spool/rsyslog"]

COPY ./conf/rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT [ "rsyslogd", "-n" ]
