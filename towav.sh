#!/bin/bash

ffmpeg -i "$1" -vn -ar 44100 -ac 2 -f wav "44100_${1}.wav"
