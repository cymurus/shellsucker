#! /bin/bash

USER=cymurus
TIME_LIMIT=24
EMAIL="cymurus@qq.com"

IFS_OLD=$IFS
IFS="
"

function send_mail()
{
    ip=$1
    echo $ip | mail -s "Login Overtime Alert." $EMAIL
}

#while read login_time; do
for user_info in `who | grep $USER | awk '{printf("%s %s %s\n", $5, $3, $4)}'`;
do
    ip=${user_info:1}
    ip=${ip%%)*}
    login_time=${user_info#* }
    login_time=`date +%s -d "$login_time"`
    cur_time=`date +%s`
    diff=$(($cur_time-$login_time))
    diff=$((diff/(60*60)))
    [ $diff -ge $TIME_LIMIT ] && send_mail "$ip"
done
#done <<< `who | grep $USER | awk '{printf("%s %s\n", $3, $4)}'`

IFS=$IFS_OLD



# study point:
# - IFS can be used like this?
#	IFS="
#	"
# - to convert a datetime into timestamp
#	date +%s -d "format"
# 
