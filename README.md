# docker-shinken
Docker image for Shinken monitoring system

## Use shinken cli

Initialization
```
touch $HOME/.shinken.ici
docker run --rm -it -v $HOME/.shinken.ini:/root/.shinken.ini pockost/shinken shinken --init
```

Edit your ~/.shinken.ini file in order to add your API Key

Push a pack

```
cd pack/folder
docker run --rm -it -v $HOME/.shinken.ini:/root/.shinken.ini -v $PWD:/data -w /data pockost/shinken shinken publish
```
