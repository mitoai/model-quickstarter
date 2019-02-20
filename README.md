Quickstarter for DBpedia Spotlight models
===================================================

## Spotlight model creation
You can use this tool for creating models of DBpedia Spotlight in your language.

### Languages

| WIKI_LANGUAGE_NAME | WIKI_LANGUAGE | WIKI_LOCALE |
|--------------------|---------------|-------------|
| Norwegian          | no            | no_NO       |
| Swedish            | sv            | sv_SE       |
| English            | en            | en_US       |
| Danish             | da            | da_DK       |
| German             | de            | de_DE       |
| Spanish            | es            | es_ES       |
| French             | fr            | fr_FR       |


### Model
The model is required to exist in order to run the server.

```
docker build \
  --build-arg WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --build-arg WIKI_LOCALE=${WIKI_LOCALE} \
  --build-arg WIKI_LANGUAGE_NAME=${WIKI_LANGUAGE_NAME} \
  --tag eu.gcr.io/ntnu-smartmedia/spotlight-base-model-${WIKI_LANGUAGE} \
  -f docker/base-model/Dockerfile .
```
alternatively

```
./create_model.sh no Norwegian no_NO
```

### Server
The server runs the model, making it available over HTTP.

##### Build it 
```
docker build \
  --build-arg WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --tag eu.gcr.io/ntnu-smartmedia/spotlight-server-${WIKI_LANGUAGE} \
  -f docker/server/Dockerfile docker/server
```
alternatively
```
./create_server.sh no
```

##### Run it 
```
docker run -d \
  -e MEMORY=${MEMORY} \
  -e WIKI_LANGUAGE_NAME=${WIKI_LANGUAGE} \
  -e WIKI_LOCALE=${WIKI_LOCALE} \
  -e WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --name spotlight-${WIKI_LANGUAGE} \
  -p ${PORT}:80 \
  eu.gcr.io/ntnu-smartmedia/spotlight-server-${WIKI_LANGUAGE}:latest
```
alternatively
```
./start-server.sh no Norwegian no_NO 3001 4g
```

### Complete setup 
Alternatively, run everything in one go
```
./complete.sh no Norwegian no_NO 3001 4g
```
