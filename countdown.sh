#!/bin/bash

FILE=$1
NUMBER=$(cat $FILE | grep -Pzo '(?s)(?<=countdown).*?</' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/.*>\([0-9]*\)<.*/\1/')

echo $NUMBER
echo -n "Insert new number: "
read NEW

sed -i "s/>$NUMBER<\/tspan/>$NEW<\/tspan/g" $FILE
