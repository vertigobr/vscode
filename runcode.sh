#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
IMGVERSION=$(head -n 1 .IMGVERSION)
IMGVERSION=${IMGVERSION:-"latest"}
IMGNAME=$(head -n 1 .IMGNAME)
MYIP=`ifconfig en0 | awk '/inet /{print substr($2,0)}'`
[[ -z "$MYIP" ]] && MYIP=`ifconfig en1 | awk '/inet /{print substr($2,0)}'`
MYDISPLAY="$MYIP:0"
docker run --rm -ti \
    --name code \
    -u user \
    -e "DISPLAY=$MYDISPLAY" \
    "$IMGNAME:$IMGVERSION"
