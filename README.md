Quickstarter for DBpedia Spotlight models
===================================================

## Spotlight model creation
You can use this tool for creating models of DBpedia Spotlight in your language.


### Model
The model is required to exist in order to run the server.

```
docker build --tag eu.gcr.io/ntnu-smartmedia/spotlight-base-model-no -f docker/base-model/Dockerfile .
```

### Server

##### Build it 
```
docker build --tag eu.gcr.io/ntnu-smartmedia/spotlight-server-no -f docker/server/Dockerfile docker/server
```

##### Run it 
```
docker run -it eu.gcr.io/ntnu-smartmedia/spotlight-server-no:latest
```

