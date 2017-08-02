#! /bin/bash

function usage()
{
    echo -e 'Usage: '
    echo -e "\t$0 3498db"
    echo -e 'fuck the "#" char'
    echo -e 'Output: '
    echo -e "\tR: 52"
    echo -e "\tG: 152"
    echo -e "\tB: 216"
    exit 0
}


function output()
{
    echo -e "R: $1"
    echo -e "G: $2"
    echo -e "B: $3"
}



#if [ -z $# ]; then
if [ $# -eq 0 ]; then
    usage
fi


color_h=$1

if [ ${#color_h} -ne 6 ]; then
    echo -e 'Wrong format of input color: $color_h'
    exit 0
fi

r_h=${color_h:0:2}
g_h=${color_h:2:2}
b_h=${color_h:4:2}

r_d=$((16#$r_h))
g_d=$((16#$g_h))
b_d=$((16#$b_h))

output $r_d $g_d $b_d

exit 0
