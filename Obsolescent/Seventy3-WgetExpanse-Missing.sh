

filmArray=( 		"http://73.66.228.201:9800/Movies/U/Unbreakable%20(2000).mkv"
	"http://73.66.228.201:9800/Movies/V/Victor%20Frankenstein%20(2015).mkv"
	"http://73.66.228.201:9800/Movies/T/Tenacious%20D%20in%20Pick%20Of%20Destiny.m4v"
	"http://73.66.228.201:9800/Movies/S/The%20Silence%20of%20the%20Lambs%20(1991).mkv"
	"http://73.66.228.201:9800/Movies/S/Sweeney%20Todd%20The%20Demon%20Barber%20of%20Fleet%20Street%20(2007).mkv"
	"http://73.66.228.201:9800/Movies/S/Sucker%20Punch%20(2011).mkv"
	"http://73.66.228.201:9800/Movies/S/Stargate%20(1994).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20Nemesis%20(2002).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20Into%20Darkness%20(2013).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20Insurrection%20(1998).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20IV%20The%20Voyage%20Home%20(1986).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20III%20The%20Search%20for%20Spock%20(1984).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20II%20The%20Wrath%20of%20Khan%20(1982).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20Generations%20(1994).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20First%20Contact%20(1996).mkv"
	"http://73.66.228.201:9800/Movies/S/Star%20Trek%20Beyond%20(2016).mkv"
)


for str in ${filmArray[@]}; do
  wget "$str" -A mkv,mp4,avi,mov,qt,wmv,divx,flv,vob -nc -P /mnt/OpenDrive/Videos/temp -w 2 
done



