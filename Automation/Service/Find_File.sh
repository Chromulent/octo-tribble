#!/bin/sh

find_fiLe () {
        for i in *;do   
          if    
          [[ "$i" == *"${q}"* ]];then     
          echo "${i}"   
          fi 
        done
}
