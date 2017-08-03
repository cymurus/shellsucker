#! /bin/bash


if [ $# -eq 0 ]; then
    echo 'Usage:'
    echo -e "\t$0 ./test\n"
    exit 0
fi



function wordlize()
{
    word=$1
    ret=$word
    for i in `seq 0 $((${#word}-1))`; do
        char=${word:$i:1}
        code=`printf "%d" "'$char"`
        if !(([ $code -le 90 ] && [ $code -ge 65 ]) || ([ $code -le 122 ] && [ $code -ge 97 ])); then
            ret=${ret//$char/}
        fi
    done
    echo $ret
}

file_name=$1
if [ -f $file_name ]; then
    file_content=`cat $file_name`
else
    echo 'file not exists.'
    exit 1
fi

declare -A word_map=()

for word in $file_content; do
    word="$(wordlize $word)"
    [ -z $word ] && continue
    word_map["$word"]=${word_map["$word"]:="0"}
    word_map["$word"]=$((${word_map["$word"]}+1))
done

[ -z $1 ] && echo "Output:"
for word in ${!word_map[@]}; do
    printf "\t%s: %d\n" $word ${word_map["$word"]}
done



# study point:
# - to use a map
#	declare -A map=("a"="1" "b"="2")
#	${!map[@]} # keys
# - func that returns string
#	in func: echo $ret
#	out of func: var=$("func")
# - to replace pattern
#	${var/old/new} #fisrt
#	${var//old/new} #global
