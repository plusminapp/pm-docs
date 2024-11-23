#!/usr/bin/env bash

mkdocs build

lftp -u plusminapp,ryzmuc-1zifhA-qamwaj ftp://ftp.plusminapp.nl <<EOF
set ftp:ssl-allow no;
mirror -R ./site /web
bye
EOF
