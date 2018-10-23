#!/usr/bin/env bash

cd "${0%/*}"

echo "Bundling Python package..."
rm -rf ./dist/*
rm -rf ./venv

python3 -m venv ./venv
source ./venv/bin/activate

echo "Python version: $(python -V)"

pip install --upgrade pip
pip install -r ./requirements.txt

zip -r9 ./dist/bundle.zip *.py
cd venv/lib/python3.6/site-packages
zip -r9 ../../../../dist/bundle.zip .

echo "Done and done!"
