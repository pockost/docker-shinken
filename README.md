# docker-shinken
Docker image for Shinken monitoring system

## Use shinken cli

Initialization
```
touch $HOME/.shinken.ini
docker run --rm -it -v $HOME/.shinken.ini:/root/.shinken.ini pockost/shinken shinken --init
```

Edit your ~/.shinken.ini file in order to add your API Key

Push a pack

```
cd pack/folder
docker run --rm -it -v $HOME/.shinken.ini:/root/.shinken.ini -v $PWD:/data -w /data pockost/shinken shinken publish
```

## Usage with docker-compose and webui2

The best place to start using this project is to run a stack of shinken
with the WebUI. There is a docker-compose.yml file you can used to
simply do that.


```
version: '2'

services:
  arbiter:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    command: "/usr/bin/shinken-arbiter -c /etc/shinken/shinken.cfg"
    links:
      - poller
      - scheduler
      - reactionner
      - broker
      - receiver
      - mongo
    expose:
      - "7770"
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - back
  poller:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    links:
      - scheduler
    expose:
      - 7771
    command: "/usr/bin/shinken-poller -c /etc/shinken/daemons/pollerd.ini"
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - back
  scheduler:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    links:
      - mongo
    expose:
      - 7768
    command: "/usr/bin/shinken-scheduler -c /etc/shinken/daemons/schedulerd.ini"
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - back
  reactionner:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    links:
      - scheduler
    expose:
      - 7769
    command: "/usr/bin/shinken-reactionner -c /etc/shinken/daemons/reactionnerd.ini"
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - back
  broker:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    command: "/usr/bin/shinken-broker -c /etc/shinken/daemons/brokerd.ini"
    expose:
      - "7772"
    ports:
      - 8082:7767
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - front
      - back
  receiver:
    image: pockost/shinken:2.4-webui2-base
    restart: unless-stopped
    command: "/usr/bin/shinken-receiver -c /etc/shinken/daemons/receiverd.ini"
    ports:
      - 5667:5667
    volumes:
      - ./data/shinken/lib:/var/lib/shinken
      - ./config/shinken/etc:/etc/shinken
    networks:
      - back
  graphite:
    image: sitespeedio/graphite
    restart: unless-stopped
    ports:
      - "80"
    volumes:
      - ./data/graphite/whisper:/opt/graphite/storage/whisper 
    networks:
      - back
  mongo:
    image: mongo
    restart: unless-stopped
    volumes:
      - ./data/mongo/data:/data/db
    networks:
      - back
networks:
  front:
  back:
```

The project will not start start caused the config file stored in config/shinken/etc is not present. We have to fill this directory with this command.
This command should be run in the root directory of the docker-compose project.

```
docker run -it --rm -v $PWD/config/shinken/etc:/config pockost/shinken:2.4-webui2-base cp -a /etc/shinken/. /config
docker run  --rm -v $PWD/data/shinken/lib:/var_lib pockost/shinken:2.4-webui2-base cp -a /var/lib/shinken/. /var_lib
```

You can now run `docker-compose up -d` to start the project to start and
go to http://<docker-ip-server>:8082 to see the webui interface.
