FROM pockost/shinken:2.4-mongodb-base
MAINTAINER Romain THERRAT

EXPOSE 7772

ENTRYPOINT ["/usr/bin/shinken-broker", "-c", "/etc/shinken/daemons/brokerd.ini"]
