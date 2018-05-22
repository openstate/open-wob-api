#!/bin/bash
cd /opt/owa
source ../bin/activate

OVERVIEW_URL=`curl -s 'https://ckan.dataplatform.nl/api/3/action/package_show?id=wob-verzoeken-utrecht-overzicht-2018' |./bin/get_newest_url.py`

if [ $? -eq 0 ];
then
  echo "$OVERVIEW_URL"
  wget -q -O "ocd_backend/overviews/utrecht/201752.xlsx" "$OVERVIEW_URL"
fi
