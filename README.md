Quickstarter for DBpedia Spotlight models
===================================================

## Spotlight model creation

Create models 

```
./index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian docker/no/model
```

Create docker images 

```
docker build --tag mitoai/spotlight-no -f docker/no/Dockerfile docker/no && docker push mitoai/spotlight-no
```

## Run 

Start a Spotlight server 

````
docker rm -f spotlight-no
docker pull mitoai/spotlight-no
docker run -d --name spotlight-no -p 3002:80 mitoai/spotlight-no
````
