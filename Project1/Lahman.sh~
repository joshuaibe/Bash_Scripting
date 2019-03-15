#!/bin/bash

:
 ' 
   This is a script that collects statistics for every MLB player aggregated
   by year
 
 '


# number 3.)   Lahman data
if  [ ! -d Lahman ]  &&  [ -s Lahman ]
then
b_lahman="http://seanlahman.com/files/database/baseballdatabank-master_2018-03-28.zip"

#file becomes baseballdatabank-master_2018-03-28.zip
wget $b_lahman

#unzipping file 
unzip baseballdatabank-master_2018-03-28.zip

# moving to Lahman directory
mv baseballdatabank-master  Lahman

#Removing zip directory
rm -r baseballdatabank-master_2018-03-28.zip
fi

