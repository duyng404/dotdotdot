#/bin/bash
ss=""
for (( i=$#;i>0;i-- ));do
	track="${!i}"
	ss="file://"
	ss="$ss$track"
	mpc --host "$MPD_HOST" insert "$ss"
done
mpc next
