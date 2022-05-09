sudo /usr/local/bin/accessuser jlindeq

chown -R jlindeq MOVES301_src

chgrp -R deq .

chmod ug+x -R .

scontrol write batch_script <jobid>

scontrol show job 932781 | grep TimeLimit
scontrol show job 932496 | grep TimeLimit
932781  normal_q camx710_  jlindeq  R   19:47:53      1 ca078
932496  normal_q 2016_cam  jlindeq  R 1-22:06:32      1 ca077
sudo scontrol update jobid=943185 TimeLimit=17-00:00:00
sudo scontrol update jobid=932496 TimeLimit=12-00:00:00

sudo scontrol update jobid=918967 TimeLimit=12-00:00:00
sudo scontrol update jobid=919092 TimeLimit=12-00:00:00

sudo scontrol update jobid=925094 TimeLimit=12-00:00:00

tinkercliffs:
	- MOVES
Non-road task:
	- MOVES3;
1.
/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests/test1
/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests/test1/scripts

2. copy and modify the scripts:
	sbatch the

3. /groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests/test1/post_proc
	much lower than Sonya result;

total 22M
-rwxr-xr-x 1 jlindeq deq 8.8K Feb 17 08:19 annual.frm
-rwxr-xr-x 1 jlindeq deq 2.0K Feb 17 08:19 annual.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 annual.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 apuusage.frm
-rwxr-xr-x 1 jlindeq deq   70 Feb 17 08:19 apuusage.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 apuusage.MYI
-rwxr-xr-x 1 jlindeq deq  13K Feb 17 08:19 auditlog.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 auditlog.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 auditlog.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 avft.frm
-rwxr-xr-x 1 jlindeq deq  46K Feb 17 08:19 avft.MYD
-rwxr-xr-x 1 jlindeq deq 132K Feb 17 08:19 avft.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 avgspeeddistribution.frm
-rwxr-xr-x 1 jlindeq deq 507K Feb 17 08:19 avgspeeddistribution.MYD
-rwxr-xr-x 1 jlindeq deq 2.0M Feb 17 08:19 avgspeeddistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.4K Feb 17 08:19 converttempmessages.frm
-rwxr-xr-x 1 jlindeq deq   64 Feb 17 08:19 converttempmessages.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 converttempmessages.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 county.frm
-rwxr-xr-x 1 jlindeq deq   70 Feb 17 08:19 county.MYD
-rwxr-xr-x 1 jlindeq deq 4.0K Feb 17 08:19 county.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 countyyear.frm
-rwxr-xr-x 1 jlindeq deq   15 Feb 17 08:19 countyyear.MYD
-rwxr-xr-x 1 jlindeq deq 5.0K Feb 17 08:19 countyyear.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 dayvmtfraction.frm
-rwxr-xr-x 1 jlindeq deq  20K Feb 17 08:19 dayvmtfraction.MYD
-rwxr-xr-x 1 jlindeq deq  84K Feb 17 08:19 dayvmtfraction.MYI
-rwxr-xr-x 1 jlindeq deq   61 Feb 17 08:19 db.opt
-rwxr-xr-x 1 jlindeq deq 8.8K Feb 17 08:19 drafthotellinghours.frm
-rwxr-xr-x 1 jlindeq deq 803K Feb 17 08:19 drafthotellinghours.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 drafthotellinghours.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 drafthours.frm
-rwxr-xr-x 1 jlindeq deq 227K Feb 17 08:19 drafthours.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 drafthours.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 driveschedulesecondlink.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 driveschedulesecondlink.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 driveschedulesecondlink.MYI
-rwxr-xr-x 1 jlindeq deq 9.2K Feb 17 08:19 fuelformulation.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 fuelformulation.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 fuelformulation.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 fuelsupply.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 fuelsupply.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 fuelsupply.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 fuelusagefraction.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 fuelusagefraction.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 fuelusagefraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 hotellingactivitydistribution.frm
-rwxr-xr-x 1 jlindeq deq   88 Feb 17 08:19 hotellingactivitydistribution.MYD
-rwxr-xr-x 1 jlindeq deq 2.0K Feb 17 08:19 hotellingactivitydistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 hotellinghours.frm
-rwxr-xr-x 1 jlindeq deq 419K Feb 17 08:19 hotellinghours.MYD
-rwxr-xr-x 1 jlindeq deq 1.3M Feb 17 08:19 hotellinghours.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 hourvmtfraction.frm
-rwxr-xr-x 1 jlindeq deq  40K Feb 17 08:19 hourvmtfraction.MYD
-rwxr-xr-x 1 jlindeq deq 160K Feb 17 08:19 hourvmtfraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 hpmsvtypeyear.frm
-rwxr-xr-x 1 jlindeq deq   65 Feb 17 08:19 hpmsvtypeyear.MYD
-rwxr-xr-x 1 jlindeq deq 5.0K Feb 17 08:19 hpmsvtypeyear.MYI
-rwxr-xr-x 1 jlindeq deq 8.9K Feb 17 08:19 imcoverage.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 imcoverage.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 imcoverage.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 importstartsopmodedistribution.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 importstartsopmodedistribution.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 importstartsopmodedistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 link.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 link.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 link.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 linksourcetypehour.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 linksourcetypehour.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 linksourcetypehour.MYI
-rwxr-xr-x 1 jlindeq deq 8.8K Feb 17 08:19 monthly.frm
-rwxr-xr-x 1 jlindeq deq  14K Feb 17 08:19 monthly.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 monthly.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 monthvmtfraction.frm
-rwxr-xr-x 1 jlindeq deq 1.4K Feb 17 08:19 monthvmtfraction.MYD
-rwxr-xr-x 1 jlindeq deq  10K Feb 17 08:19 monthvmtfraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 monthvmt.frm
-rwxr-xr-x 1 jlindeq deq 4.3K Feb 17 08:19 monthvmt.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 monthvmt.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 offnetworklink.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 offnetworklink.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 offnetworklink.MYI
-rwxr-xr-x 1 jlindeq deq 8.8K Feb 17 08:19 onroadretrofit.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 onroadretrofit.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 onroadretrofit.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 opmodedistribution.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 opmodedistribution.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 opmodedistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 regioncounty.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 regioncounty.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 regioncounty.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 roadtypedistribution.frm
-rwxr-xr-x 1 jlindeq deq  585 Feb 17 08:19 roadtypedistribution.MYD
-rwxr-xr-x 1 jlindeq deq 5.0K Feb 17 08:19 roadtypedistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 roadtype.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 roadtype.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 roadtype.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 sourcetypeagedistribution.frm
-rwxr-xr-x 1 jlindeq deq 4.4K Feb 17 08:19 sourcetypeagedistribution.MYD
-rwxr-xr-x 1 jlindeq deq  23K Feb 17 08:19 sourcetypeagedistribution.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 sourcetypeyear.frm
-rwxr-xr-x 1 jlindeq deq  221 Feb 17 08:19 sourcetypeyear.MYD
-rwxr-xr-x 1 jlindeq deq 5.0K Feb 17 08:19 sourcetypeyear.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 starts.frm
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 startshourfraction.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 startshourfraction.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 startshourfraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 startsmonthadjust.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 startsmonthadjust.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 startsmonthadjust.MYI
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 starts.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 starts.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 startsperday.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 startsperday.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 startsperday.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 startssourcetypefraction.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 startssourcetypefraction.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 startssourcetypefraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 state.frm
-rwxr-xr-x 1 jlindeq deq   30 Feb 17 08:19 state.MYD
-rwxr-xr-x 1 jlindeq deq 2.0K Feb 17 08:19 state.MYI
-rwxr-xr-x 1 jlindeq deq 8.7K Feb 17 08:19 travelfraction.frm
-rwxr-xr-x 1 jlindeq deq 1.5K Feb 17 08:19 travelfraction.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 travelfraction.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 year.frm
-rwxr-xr-x 1 jlindeq deq    7 Feb 17 08:19 year.MYD
-rwxr-xr-x 1 jlindeq deq 3.0K Feb 17 08:19 year.MYI
-rwxr-xr-x 1 jlindeq deq 8.6K Feb 17 08:19 zone.frm
-rwxr-xr-x 1 jlindeq deq 8.8K Feb 17 08:19 zonemonthhour.frm
-rwxr-xr-x 1 jlindeq deq    0 Feb 17 08:19 zonemonthhour.MYD
-rwxr-xr-x 1 jlindeq deq 1.0K Feb 17 08:19 zonemonthhour.MYI
-rwxr-xr-x 1 jlindeq deq   21 Feb 17 08:19 zone.MYD
-rwxr-xr-x 1 jlindeq deq 5.0K Feb 17 08:19 zone.MYI
-rwxr-xr-x 1 jlindeq deq 8.5K Feb 17 08:19 zoneroadtype.frm
-rwxr-xr-x 1 jlindeq deq   44 Feb 17 08:19 zoneroadtype.MYD
-rwxr-xr-x 1 jlindeq deq 3.0K Feb 17 08:19 zoneroadtype.MYI
