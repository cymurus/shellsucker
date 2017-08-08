#! /bin/bash

ps -aux | awk 'NR>1{tty[$7]++}
END{
    for( i in tty )
    {
        printf("%s\t%d\n", i, tty[i])
    }
}' | sort -nrk 2 -t $'\t' | head -10

read -p 'Which tty to kill: ' tty_to_kill

pkill -kill -t $tty_to_kill

# study point:
# - in awk we can use map
# - sort -n numeric
#	-r reverse
#	-k key column
#	-t delim
