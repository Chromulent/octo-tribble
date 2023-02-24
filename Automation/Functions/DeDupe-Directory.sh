#!/bin/sh


DeDupe-Dir () {

    # Define functions that we are going to be using for cleanup in later portions of our script.
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

}    

DeDupe-Dir