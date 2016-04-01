#!/bin/bash
function help {
cat <<-"EOT"
usage:    ./lgfilter
                     search [-v] [-c number_lines_around] [-l number_lines_limit] "[year] day/month hour[:minutes:seconds]" ["keywords"]

examples: ./lgfilter
                     search "2008 03/03 09:58:14" "error"
                     search "2008 03/03 09:58:14"
                     search "03/03 09:58:14"
                     search "03/03 09:58:1"
                     search "03/03 09:58"
                     search "03/03 09"
EOT
}

if [ $# -eq 0 ]; then
    help
    exit 1
fi

if [ "$(uname)" != "Linux" ]; then rpath=`readlink "$0"`; else rpath=`readlink -f "$0"`; fi;
abs_path=$(dirname "$rpath")
. $abs_path/lib/yaml_parse
. $abs_path/lib/colors
. $abs_path/lib/track
. $abs_path/lib/date_format

option_total=0
while getopts vc:l: options
do	case "$options" in
    v)
		  verbose="1"
			(( option_total++ ))
			;;
		c)
			context="$OPTARG"
			(( option_total++ ))
			(( option_total++ ))
			;;
		l)
			limit="$OPTARG"
			(( option_total++ ))
			(( option_total++ ))
			;;
	  *)
			echo "Incorrect option";
			help
			exit 1;
			;;
	esac
done
for (( c=1; c<=$option_total; c++ ))
do
   shift;
done

eval $(parse_yaml lgfilter-config.yml)
logs=(${ids[@]})
ids=()

action=$1
instant=$2
keywords=$3

for log_id in "${logs[@]}"
do

	path="logs_"$log_id"_path"; path=${!path}
  date_format="logs_"$log_id"_date_format"; date_format=${!date_format}

  if [ "$action" != "" ];
    then
    . $abs_path/lib/action/$action
  fi

done
