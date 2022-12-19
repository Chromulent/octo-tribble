# Replace $r with what you want to remove
# Replace $v with what you want to replace



for i in *;do
  if 
  [[ "$i" == *"$r"* ]];then
	sudo rename "s/$r/$v/g" "$i"
  fi
done



