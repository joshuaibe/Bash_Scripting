#!/bin/bash


:'
This is script that collects data from the official Major League Basball
website. The data collected are from the year 2000 to the present day.
Three directorys are made; players, inning_all and inning_hit. And they
 contain that information for all players in the MLB from 2000 to present

'

# number 1.)  MLB.com 
#Start and end dates 

#start at  01/01/2000
start=$(date "+s" -d 01/01/2000)

#increnment by number of days in seconds
step=$(( 24*60*60 ))

end=$(date "+%m/%d/%y")
#stop at present day
stop=$(date +%s -d "$end")



# iterating over the duartion of the years between 1921 to 2019
for i in $(seq $start $step $stop)
do

    d=$(date "+%d %m %Y" -d @"$i")
    year=$( echo $d | awk '{print $3}' )
    month=$( echo $d | awk '{print $2}' )
    day=$( echo $d | awk '{print $1}' )
   
   #viewing the variables
    echo $d
    echo $year
    echo $month
    echo $day
    url="https://gd2.mlb.com/components/game/mlb/year_$year/month_$month/day_$day"
    echo $url
    gameid=$(wget -O - $url | sed "s,/li,\n,g" | grep -E "gid" | awk '{print $3}' | sed "s,/</a><,\n,g")
    
	#iterating over year then month and then days

    for j in $gameid; do
	if [ ! -f $"MLB/$j" ] && [ ! -s $"MLB/$j" ]
	then
	    if [ ! -f $"MLB/$j/players.xml" ] && [ ! -s $"MLB/$j/players.xml" ]
	    then
		wget "$url/$j/players.xml" -P MLB/$j
	    fi
	    if [ ! -f $"MLB/$j/inning_all.xml" ] && [ ! -s $"MLB/$j/inning_all.xml" ]
	    then
		wget "$url/$j/inning/inning_all.xml" -P MLB/$j
	    fi
	    if [ ! -f $"MLB/$j/inning_hit.xml"] && [ ! -s $"MLB/$j/inning_hit.xml" ]
	    then
		wget "$url/$j/inning/inning_hit.xml" -P MLB/$j
	    fi
	fi
    done
    
done














