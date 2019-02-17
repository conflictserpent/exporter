#!/bin/bash
apis=("engine" "snake")
for api in "${apis[@]}"
do
  echo "Generating ${api}"
  rm -rf /tmp/gomodel
  mkdir /tmp/gomodel
  docker run --rm -v /tmp/gomodel:/local openapitools/openapi-generator-cli generate  \
    -i https://raw.githubusercontent.com/battlesnakeio/docs/master/apis/${api}/spec.yaml \
    -g go \
    -o /local/ 
  rm -rf ${api}
  mkdir ${api}
  dir=`pwd`
  cd /tmp/gomodel
  for filename in *model*.go; do
    newFilename=`echo ${filename} | cut -c 7-`
    sed "s/,omitempty//g" ${filename}  \
      | sed "s/package openapi/package ${api}model/g" ${filename} \
      > ${dir}/${api}/${newFilename}; 
  done
  cd ${dir}
done