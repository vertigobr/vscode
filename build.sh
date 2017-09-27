#!/bin/bash
IMGVERSION=$(head -n 1 .IMGVERSION)
IMGVERSION=${IMGVERSION:-"latest"}
IMGNAME=$(head -n 1 .IMGNAME)
echo "Building $IMGNAME:$IMGVERSION"
docker build -t "$IMGNAME:$IMGVERSION" .
echo "Done!"
