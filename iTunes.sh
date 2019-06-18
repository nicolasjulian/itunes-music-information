#Get Latest Music Release in iTunes Music
#Nicolas Julian
#18 Juni 2019
#github.com/nicolasjulian
#API from RSS Apple Music

clear
echo "Getting Information From Apple Music...."
sleep 5
clear
cat <<EOF
	github@nicolasjulian
--------------------------------------------
	 [+]iTunes Music Release Tracker[+]
          	1.top-songs
          	2.hot-tracks
--------------------------------------------

EOF
read -p "Search in cathegory [1|2]: " pilih
if [[ $pilih == "1" ]]; then
	echo "Find from Top-Songs Apple Music"
	url="https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/100/explicit.json"
	else
		if [[ $pilih == "2" ]]; then
			echo "Find from New-Release Apple Music"
			url="https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/100/explicit.json"
		else
			exit
		fi
fi

req=`curl -s $url | jq '.feed.results[] | .artistName + " - " +  .name'`

read -p "Specific Artis [type 'n' to display all music list] : "  artis
if [[ artis == "" ]]; then
	echo $req
else
	cari=`echo "$req" | grep "$artis"` 
	if [[ $cari == "" ]]; then
		echo -e "\e[1;31mNothing Music From $artis [Pastikan Menggunakan Huruf Kapital di Awal Nama ]"
	else
		echo -e "\e[1;34m$cari"
	fi
fi
exit
