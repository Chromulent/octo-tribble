#!/bin/sh

for d in */ ; do
  cd "$d"
    if_very_smol_del
    chmod 777 . -R
    if_aac_m4a_del 
    if_flac_mp3_del 
    if_webp_png_del 
    if_m4v_mkv_del 
    if_3gp_mp4_del 
    if_mov_webm_del 
    if_ts_mp4_del 
    if_avi_mp4_del
    if_avi_webm_del 
    if_mkv_mp4_del 
    if_mp4_webm_del 
  cd ..
done
