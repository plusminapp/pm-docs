#!/usr/bin/env bash

source ./.venv/bin/activate

mkdocs build

scp -r site/ ruud@box:~/pmd/

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"
