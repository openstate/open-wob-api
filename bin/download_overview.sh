#!/bin/bash
cd /opt/owa
source ../bin/activate

OVERVIEW_YEAR=`date '+%Y'``
OVERVIEW_URL=`curl -s "https://ckan.dataplatform.nl/api/3/action/package_show?id=wob-verzoeken-utrecht-overzicht-$OVERVIEW_YEAR" |./bin/get_newest_url.py`

if [ $? -eq 0 ];
then
  echo "$OVERVIEW_URL"
  wget -q -O "ocd_backend/overviews/utrecht/`date +%Y%W`.xlsx" "$OVERVIEW_URL"
fi
