for i in `cat File-Name.txt`
do
echo $i
wget ftp://ftp.cpc.ncep.noaa.gov/htdocs/degree_days/weighted/daily_data/1981/$i -P $i
done

wget -r -np -R "index.html*" ftp://ftp.cpc.ncep.noaa.gov/htdocs/degree_days/weighted/daily_data/
cp -rf ftp.cpc.ncep.noaa.gov/htdocs/degree_days/weighted/daily_data/* .
rm ftp.cpc.ncep.noaa.gov/htdocs/degree_days/weighted/daily_data/


wget -r -np -R "index.html*" ftp://newftp.epa.gov/Air/emismod/2016/v1/postv1_updates/
wget --no-check-certificate -r -np -R "index.html*" https://gaftp.epa.gov/Air/emismod/2016/v2/
