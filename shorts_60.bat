@ECHO OFF

REM %1 video background in 1920x1080
REM SET video="C:\Users\Filipe Cruz\Videos\wrighter\2021-02-20 23-13-44.mov"
REM SET video = %1
REM %1 video background already rotated into 1080x1920
SET videorot="C:\Users\Filipe Cruz\Videos\wrighter\rot_2021-02-21 22-53-37.mp4"
REM SET videorot = %1

REM %2 cover artwork in squared form (any res above what we use)
SET cover="E:\enough\enrmp251_copy_your_idols_-_of_all_things_filthy___free\00_copy_your_idols_-_of_all_things_filthy___free__front_.png"
REM SET cover = %2

REM %3 mp3 file to use as background
SET mp3="E:\enough\enrmp251_copy_your_idols_-_of_all_things_filthy___free\04_copy_your_idols_-_these_weak_hands_that_held_you_up.mp3"
REM SET mp3 = %3

REM SET %4 output filename
SET output="output.mp4"
REM SET output=%4

REM rotate the video background to vertical format
REM ffmpeg -y -i %video% -vf "transpose=1" -t 60 temp_rotated.mp4
REM SET videorot="temp_rotated.mp4"

REM scale cover artwork to proper size
ffmpeg -y -i %cover% -vf scale=900:900 temp_image.png

REM put video background together with cover artwork
REM ffmpeg -i temp_rotated.mp4 -i temp_image.png -filter_complex "[0:v][1:v] overlay=25:500:enable='between(t,0,20)'" -pix_fmt yuv420p -c:a copy output.mp4

REM get artist / title / album data
ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 %mp3% > tmpFileArtist
ffprobe -loglevel error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 %mp3% > tmpFileTitle
ffprobe -loglevel error -show_entries format_tags=album -of default=noprint_wrappers=1:nokey=1 %mp3% > tmpFileAlbum

REM if you want the data available on a variable instead of a temporary file
REM SET /p album= < tmpFileAlbum
REM DEL tmpFileAlbum

SET font1="Roboto-Regular.ttf"
SET font2="Roboto-Light.ttf"

ffmpeg -y -i %videorot% -vf "[in]drawtext=fontfile=%font1%:textfile=tmpFileArtist:fontcolor=white:fontsize=82:shadowcolor=black:shadowx=5:shadowy=7:x=(w-text_w)/2:y=H-800, drawtext=fontfile=%font2%:textfile=tmpFileTitle:fontcolor=white:fontsize=78:shadowcolor=black:shadowx=5:shadowy=7:x=(w-text_w)/2:y=H-700, drawtext=fontfile=%font2%:textfile=tmpFileAlbum:fontcolor=white:fontsize=56:shadowcolor=black:shadowx=3:shadowy=5:x=(w-text_w)/2:y=H-540, drawtext=fontfile=%font1%:textfile=enrurl.txt:fontcolor=white:fontsize=48:shadowcolor=black:shadowx=4:shadowy=6:x=(w-text_w)/2:y=H-150[out]" -codec:a copy temp_withtext.mp4

REM DEL temp_rotated.mp4
DEL tmpFileArtist
DEL tmpFileTitle
DEL tmpFileAlbum

ffmpeg -y -i temp_withtext.mp4 -loop 1 -i temp_image.png -i %mp3% -filter_complex "[1]format=yuva420p,fade=in:st=0:d=5:alpha=1[i]; [0][i]overlay=90:90:shortest=1" -c:v libx264 -map 2:a:0 -t 57 %output%

DEL temp_image.png
DEL temp_withtext.mp4



break||(
#Shorts #enoughrec #freemusic

This release and many others like it are free for download at our website
http://enoughrecords.scene.org

Enough Records is a non-profit music label established in 2000. Known as the first Portuguese netlabel, with a back-catalogue of over 500 album releases licensed under Creative Commons BY-NC-SA, our goal is simply to spread the music from our release artists to the world.

Background effect by wrighter, used with permission.
https://www.shadertoy.com/user/jeyko/

)


