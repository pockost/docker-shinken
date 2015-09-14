FROM debian:jessie
MAINTAINER  Romain THERRAT

# Install deps and create shinken user
RUN apt-get update && apt-get install -y python-pip python-pycurl python-cherrypy3 python-crypto && \
    useradd shinken && \
    apt-get -y autoremove && \
    apt-get clean

# Install shinken
RUN pip install shinken==2.4

VOLUME /var/lib/shinken
VOLUME /etc/shinken

