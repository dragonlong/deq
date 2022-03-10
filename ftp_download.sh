cd /groups/deq/cascades/data/2016v2
wget --no-check-certificate -r -np -R "index.html*" https://gaftp.epa.gov/Air/emismod/2016/v2/
mv gaftp.epa.gov/Air/emismod/2016/v2/* .
gaftp.epa.gov/Air/emismod/2016/v2/
cp -r gaftp.epa.gov/Air/emismod/2016/v2/* . &
x
