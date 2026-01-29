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
scp -r site/ ruud@box:~/pmd/

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"
