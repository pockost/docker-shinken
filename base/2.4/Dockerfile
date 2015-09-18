FROM debian:jessie
MAINTAINER  Romain THERRAT

# Install deps and create shinken user
RUN apt-get update && apt-get install -y python-pip python-pycurl python-cherrypy3 python-crypto && \
    useradd shinken && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Install shinken
RUN pip install shinken==2.4 && \
    shinken --init && \
    rm -r /var/lib/shinken/doc/*
