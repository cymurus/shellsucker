#! /bin/bash

start_p=${1:-1024}
end_p=${2:-65535}

for addr in `netstat -ant | awk 'NR>2{print $4}'`; do
    port=${addr#*:}
    [ $port -ge $start_p ] && [ $port -le $end_p ] && echo $addr
done


# study point:
# var substitute
#	var1=${var2:-$default}
# del pattern ${addr#*:}
