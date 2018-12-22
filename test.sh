#!/bin/sh

IMAGE='rpmbuild-docker:latest'
IMAGE_REUSE='rpmbuild-docker:reuse'
CNAME='rpmbuild'

#docker images "$IMAGE" --format="{{.Repository}}:{{.Tag}}"\
# | grep "$IMAGE"\
# || docker build . -t $IMAGE
docker build . -t $IMAGE

docker stop $CNAME || docker kill $CNAME
docker rm $CNAME

exec docker run -it --rm --name $CNAME\
 -v "$PWD/rpmbuild":/rpmbuild:z\
 -w /rpmbuild\
 $IMAGE SPECS/*.spec
