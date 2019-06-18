#Get Latest Music Release in iTunes Music
#Nicolas Julian
#18 Juni 2019
#github.com/nicolasjulian
#API from RSS Apple Music

clear
echo "Getting Information From iTunes Music...."
sleep 5
clear
read -p "Seach in country [ID|US|UK|etc.] : " country

cat <<EOF

      \_/       
     (* *)        
    __)#(__
   ( )...( )(_)
   || |_| ||//
>==() | | ()/
    _(___)_
   [-]   [-]github@nicolasjulian
--------------------------------------------
	 [+]iTunes Music Release Tracker[+]
	       	1.top-songs
	       	2.hot-tracks
	       	3.new-music
	       	4.recent-release
--------------------------------------------

EOF
read -p "Search in cathegory [1|2|3|4]: " pilih
if [[ $pilih == "1" ]]; then
	echo "Find from Top-Songs iTunes Music"
	url="https://rss.itunes.apple.com/api/v1/$country/itunes-music/top-songs/all/100/explicit.json"
	else
		if [[ $pilih == "2" ]]; then
			echo "Find from Hot-Tracks iTunes Music"
			url="https://rss.itunes.apple.com/api/v1/$country/itunes-music/hot-tracks/all/100/explicit.json"
		else
			if [[ $pilih == "3" ]]; then
				echo "Find from New-Release iTunes Music"
				url="https://rss.itunes.apple.com/api/v1/$country/itunes-music/new-music/all/100/explicit.json"
				else
					if [[ $pilih == "4" ]]; then
						echo "Find from Recent Release iTunes Music"
						url="https://rss.itunes.apple.com/api/v1/$country/itunes-music/recent-releases/all/100/explicit.json"
					else
						exit
					fi
					
			fi
		fi
fi

req=`curl -s $url | jq '.feed.results[] | .artistName + " - " +  .name + " + Relase [" + .releaseDate + "]"'`

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
