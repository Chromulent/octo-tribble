
#!/bin/sh

Video-Transmorgification () {

extArray=(
  # "aac "
  # "flac"  
  # "webp" 
  "3gp"
  "mov"
  "avi"
  "m4v"
  "ts"
  "mkv"
  "mp4"
  "webm"
  # ""
)

if_aac_m4a_del () {
for f in *.aac; do
  [ -e "${f%.*}.m4a" ] && rm -rf "$f"
done }

if_flac_mp3_del () {
for f in *.flac; do
  [ -e "${f%.*}.mp3" ] && rm -rf "$f"
done }

if_webp_png_del () {
for f in *.webp; do
  [ -e "${f%.*}.png" ] && rm -rf "$f"
done }

if_3gp_mp4_del () {
for f in *.3gp; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done }

if_mov_webm_del () {
for f in *.mov; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done }

if_ts_mp4_del () {
for f in *.ts; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done }

if_m4v_mkv_del () {
for f in *.m4v; do
  [ -e "${f%.*}.mkv" ] && rm -rf "$f"
done }

if_avi_mp4_del () {
for f in *.avi; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done }

if_avi_webm_del () {
for f in *.avi; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done }

if_mkv_mp4_del () {
for f in *.mkv; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done }

if_mp4_webm_del () {
for f in *.mp4; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done }

if_very_smol_del () {
for f in *.*; do
  fsize=$(find "$f" -printf "%s")
  if [[ "$fsize" -lt "500000"  ]] ;
    then rm -rf "$f" ; 
  fi 
done }

for ext in ${extArray[@]}; do
  ext=".$ext"
  numExt="$(find . -mindepth 1 -type f -name "*$ext" -exec printf x \; | wc -c)"
  sleep 3s
  if (( $numExt > 0 )); then opArr="$( find . -mindepth 1 -type f -name "*$ext" )"; fi

  readarray -t newOpArr < <(printf '%b\n' "${opArr[@]}")
  
  for opVal in "${newOpArr[@]}" ; do
 
	if [ "$ext" = ".avi" ]; then ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.*}.webm"; fi 
	
	if [[ "$ext" == *.aac* ]];    then ffmpeg -y - i "$opVal" -codec: copy "${opVal%.*}.m4a"; fi 
	if [[ "$ext" == *.flac* ]];   then ffmpeg -y -i "$opVal" -acodec libmp3lame -ab 128k "${opVal%.*}.mp3"; fi 
	if [[ "$ext" == *.webp* ]];   then ffmpeg -y -i "$opVal" "${opVal%.*}.png"; fi 
	if [[ "$ext" == *.m4v* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy "${opVal%.*}.mkv"; fi 
  if [[ "$ext" == *.3gp* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy "${opVal%.*}.mp4"; fi
  if [[ "$ext" == *.mov* ]];    then ffmpeg -y -i "$opVal"  -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.*}.webm"; fi
	if [[ "$ext" == *.ts* ]];     then ffmpeg -y -i "$opVal" "${opVal%.*}.mp4"; fi   
	if [[ "$ext" == *.avi* ]];    then ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.*}.webm"; fi 
	if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -c copy "${opVal%.*}.mp4"; fi 
	# if [[ "$ext" == *.mkv* ]];  then ffmpeg -y -i "$opVal" -vf subtitles=input.mkv "${opVal%.*}.mp4"; fi 
	# if [[ "$ext" == *.mkv* ]];  then ffmpeg -y -i "$opVal" -c copy -c:s mov_text "${opVal%.*}.mp4"; fi 
	if [[ "$ext" == *.mp4* ]];    then ffmpeg -y -i "$opVal" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.*}.webm"; fi 
  done   

    if_very_smol_del
    if [[ "$ext" == *.aac* ]];  then if_aac_m4a_del; fi 
    if [[ "$ext" == *.flac* ]]; then if_flac_mp3_del; fi 
    if [[ "$ext" == *.webp* ]]; then if_webp_png_del; fi 
    if [[ "$ext" == *.m4v* ]];  then if_m4v_mkv_del; fi 
    if [[ "$ext" == *.3gp* ]];  then if_3gp_mp4_del; fi 
    if [[ "$ext" == *.mov* ]];  then if_mov_webm_del; fi 
    if [[ "$ext" == *.ts*  ]];  then if_ts_mp4_del; fi 
    if [[ "$ext" == *.avi* ]];  then if_avi_mp4_del ; if_avi_webm_del; fi 
    if [[ "$ext" == *.mkv* ]];  then if_mkv_mp4_del; fi 
    if [[ "$ext" == *.mp4* ]];  then if_mp4_webm_del; fi 

	exten="*$ext"
	mv "$exten" /mnt/octo/failed_conv/

done

}

# Video-Transmorgification