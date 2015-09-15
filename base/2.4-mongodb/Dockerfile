FROM pockost/shinken:2.4-base
MAINTAINER  Romain THERRAT

# Install mongodb mobule
RUN /usr/bin/shinken install mod-mongodb && \
    /usr/bin/shinken install snapshot-mongodb && \
    /usr/bin/shinken install retention-mongodb

COPY arbiter-master.cfg /etc/shinken/arbiters/arbiter-master.cfg
COPY broker-master.cfg /etc/shinken/brokers/broker-master.cfg
COPY poller-master.cfg /etc/shinken/pollers/poller-master.cfg
COPY reactionner-master.cfg /etc/shinken/reactionners/reactionner-master.cfg
COPY receiver-master.cfg /etc/shinken/receivers/receiver-master.cfg
COPY scheduler-master.cfg /etc/shinken/schedulers/scheduler-master.cfg

VOLUME /var/lib/shinken
VOLUME /etc/shinken

