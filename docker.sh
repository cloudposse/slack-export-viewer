#!/bin/bash

# Somebody, please, give this man a gun. 

IMAGE_NAME=slack-export-viewer:latest
CONTAINER_NAME=slack-export-viewer

if [ "$1" = "build"  ]
then
    echo "Build image"
    docker build -t $IMAGE_NAME .

elif [ "$1" = "run" ]
then
    # echo "Run container with EXPORT_PATH=$2 and EXPORT_FILE=$3"
    # docker run -d --rm -v $2:/usr/src/slack-export-viewer -e EXPORT_PATH=$2 -e EXPORT_FILE=$3 --name $CONTAINER_NAME -i -t -d $IMAGE_NAME
    # docker run -v $2:/usr/src/slack-export-viewer -e EXPORT_PATH=$2 -e EXPORT_FILE=$3 --name $CONTAINER_NAME -i -t -d $IMAGE_NAME
    # docker run -v $2:/usr/src/slack-export-viewer -e EXPORT_PATH=$2 -e EXPORT_FILE=$3 -i -t -d $IMAGE_NAME
    # docker run  $IMAGE_NAME $2
    # docker run --rm -v $2:/usr/src/slack-export-viewer --name $CONTAINER_NAME $IMAGE_NAME
    docker run --rm --name $CONTAINER_NAME -it $IMAGE_NAME $2 $3

elif [ "$1" = "log" ]
then
    echo "Here's awesome logs :"
    docker logs -f $CONTAINER_NAME

elif [ "$1" = "console" ]
then
    echo "Run console :"
    docker exec -it $CONTAINER_NAME /bin/sh

else
    echo "Execute with parameter build|run|log|console"
fi
