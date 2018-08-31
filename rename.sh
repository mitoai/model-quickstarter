#!/bin/bash
for i in $(docker ps | grep spotlight | awk '{print $2"-"$13}'); do
  set $i
  IFS=- read old new <<< $i
  newTag=mitoai/$new:latest
  echo "$old -> $newTag"
  docker tag $old $newTag
  docker push $newTag
done
