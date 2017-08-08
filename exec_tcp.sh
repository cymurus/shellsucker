#! /bin/bash

FD=8

exec 8<>/dev/tcp/ipecho.net/80

REQ="GET /plain HTTP/1.1\r\n\r\n"

echo -e $REQ >&8
cat <&8

exec 8<&-
exec 8>&-
