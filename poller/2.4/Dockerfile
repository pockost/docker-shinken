FROM pockost/shinken:2.4-base
MAINTAINER  Romain THERRAT

RUN apt-get install -y monitoring-plugins-standard

EXPOSE 7771

ENTRYPOINT ["/usr/bin/shinken-poller", "-c", "/etc/shinken/daemons/pollerd.ini"]
