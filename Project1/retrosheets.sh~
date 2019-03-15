#! /bin/bash
:
' 
  This script collects date from retrosheets.org which is a Baseball archive.
  The data is then made put into directories Events Teams and Rosters.
  This runs from 1921 to present. 
'


mkdir Retrosheets

cd Retrosheets


#making  the file players.csv
wget -O - https://www.retrosheet.org/retroID.htm > player.csv

#making directories 
mkdir Events

mkdir Teams

mkdir Rosters
 
#Variables to iterate over
start=1921

stop=2019

# iterating over the duration
for i in  {1921..2019}
do 
    wget https://www.retrosheet.org/events/${i}eve.zip 
    wget https://www.retrosheet.org/events/${i}post.zip      
    
    #unzipping all files to Retrosheet directory
    unzip -o ${i}eve.zip
    
    unzip -o ${i}post.zip
 
done



#Moving files to revelant directories
mv *.EVA *.EVE *.EVN Events/

mv *.ROS Rosters/

mv TEAM* Teams/

#Removing zip files
rm -r *eve.zip *post.zip


