(for %%i in (*.mp3) do @echo file '%%i') > temp_list.txt
ffmpeg -f concat -i temp_list.txt -c copy temp_audio.wav
del temp_list.txt
ffmpeg -loop 1 -i 00_1425.jpg -i temp_audio.wav -shortest -vf scale=-2:480 video.mp4
del temp_audio.wav
node "C:\Users\Filipe Cruz\Documents\tracklist_from_directory_with_mp3s\app.js" "%cd%\\" >> temp_tracklist.txt
pause
