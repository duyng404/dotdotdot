day=`date '+%d'`
month=`date '+%m'`
year=`date '+%Y'`
hour=`date '+%I'`
minute=`date '+%M'`
ampm=`date '+%p'`
filename="$year.$month.$day.md"
if [ -f ~/gitbox/journal/$filename ]; then
	printf "\n\n$hour:$minute$ampm\n\n" >> ~/gitbox/journal/$filename
	vi ~/gitbox/journal/$filename
else
	printf "/*\nTitle: \nDate: $year/$month/$day\nTags: \n*/\n\n$hour:$minute$ampm\n\n" > ~/gitbox/journal/$filename
	vi ~/gitbox/journal/$filename
fi
