#! /bin/bash

RTMP_URL="rtmps://live-api-s.facebook.com:443/rtmp/"

while true; do

ffmpeg -re -i "$V" -re -i logo.png  -filter_complex "[1:v]scale=60:60[logo];[0:v][logo]overlay=W-w-50:H-h-900" -c:v libx264 -b:v 2000k -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv $RTMP_URL/$R 

echo "البث الأصلي انقطع، سيتم استخدام المصدر البديل..."

    ffmpeg -re -i "logo.png" -re -i logo.png  -filter_complex "[1:v]scale=60:60[logo];[0:v][logo]overlay=W-w-50:H-h-900" -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv $RTMP_URL/$R
    
    sleep 5
done
