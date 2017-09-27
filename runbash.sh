#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
IMGVERSION=$(head -n 1 .IMGVERSION)
IMGVERSION=${IMGVERSION:-"latest"}
IMGNAME=$(head -n 1 .IMGNAME)
docker run --rm -ti "$IMGNAME:$IMGVERSION" $ENVBASH ${@:2}
