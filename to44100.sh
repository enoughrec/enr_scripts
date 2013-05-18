#!/bin/bash

ffmpeg -i "$1" -vn -ar 44100 -ac 2 -b:a 256k -f mp3 "44100_${1}"
