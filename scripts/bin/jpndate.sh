#!/bin/bash
dayofweek=`date +%a`
case $dayofweek in
	"Mon")
		youbi="月"
		;;
	"Tue")
		youbi="火"
		;;
	"Wed")
		youbi="水"
		;;
	"Thu")
		youbi="木"
		;;
	"Fri")
		youbi="金"
		;;
	"Sat")
		youbi="土"
		;;
	"Sun")
		youbi="日"
		;;
	*)
		youbi="?"
esac
#ampm=$([ `date +%p` == "AM" ] && echo "午前" || echo "午後");
echo `date '+%m月%d日'`$youbi`date '+%I:%M%p'`;
