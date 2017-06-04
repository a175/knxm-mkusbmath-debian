#!/bin/env bash

#SCRIPTNAME=knxm-mkusbmath-debian
SCRIPTNAME=$1
#LA=ja
LA=$2

POTFILE=$SCRIPTNAME.pot
POFILE=$LA.po
POXFILE=$LA.pox

if [ -e $POFILE ]
then
    echo "## $POFILE exists. Merge $POFILE and $POTFILE." 
else
    echo "## Create new $POXFILE." 
    cat $POTFILE |sed 's/charset=CHARSET/charset=UTF-8/'>$POFILE
fi

msgmerge $POFILE $POTFILE -o $POXFILE
echo "## Please edit $POXFILE." 
