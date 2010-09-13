echo 'Starting XVFB'
`which Xvfb` :1 -screen 0 1024x768x24 -ac &
sleep 2
echo 'Starting firefox'
rm -rf .mozilla
DISPLAY=:1 firefox &
sleep 3
echo 'Screen capture'
DISPLAY=:1 firefox -remote "openurl(http://news.yahoo.com)"
sleep 3
DISPLAY=:1 import -window root image.png
killall firefox
killall Xvfb
echo 'Done'
