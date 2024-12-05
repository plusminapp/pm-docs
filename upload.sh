#!/usr/bin/env bash

source ./.venv/bin/activate

mkdocs build

cp ./.htaccess ./site/

lftp -u plusminapp,ryzmuc-1zifhA-qamwaj ftp://ftp.plusminapp.nl <<EOF
set ftp:ssl-allow no;
mirror -R ./site /web
bye
EOF

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"
