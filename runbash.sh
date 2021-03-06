#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
IMGVERSION=$(head -n 1 .IMGVERSION)
IMGVERSION=${IMGVERSION:-"latest"}
IMGNAME=$(head -n 1 .IMGNAME)
MYIP=`ifconfig en0 | awk '/inet /{print substr($2,0)}'`
[[ -z "$MYIP" ]] && MYIP=`ifconfig en1 | awk '/inet /{print substr($2,0)}'`
echo MYIP=$MYIP
docker run --rm -ti -e "DISPLAY=$MYIP:0" "$IMGNAME:$IMGVERSION" $ENVBASH ${@:2}
