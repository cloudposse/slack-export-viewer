#!bin/sh

echo "$1"
echo "$2"

python3 /app.py --archive /usr/src/slack-export-viewer/$2
