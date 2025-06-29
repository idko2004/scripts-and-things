#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
rclone serve ftp ~/sdcard --addr :8888 --user wawau --pass michimiau --vfs-cache-mode minimal
