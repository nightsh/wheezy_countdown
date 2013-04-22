#!/bin/bash

DIR="/home/victor/build/wheezy_countdown/"
SCALE="80%"
FTP_URI="ftp://debian-linux.ro/debian.org.ro/htdocs/uploads/wheezy-countdown/png/"
FTP_USER=""
FTP_PASS=""

cd $DIR
for i in `ls -1 svg/*.svg`; do
    ./countdown.sh $i
    file=$(basename $i | sed 's/svg/png/')
    if [ -f png/$file ]; then
        mogrify -resize $SCALE png/$file
        curl -T png/$file $FTP_URI --user $FTP_USER:$FTP_PASS
    else
        echo $file "not present"
    fi
done
