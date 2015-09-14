FROM pockost/shinken:2.4-base
MAINTAINER  Romain THERRAT

# Install mongodb mobule
RUN /usr/bin/shinken install mod-mongodb && \
    /usr/bin/shinken install snapshot-mongodb && \
    /usr/bin/shinken install retention-mongodb

VOLUME /var/lib/shinken
VOLUME /etc/shinken

