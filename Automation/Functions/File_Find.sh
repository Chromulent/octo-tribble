#!/bin/sh

find_fiLe () {
        for i in *;do   
          if    
          [[ "$i" == *"${q}"* ]];then     
          echo "${i}"   
          fi 
        done
}


echo "What file are we attempting to find?"

read q


clear
find_fiLe 

