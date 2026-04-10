#!/usr/bin/env bash

# Ensure a Python virtual environment exists and is activated.
if [ ! -f ./.venv/bin/activate ]; then
	echo "Virtualenv not found. Creating .venv..."
	python3 -m venv .venv || { echo "Failed to create virtualenv"; exit 1; }
	# Activate to install mkdocs
	source ./.venv/bin/activate
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt
else
	source ./.venv/bin/activate
fi

# Build the MkDocs site
mkdocs build

# Copy site to remote host
scp -r site/ ruud@box:~/io.vliet/pmd/
scp default.conf.template ruud@box:~/io.vliet/pmd/
scp docker-compose.yml ruud@box:~/io.vliet/pmd/

# restart the site
ssh box 'sudo -u ruud bash -lc "cd ~/io.vliet/pmd && ~/io.vliet/pmd/pmd_deploy.sh"'

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"
