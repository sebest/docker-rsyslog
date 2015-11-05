FROM ubuntu:15.10

RUN  apt-get update \
  && apt-get -y install rsyslog \
  && apt-get clean

RUN rm /etc/rsyslog.d/50-default.conf
RUN rm -rf /var/log/*

RUN chown root:root /var/spool/rsyslog
RUN chmod 755 /var/spool/rsyslog

EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d", "/var/spool/rsyslog"]

COPY ./conf/rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT [ "rsyslogd", "-n" ]
