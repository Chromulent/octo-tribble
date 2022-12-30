site="http://73.66.228.201:9800/Movies/"
for letter in {A..Z} ; do
  target="${site}${letter}/"
  wget "${target}" -A mkv,mp4,avi,mov,qt,wmv,divx,flv,vob -nc -P '/mnt/OpenDrive/Videos/temp' -w 2 -r -nH --cut-dirs=3 -np -R "index.html*" ; wait
done


