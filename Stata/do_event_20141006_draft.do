*log close 

clear all

set more off
set mem 2000m
set maxvar 30000

cd  "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"

log using "do_event_yyyymmdd_nn.txt", text replace

* (copy this area to evernote) 
* 1. file name : do_event_yyyymmdd.do 
* 2. role of this program: 
*     1) Construct marital duration information of mh files 
*     2) Consider death of individual 
*     3) Consider eliblity of individual (born in the US) 
* 3. inputs: 
* -ind_fam_1.dta (individual+family) 
* 	but I will only use event information (death, inus, date of interview) 
*   id68r_ idpr_ *_m wghtavg_i ydeath_i inus_* smpl_i idate_f* (interview date from fam file) 
* -mh85_11.dta (original data) 
* 4. outputs: 
* event.dta 
*Contains data from event.dta
*  obs:        87,104                          
* vars:            47                          6 Aug 2014 14:00
* size:    16,027,136 (99.3% of memory free)
* countr_==1 one individual counted once 
* addm_us ==1 marriage starts in the US
* adds_us ==1 siglehood starts in the US 
* (based on inus_i1990, inus_i1992, only for Hispanics ) 
* durm, exitm: marriage duration, completion(by divorce) 
* durs, exits: singlehood duration, completion
* (I assume that they start search when they become agem_min_g )
* (I consider sinlgehood up to agem_max_g) 
* nrecordm: # of marriage records
* nrecords: # of singlehood records 
* 5. date:
* first composed : 2013/09/06
* last runned : do_event_20141006_draft
* 6. notes: 
*	1)   based on do_event_20140228_01 
*	2) report: do_event_20130907_01 key outputs.txt (workspace2) 
*      report: do_event_20131015_key_outputs.doc (workspace2) 
* 		(for workspace3 running, this document contains all relavant info) 
* 7. things to do more: 
* 	1) robustness check : agem_min_g and agem_max_g (currently 16-65) 
*	2) robustness check : I gave 2 weeks for durations <=0 (singlehood and marriage) 
* 		because I want to use the information that those durations were short ones. 
* 		but in the case of errors in the data, drop them? 
* 	3) 4.38 years of mean singlehood duration between two marriages
*		this can be the evidence against on-the-marriage search 
* 	4) I did not use duration patterns start outside of the US (Latino samples) 


clear all 
use mh85_11, replace 

************************************************
* first rename variables (_m )

rename MH1 id68_m
rename MH2 idp_m
rename MH3 sex_m
rename MH4 mborn_m
rename MH5 yborn_m
rename MH6 id68sp_m
rename MH7 idpsp_m
rename MH8 orderm_m
rename MH9 mstartm_m
rename MH10 ystartm_m
rename MH11 thism_m
rename MH12 mendm_m
rename MH13 yendm_m
rename MH14 msepm_m
rename MH15 ysepm_m
rename MH16 ydata_m
rename MH17 nm_m
rename MH18 nowm_m
rename MH19 nrecord_m
rename MH20 release_m

gen id68r_=id68_m
gen idpr_=idp_m 

save mh_ing01, replace

clear
use ind_fam_1 

* merge this with individual data 
merge 1:m id68r_ idpr_ using mh_ing01 
drop _merge 

keep id68r_ idpr_ *_m wghtavg_i ydeath_i inus_* smpl_i idate_f*

save mh_ing1, replace


************************************************
** hazard analysis (hazard of death) : I decided not to use this result. 

clear
use mh_ing1 

* delete invalid values
replace mborn_m=. if mborn_m>90
replace yborn_m=. if yborn_m>9000

replace orderm_m=. if orderm_m>90

replace ystartm_m=. if ystartm_m>9000
replace yendm_m=. if yendm_m>9000
replace ysepm_m=. if ysepm_m>9000
replace nm_m=. if nm_m>90

replace inus_i1990=. if inus_i1990==0 | inus_i1990>9000
replace inus_i1992=. if inus_i1992==0 | inus_i1992>9000

gen yinus_=. 
* in what year did you come to the US to stay? (for Latino samples)

label variable yinus_ "year come to the US"

label variable ydeath_ "year die"

replace yinus_=inus_i1990 
replace yinus_=inus_i1992 if yinus_==. 

gen ydeath_=.
replace ydeath_=ydeath_i if ydeath_i!=0 
replace ydeath_=. if ydeath_i==9999
replace ydeath_=. if ydeath_i>6000 
* 213 
replace ydeath_=. if ydeath_i<800
* 38

foreach i of numlist 1985(1)1996 {
	replace idate_f`i'=. if idate_f`i'==9999
	* date of interview 
	* egen idatem_f`i'=mean(idate_f`i')
	* take average (same for all samples) why do I need this?? (I don't need this) 
}
*
order id68r_ idpr_  sex_m yborn_m ydeath_ yinus_ wghtavg_i smpl_i id68sp_m idpsp_m  orderm_m ystartm_m thism_m yendm_m ydata_m nm_m nowm_m


************************************************
* for data by individual, just choose countr_==1 
* count respondent once : countr_==1
sort id68r_ idpr_ orderm_m

by id68r_ idpr_ : gen countr_=_n 

tab sex_m if countr_==1
sum yborn_m if countr_==1, de
tab ydata_m if countr_==1 
tab nm_m if countr_==1
tab nowm_m if countr_==1
tab nrecord_m if countr_==1 

tab ystartm_m 
sum ystartm_m, detail 

tab nowm_m if countr_==1 & ydata_m==2011

tab countr_ if release_m==1


************************************************
* restrict sample (people born before or in 1995,
* since by the last data is collected (2011), 
* people who are born after 1996 were still under age 16. 
*gen add_yearborn=. 
*label variable add "born before 1995, added to the analysis"

*replace add_yearborn=1 if yborn_m<=1995 & yborn_m!=. 
*replace add_yearborn=0 if yborn_m>1995  & yborn_m!=. 

*tab add_yearborn 
*tab yborn_m if add_yearborn==0
* I am not using their info anyway in my construction of durations.. 

*****************************************************
** duration of life (durl, exitl)

* death 
gen durl= ydeath_- yborn_m 
gen exitl= 1 if durl!=. 

* alive
replace durl= ydata_m - yborn_m if durl==. 
replace exitl= 0 if exitl==. & durl!=. 

tab exitl, sum(durl)

* let's do the hazard analysis 
*stset, clear
stset durl, failure(exitl) 
streg if countr_==1 , dist(exp)
predict ttdeath if countr_==1, mean time 
predict hhdeath if countr_==1, hazard 
sum hhdeath
sum ttdeath 
* 542 years. doesn't make any sense. 
* I think this is due to their identifying one's death is not perfect, 
* 	some deaths may be recorded as censored due to their data collection. 
* I will not estimate dealta from the PSID data. 


* let's do the hazard analysis 
stset, clear
stset durl, failure(exitl) 
streg if countr_==1 & exitl==1, dist(exp)
* consider only who exit, then I get hh=.015 and tt=67.7 
predict ttdeath1 if countr_==1, mean time 
predict hhdeath1 if countr_==1, hazard 
sum hhdeath1
sum ttdeath1

stset, clear  

save mh_ing2, replace


************************************************
* considering information on month 

clear
use mh_ing2 

* considering information on month 
* y,mborn_m
* y,mstartm_m
* y,mendm_m 
* ydata_m

* idate_f`y' 
foreach y of numlist 1985(1)1996{
	gen mdata1_`y'=. 
	gen mdata_`y'=. 
	gen ddata_`y'=. 
		* actual 
*	gen mdata_m`y'=.
		* average 
	foreach i of numlist 1(1)12{
		replace mdata1_`y'=`i' if idate_f`y'>(`i'*100 -1) & idate_f`y'<((`i'+1)*100 -1)
		* if idate_fyyyy=304 then it is bigger than 299 and smaller than 399 
		* thus mdata1_yyyy= 3 
	}
	replace ddata_`y'=idate_f`y'-(mdata1_`y'*100)
	* thus we can only take 'day', not 'month' information. 
	replace mdata_`y'=mdata1_`y'+(ddata_`y'/31) 
	}
*
gen ydata_=. 
foreach y of numlist 1985(1)1996{
*	sum mdata_`y', de
	replace ydata_= ydata_m + (mdata_`y'-1)*(1/12) if ydata_m==`y' 
}
* if month info not available, assume that survey is done in July 1st. 
foreach y of numlist 1985(1)1996 1997(2)2011{
	replace ydata_= ydata_m+ 1/2 if ydata_m==`y' & ydata_==. 
}
*

gen yborn_=. 

foreach i of numlist 1(1)12 {
	replace yborn_=yborn_m+ (`i'*2-1)/24  if mborn_m==`i'
}
replace yborn_=yborn_m+ 1/2 if (mborn_m==.| mborn_m==98) & yborn_m!=. & yborn_==.


gen ystartm_=. 

foreach i of numlist 1(1)12 {
	replace ystartm_=ystartm_m + (`i'*2-1)/24 if mstartm_m==`i'
}
replace ystartm_=ystartm_m + (1*2-1)/24 if mstartm_m==21
replace ystartm_=ystartm_m + (4*2-1)/24 if mstartm_m==22
replace ystartm_=ystartm_m + (7*2-1)/24 if mstartm_m==23
replace ystartm_=ystartm_m + (10*2-1)/24 if mstartm_m==24
replace ystartm_=ystartm_m + 1/2 if (mstartm_m==. | mstartm_m==98) & ystartm_m!=. & ystartm_==. 


gen yendm_=. 

foreach i of numlist 1(1)12 {
	replace yendm_=yendm_m + (`i'*2-1)/24 if mendm_m==`i'
}
replace yendm_=yendm_m + (1*2-1)/24 if mendm_m==21
replace yendm_=yendm_m + (4*2-1)/24 if mendm_m==22
replace yendm_=yendm_m + (7*2-1)/24 if mendm_m==23
replace yendm_=yendm_m + (10*2-1)/24 if mendm_m==24
replace yendm_=yendm_m + 1/2 if (mendm_m==. | mendm_m==98) & yendm_m!=. & yendm_==. 



* yborn_ , ystratm_, yendm_ , ydata_ (use this!) 

drop mdata_* ddata_* mdata1_*  idate_* 

sum yborn_ ystartm_ yendm_ ydata_ 

save mh_ing3, replace


************************************************
* setting bounds for keeping track of singlehood duration (16-65) 

clear
use mh_ing3 


** generation 
gen agecohort=. 
* agecohort= 3 then born [1930~1940] 

foreach i of numlist 2(1)11 {
	replace agecohort=`i' if  yborn_ >= 1900 + (`i'*10-10) & yborn_< (1900+ `i'*10) 
}
replace agecohort=1 if yborn_< 1910.04 
* 

tab agecohort, sum(yborn_) 


* age at marriage
gen agem_= ystartm_ - yborn_ 

* age at first marriage 
tab agecohort if orderm_m==1 , sum(agem_) 

sum agem_ if orderm_m==1, de 
sum agem_ if orderm_m==1 & ystartm_ >=1968, de 
sum agem_ if orderm_m==1 & ystartm_ >=1968 & sex_m==1, de 
sum agem_ if orderm_m==1 & ystartm_ >=1968 & sex_m==2, de 
sum agem_ if orderm_m>1 & ystartm_ >=1968, de 
sum agem_ if orderm_m>1 & ystartm_ >=1968 & sex_m==1, de 
sum agem_ if orderm_m>1 & ystartm_ >=1968 & sex_m==2, de 
sum agem_ if ystartm_ >=1968, de 
sum agem_ if ystartm_ >=1968 & sex_m==1, de 
sum agem_ if ystartm_ >=1968 & sex_m==2, de 

*foreach i of numlist 1(1)11 {
*	sum agem_ if agecohort==`i' & orderm_m==1 , de
*}
*

*foreach i of numlist 1(1)11 {
*	sum agem_ if agecohort==`i' & ystartm_ >=1968 , de
*}
*
* The different patterns across generations are not easily shown 
* 	based on this direct comparison. I should consider their different censoring.. 

gen agem_min=16
* lowest 1% of age at first marriage 
gen agem_max=63.16663 
* highest 1% of age at all marriages  
replace agem_max=16+50 
* covers 

* male
gen agem_min_m=17.1663
gen agem_max_m=65.25 
* If I consider later marriages, this becomes 75 

* female 
gen agem_min_f=15.58337
gen agem_max_f=59.66675
* If I consider later marriages, this becomes 69.45837

* both genders together 
gen agem_min_g=. 
gen agem_max_g=. 

* let's just keep track 50 years of singlehood 
*replace agem_min_g=agem_min_m if sex_m==1 
*replace agem_max_g=agem_min_m+50 if sex_m==1 
*replace agem_min_g=agem_min_f if sex_m==2 
*replace agem_max_g=agem_min_f+50 if sex_m==2 

* let's do 16-65 (2013/11/28)
replace agem_min_g=16
replace agem_max_g=65

sum agem_*

sum agem_min_g agem_max_g if sex_m==1
sum agem_min_g agem_max_g if sex_m==2

sum agem_ if ystartm_ >=1968 & ystartm_!=. & sex_m==1, de 
sum agem_ if ystartm_ >=1968 & ystartm_!=. & sex_m==2, de 
* the min_g-max_g covers over 98 percent of observed age at marriage 

sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_min_g <= agem_ & agem_max_g >= agem_ & sex_m==1 
sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_min_g <= agem_ & agem_max_g >= agem_ & sex_m==2 

display 12600/12752
display 13070/13307

**************************************
** to draft (singlehood window)
display (12600+13070)/(12752+13307) 
* The window covers (98507234) 98.5% of all recorded singlehood duration after 1968 
**************************************

*sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_min_g > agem_ & sex_m==1 
*sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_min_g > agem_ & sex_m==2 

*sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_max_g < agem_ & sex_m==1 
*sum agem_ if ystartm_>=1968 & ystartm_!=. & agem_max_g < agem_ & sex_m==2 

* 16-65
*display (21+162)/12752
*display (131+75)/13307
*display 12600/12752
*display 13070/13307
* male: 21, 162 observations married before age 16. (total : 12752) 
* female: 131, 75 observations married after age 65. (total : 13307) 
* 1.4% , 1.5% of data of mstart we can't capture.

drop agem_max agem_min_m agem_max_m agem_max_f agem_min_f 

save mh_ing4, replace


********************************************************
** duration of marriages (durm, exitm) 

clear
use mh_ing4 

* marriage ended in divorce or annulment 
gen durm= yendm_- ystartm_ if thism_m==4 
gen exitm= 1 if durm!=. 
sum durm, de
*replace durm=1/24 if durm <= 0 

* marriage intact 
replace durm= ydata_ - ystartm_ if thism_m==1 
replace exitm= 0 if exitm==. & durm!=. 
sum durm if exitm==0, de
*replace durm=1/24 if durm <= 0 

* marriage widowed
replace durm= yendm_ - ystartm_ if thism_m==3
replace exitm= 0 if exitm==. & durm!=. 
gen exitmw=exitm 
replace exitmw=2 if thism_m==3
sum durm if exitmw==2, de 

sum durm, de 
sum durm if durm<=0, de

sum durm if ystartm_>=1968 , de
sum durm if ystartm_>=1968 & durm <0 ,de
sum durm if ystartm_>=1968 & durm ==0  
* (39 durm==0, 57 obs. durm < 0) 

**************************************
** to draft (cases where durm<0) 
display 57/24682
* .00230938
**************************************
 
replace durm=0 if durm<0 & durm!=. & ystartm_>=1968
replace durm=0 if durm<0 & durm!=.  


*replace durm=1/24 if durm <=0 & ystartm_>=1968   
* replace durm=7/365 if durm <=0 & ystartm_>=1968 
* 15 days (.041626) 7 days? (.01917808) -> 7 days 
* 96 real changes made (what about not using them?) 
* claiming that short durations are short. (rather than not using them..) 

*replace durm=1/24 if durm <=0 
* replace durm=7/365 if durm <=0 

replace durm=0 if durm<0 & durm!=. & ystartm_>=1968
replace durm=0 if durm<0 & durm!=. 

sum durm if ystartm_>=1968, de 


* censoring 
tab exitmw
tab exitmw, sum(durm) 
tab exitm, sum(durm) 
tab exitmw if exitm==0

sum durm if exitmw==0 & ystartm_ >=1968, de
sum durm if exitmw==1 & ystartm_ >=1968, de
sum durm if exitmw==2 & ystartm_ >=1968, de
sum durm if exitm==0 & ystartm_ >=1968, de
sum durm if exitm==1 & ystartm_ >=1968, de

** marriage duration I include and exclude

sum durm if ystartm_>=1968, de

sum durm exitm
sum durm exitm if ystartm_<1968 
sum durm exitm if ystartm_>=1968

sum exitmw if exitm==0 & ystartm_>=1968 
* 

save mh_ing5, replace


*******************************
** duration of singlehood 
clear
use mh_ing5

*order id68r_ idpr_ nm_ orderm_m thism_m nowm_m yborn_ ystartm_ yendm_ ydata_ durm exitm

* let's construct ystarts_ yends_ 
* starting of singlehood, ending of singlehood

gen ystarts_=. 
gen yends_=. 
gen exits1=. 

* first marriage (they start marital search when they become agem_min_g) 
* exit to marriage 
replace ystarts_= yborn_+agem_min_g if orderm_m==1 
replace yends_= ystartm_ if orderm_m==1
replace exits1=1 if ystartm_!=. & orderm_m==1

* never married 
replace ystarts_= yborn_+ agem_min_g if nm_m==0 
replace yends_= ydata_ if nm_m==0 
replace exits1=0 if nm_m==0 

sum ystarts_ 
sum yends_ 

* later marriages 
* (complete singlehood duration)
sort id68r_ idpr_ orderm_m 
by id68r_ idpr_ : replace ystarts_ = yendm_[_n-1] if orderm_m[_n]==orderm_m[_n-1]+1 & orderm_m[_n]>1 & orderm_m[_n]!=.  & nm_m>1 & nm_m!=. 
by id68r_ idpr_ : replace yends_ = ystartm_[_n] if orderm_m[_n]==orderm_m[_n-1]+1 & orderm_m[_n]>1 & orderm_m[_n]!=.  & nm_m>1 & nm_m!=. & ystarts_!=. 
by id68r_ idpr_ : replace exits1=1 if yends_!=. & orderm_m[_n]==orderm_m[_n-1]+1 & orderm_m[_n]>1 & orderm_m[_n]!=.  & nm_m>1 & nm_m!=. & ystarts_!=. 

sum ystarts_ 
sum yends_
sum exits1 

save mh_for_append1, replace

clear 
use mh_for_append1 

* (incomplete singlehood durations)
gen ystarts3=. 
gen yends3=. 
gen exits3=. 

sort id68r_ idpr_ orderm_m 
by id68r_ idpr_ : replace ystarts3= yendm_ if nm_m== orderm_m 
by id68r_ idpr_ : replace yends3= ydata_ if nm_m== orderm_m & ystarts3!=. 
replace exits3=0 if ystarts3!=. 

*order id68r_ idpr_ nm_ orderm_m thism_m nowm_m yborn_ ystartm_ yendm_ ydata_ ystarts_ yends_ ystarts3 yends3 exits3 durm exitm 
 
keep if ystarts3!=. 

replace ystarts_= ystarts3
replace yends_=yends3
replace orderm_m= orderm_m+1 
replace nrecord_m= nrecord_m+1 
replace exits1= exits3 

keep id68r_ idpr_ sex_m nm_m orderm_m nowm_ yborn_ ydata_ ystarts_ yends_ exits1 ystarts3 yends3 exits3 wghtavg_i smpl_i inus_i* nrecord_m release_m agem_* 
drop agem_

save mh_for_append2, replace

clear 

use mh_for_append1 
append using mh_for_append2 

sort id68r_ idpr_ orderm_m 
*order id68r_ idpr_ nm_ orderm_m thism_m nowm_m yborn_ ystarts_ yends_ exits1 ystartm_ yendm_ ydata_  durm exitm 

save mh_ing6, replace


*****************************
** singlehood durations (continued) 

clear
use mh_ing6 
 
** singlehood durations
gen durs1=. 
gen durs=. 
gen exits=. 

replace durs1= yends_- ystarts_ 


*order id68r_ idpr_ nm_ orderm_m thism_m nowm_m yborn_ ystarts_ yends_ durs1 exits1 ystartm_ yendm_ ydata_  durm exitm 

* consider starting points 
sum durs1, de
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==1 , de 
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==2 , de 
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==1 & durs1<=0 , de 
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==2 & durs1<=0, de 
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==1 & durs1<=0 & orderm_m==1 , de 
sum durs1 if ystarts_>=1968 & ystarts_!=. & sex_m==2 & durs1<=0 & orderm_m==1, de 

replace durs=durs1 
* drop info from young people. 
* who are younger than age 16 when the data is collected. 
* ydata_ is less than ystarts_ 
replace durs=. if durs1<0 & ydata_ < ystarts_ & yborn_!=. & ystarts_!=. 
* 3745 real changes made 

sum durs if ystarts_>=1968, de
sum durs if durs1==0 & ystarts_>=1968, de
* 143
sum durs if durs1<0 & ystarts_>=1968 , de
* 204

**************************************
** to draft (cases where durs<0)
display 204/41356
* .00493278 
sum durs if orderm_m>1 & exits1==1 & ystarts_>=1968 , de 
* mean compeleted duration between two marriages: 4.12 years (includes only completed spells)
**************************************

tab orderm_m if durs<=0 & ystarts_>=1968
tab exits1 if durs<=0 & ystarts_>=1968 

sum durs if orderm_m>1, de

sum durs if orderm_m>1 & exits1==1 , de 
sum durs if durs==0 & orderm_m>1, de
* 140 
sum durs if durs<0 & orderm_m>1, de
* mean compeleted duration between two marriages: 4.38 years (includes only completed spells)
display 27/6346 
* less than 0.004 begin later marriages before ending previous marriages
sum durs if orderm_m==1 & exits1==1 , de 
* mean compeleted duration before first marriages: 7.77 years 

hist durs

sum durs
* replace durs=1/24 if durs1<=0 & durs!=.
replace durs=0 if durs<0 & durs!=. & ystarts_>=1968
replace durs=0 if durs<0 & durs!=. 
* replace durs=7/365 if durs1<=0 & durs!=. 


replace exits=exits1 if durs!=. 

sum durs, de
sum exits, de
sum durs if sex_m==1, de
sum exits if sex_m==1, de
sum durs if sex_m==2, de
sum exits if sex_m==2, de
sum durs if sex_m==1 & orderm_m==1, de
sum durs if sex_m==2 & orderm_m==1, de

* consider ending points 
* do not use singlehood duration when they start search over agem_max_g 
sum durs 
sum durs if ystarts_ > yborn_+ agem_max_g & ystarts_!=. & yborn_!=. & agem_max_g!=. 
tab exits if ystarts_ > yborn_+ agem_max_g & ystarts_!=. & yborn_!=. & agem_max_g!=. 
display 955/52613
* 0.0181 
* 92.5% of them stay single. only 7.5% exit.. 

*display 902/52169

replace durs=. if ystarts_ > yborn_+ agem_max_g & ystarts_!=. & yborn_!=. & agem_max_g!=. 
replace exits=. if ystarts_ > yborn_+ agem_max_g & ystarts_!=. & yborn_!=. & agem_max_g!=. 

* consider up to agem_max_g 
tab exits if yends_> (yborn_+agem_max_g) & ystarts_<= (yborn_+agem_max_g)  
*display (902+1284)/52169
display (955+1328)/52613
* 0.0434 
* value affected by this age alteration.. 04190228?? (this might not big if we consider ystarts_>=1968)

sum durs if ystarts_>=1968
sum durs if ystarts_>=1968 & ystarts_ > yborn_+ agem_max_g & ystarts_!=. & yborn_!=. & agem_max_g!=.
sum durs if ystarts_>=1968 & yends_> (yborn_+agem_max_g) & ystarts_<= (yborn_+agem_max_g)  

display 842/40415
* .0208 
*display 816/40266 
* .02026524

replace durs= durs1-(yends_- (yborn_+agem_max_g) ) if yends_> (yborn_+agem_max_g) & ystarts_<= (yborn_+agem_max_g)  
replace exits=0 if yends_> (yborn_+agem_max_g) & ystarts_<= (yborn_+agem_max_g) & durs!=. 

sum durs, de
replace durs=. if durs>49 & yborn_==.  
* one strange observation higher than 49 

sum durs, de
sum exits, de
sum durs if sex_m==1, de
sum exits if sex_m==1, de
sum durs if sex_m==2, de
sum exits if sex_m==2, de
sum durs if sex_m==1 & orderm_m==1, de
sum durs if sex_m==2 & orderm_m==1, de
sum durs if sex_m==1 & countr_==1, de
sum durs if sex_m==2 & countr_==1, de
 
* Now I have durs and exits 
 
order id68r_ idpr_ nm_ orderm_m thism_m nowm_m yborn_ ystarts_ yends_ durs exits ystartm_ yendm_ ydata_  durm exitm 


save mh_ing7, replace


***********************************
* patterns before coming to the US (I will not use them) 

clear
use mh_ing7 

* before coming to the US 
gen adds_us=. 
gen addm_us=. 

replace adds_us=0 if inus_i1992> ystarts_ & durs!=.  & inus_i1992!=. 
replace adds_us=0 if inus_i1990> ystarts_ & durs!=.  & inus_i1990!=.
replace adds_us=1 if adds_us!=0 & durs!=. 
tab adds_us  
 
replace addm_us=0 if inus_i1992> ystartm_ & durm!=.  & inus_i1992!=. 
replace addm_us=0 if inus_i1990> ystartm_ & durm!=.  & inus_i1990!=.
replace addm_us=1 if addm_us!=0 & durm!=.  
tab addm_us 
 
**************************************
** to draft (start outside of the US)
tab adds_us if ystarts_>=1968 & durs!=. 
* 1.61%
tab addm_us if ystartm_>=1968 & durm!=. 
* 1.38% 
* (but I will see this from final samples I use) 
**************************************

 * final sample
sum durs if adds_us==1 & ystarts_>=1968 , de
sum exits if adds_us==1 & ystarts_>=1968 
tab orderm_m if adds_us==1 & ystarts_>=1968 
sum durm if addm_us==1 & ystartm_>=1968 , de
sum exitm if addm_us==1 & ystartm_>=1968 
tab orderm_m if addm_us==1 & ystartm_>=1968
 
* per individual,  
* number of marriage histories 
gen nrecordm= nrecord_m 
* number of singlehood histories
gen nrecords= nrecord_m 

sort id68r_ idpr_ orderm_m 
by id68r_ idpr_ : replace nrecordm=nrecordm[1]
by id68r_ idpr_ : replace nrecords=nrecords[_N]

label variable nrecordm "number of marriage histories" 
label variable nrecords "number of singlehood histories"
 
tab nrecordm if countr_==1 
tab nrecords if countr_==1

drop  durl exitl ttdeath hhdeath ttdeath1 hhdeath1 agecohort agem_ agem_min exits1 ystarts3 yends3 exits3 durs1 
 
save event, replace 
 
log close
 
 
 
 







