#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
mv /data/data/com.termux/files/home/wawau.log /data/data/com.termux/files/home/wawau.log.old
node /data/data/com.termux/files/home/projects/colon-three-bot/main.js > /data/data/com.termux/files/home/wawau.log 2>&1
