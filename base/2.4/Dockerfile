FROM debian:jessie
MAINTAINER  Romain THERRAT

# Install deps and create shinken user
RUN apt-get update && apt-get install -y python-pip python-pycurl python-cherrypy3 python-crypto monitoring-plugins-standard && \
    useradd shinken && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install shinken
RUN pip install shinken==2.4 && \
    shinken --init && \
    rm -r /var/lib/shinken/doc/*

ADD shinken.cfg /etc/shinken/shinken.cfg
ADD brokerd.ini /etc/shinken/daemons/brokerd.ini
ADD pollerd.ini /etc/shinken/daemons/pollerd.ini
ADD schedulerd.ini /etc/shinken/daemons/schedulerd.ini
ADD reactionnerd.ini /etc/shinken/daemons/reactionnerd.ini
ADD receiverd.ini /etc/shinken/daemons/receiverd.ini
