#!/bin/bash

# Target file is always the first argument
FILE=$1

# The number to be updated
NUMBER=$(cat $FILE | grep -Pzo '(?s)(?<=countdown).*?</' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/.*>\([0-9]*\)<.*/\1/')

# The new numeric value 
NEW=""

# Target date
DATE="2013 05 04"

# Date delta
DAYS=$(echo $DATE | awk '{dt=mktime($0 " 00 00 00")-systime(); print int(dt/86400) ;}')

# RC count
RC="Edit this rule"

if test `echo $FILE | grep -cE 'RC_(landscape|portrait)'` -ne 0; then
    echo "No rule to modify the RC countdown"
    exit
else
    sed -i "s/>$NUMBER<\/tspan/>$DAYS<\/tspan/g" $FILE
    echo "Date countdown has been updated."
fi

