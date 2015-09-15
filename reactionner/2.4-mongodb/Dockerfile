FROM pockost/shinken:2.4-mongodb-base
MAINTAINER Romain THERRAT

EXPOSE 7769

ENTRYPOINT ["/usr/bin/shinken-reactionner", "-c", "/etc/shinken/daemons/reactionnerd.ini"]
