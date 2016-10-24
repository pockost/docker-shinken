FROM pockost/shinken:latest-mongodb-base
MAINTAINER  Romain THERRAT

# Install deps and create shinken user
RUN apt-get update && apt-get install -y python-pymongo python-dev libffi-dev libssl-dev build-essential && \
    pip install bottle && \
    pip install --upgrade cffi && \
    pip install --upgrade paramiko && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install mongodb mobule
RUN /usr/bin/shinken install webui2 && \
    /usr/bin/shinken install graphite && \
    /usr/bin/shinken install ui-graphite && \
    /usr/bin/shinken install ssh && \
    /usr/bin/shinken install linux-ssh && \
    /usr/bin/shinken install http


COPY broker-master.cfg /etc/shinken/brokers/broker-master.cfg
COPY webui2.cfg /etc/shinken/modules/webui2.cfg
