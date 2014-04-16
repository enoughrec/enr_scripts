#!/bin/bash

for filename in *.mp3
do
ffmpeg -i "$filename" -vn -ar 44100 -ac 2 -f wav "$filename.wav"
done

for filename in *.ogg
do
ffmpeg -i "$filename" -vn -ar 44100 -ac 2 -f wav "$filename.wav"
done
