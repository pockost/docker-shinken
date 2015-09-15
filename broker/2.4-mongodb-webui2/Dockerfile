FROM pockost/shinken:2.4-webui2-base
MAINTAINER  Romain THERRAT

EXPOSE 7767
EXPOSE 7772

ENTRYPOINT ["/usr/bin/shinken-broker", "-c", "/etc/shinken/daemons/brokerd.ini"]
