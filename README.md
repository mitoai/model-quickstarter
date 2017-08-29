Quickstarter for DBpedia Spotlight models
===================================================

## Spotlight model creation

You can use this tool for creating models of DBpedia Spotlight in your language.


* docker run -it dbpediaspotlight/model-quickstarter bash
* cd model-quickstarter/
* ./prepare.sh

and then the command to the target model

```
./index_db.sh -b en/ignore.list wdir en_US en/stopwords.list English   models/en
./index_db.sh -b sv/ignore.list wdir sv_SE sv/stopwords.list Swedish   models/sv
./index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian models/no
./index_db.sh                   wdir da_DK da/stopwords.list Danish    models/da
```

If you want to generate the models outside the container, just map volumes for the folders /model-quickstarter/wdir, /model-quickstarter/data and /model-quickstarter/models.

E.g:

```
docker run -v /home/user/data/model/wdir:/model-quickstarter/wdir \
           -v /home/user/data/model/data:/model-quickstarter/data \
           -v /home/user/data/model/models:/model-quickstarter/models 
           -it dbpediaspotlight/model-quickstarter \
           bash 
```

## Run 

To run this model on port 2222, run the following:

```
java -jar dbpedia-spotlight.jar <lang> http://localhost:2222/rest
```
