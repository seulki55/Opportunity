display _newline(200)
clear all

set more off
set mem 2000m
set maxvar 30000

cd  "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"

log using "do_type_ind_yyyymmdd_nn.txt", text replace


* 1. file name : do_type_ind_yyyymmdd_nn.do 
* 2. role of this program: 
*  1) Individual file pick individual's characteristics 
*  2) combine this with info from family files (type_tc...) 
* 3. inputs: 
* ind_fam_short1
* type_tc14
* type_tc53 
* type_tc42
* type_tc25 
* 4. outputs: 
* type_ind1.dta
*  obs:        38,084                          
* vars:           108                          15 Oct 2013 18:15
* size:    16,756,960 (99.2% of memory free)
* id68 idp sex smpl tc14_ t4_ tc42_  tc53_ t6_ tc62_ t7_ tc72_ t8_ t9_ tc92_ tc82_ wghtl_* wghtcs_*
* t8_, tc82_: birth weight  ( 1 under 2 over )
* t9_, tc92_: marital status of mother at birth ( 1 unstable 2 stable )
* 5. date:
* first composed : 2013/08/09
* last runned : do_type_ind_20141006_draft, do_type_ind_20140917_02
* 6. notes: 
* based on do_type_ind_20140228_01 (workplace2) 
*  0) Now, I have individual's invariant trait. 
*  1) I first use some of variables from ind2011er data sheet 
*  2) I do not use education info if it is recorded as 0, but
* 		I can recover some of 0 cases from fam. data file. (163 obs) 

**********************************************************
**********************************************************


clear
use ind_fam_short1  

* have only individual data, drop info from family data 
drop *_f* 

gen id68= id68_i
gen idp= idperson_i
gen sex= sex_i 
gen smpl= smpl_i

* birth weight 
gen t8_= bweight_i
* birth stable  
gen t9_= bstable_i 

label define lb8 1 under 2 over 
label define lb9 1 unstable 2 stable 

recode t9_ (1=2) (2 3 4 5 =1) (7 8 9 =.), gen(tc92_)
label variable t9_ "marital status of mother at birth" 
label variable tc92_ "marital status of mother at birth"
label values tc92_ lb9

tab tc92_ 

gen tc82_=. 
replace tc82_=1 if t8==991 
replace tc82_=2 if t8==995
tab tc82_

replace t8_=. if t8_==991 | t8_==995 | t8_==999 | t8_==998
sum t8_, de

replace tc82_=1 if t8_ < 88 & tc82_==. & t8_!=. 
replace tc82_=2 if t8_ > 88 & tc82_==. & t8_!=. 
tab tc82_ 
label variable t8_ "birth weight"
label variable tc82_ "birth weight"
label values tc82_ lb8 

tab tc82_ tc92_, column row 

save ing1, replace


clear 

use ing1 
* education 
gen t4_=. 
gen tc42_=. 
gen tc42year_=. 

label define lb4 1 edu_L 2 edu_H

foreach i of numlist 1968/1997 1999(2)2011{
	tab edu_i`i'
}
* I am not using edu_i`y'==0 since it contrains many other cases...
foreach y of numlist 1968/1997 1999(2)2011{
	gen t4_`y'=edu_i`y'
	replace t4_`y'=. if edu_i`y'>95
	replace t4_`y'=. if edu_i`y'==0 
}
*
foreach y of numlist 1968/1997 1999(2)2011{
	tab t4_`y'
}
*
foreach y of numlist 1968/1997 1999(2)2011{
	recode t4_`y' (0/12=1) (13/17=2), gen(tc42_`y')
} 
*
foreach y of numlist 1968/1997 1999(2)2011{
	tab tc42_`y'
}
* take values from the most recent year 
foreach y of numlist 2011(-2)1999 1997(-1)1968{
	replace tc42year_=`y' if tc42_==. & tc42_`y'!=. 
	replace tc42_= tc42_`y' if tc42_==. & tc42_`y'!=. 
	replace t4_= t4_`y' if t4_==. & t4_`y'!=. 
}
*

label variable t4_ "edu of r_"
label variable tc42_ "edu of r_"
label values tc42_ lb4 

tab tc42_ 
tab tc42year_ 

keep  id68 idp sex smpl t8_ t9_ tc92_ tc82_ t4_ tc42_ tc42year_ wghtl_* wghtcs_* inus* 
order  id68 idp sex smpl t8_ t9_ tc92_ tc82_ t4_ tc42_ tc42year_ wghtl_* wghtcs_* 
sort id68 idp 

rename t4_ t4i_ 
rename tc42_ tc42i_
rename tc42year_ tc42yeari_ 

save type_ind_ing1, replace

** Let's collect info from type_tc14, type_tc53 
*** type: race 
clear

use type_tc14
rename id68_i id68
rename idperson_i idp 
drop sex_i 

save type_tc14_edit, replace

clear
use type_ind_ing1
merge 1:1 id68 idp using type_tc14_edit 
drop _merge 

save type_ind_ing2, replace 


*** type: parents' wealth 
clear

use type_tc53
rename id68_i id68
rename idperson_i idp 
drop sex_i 

save type_tc53_edit, replace

clear
use type_ind_ing2
merge 1:1 id68 idp using type_tc53_edit 
drop _merge 

save type_ind_ing3, replace 


*** type: education (if there is more info from fam. data files) 
clear

use type_tc42
rename id68_i id68
rename idperson_i idp 
drop sex_i 
rename tc42_ tc42f_
rename t4_ t4f_ 
rename tc42year_ tc42yearf_ 

save type_tc42_edit, replace 


clear
use type_ind_ing3
merge 1:1 id68 idp using type_tc42_edit 
drop _merge 

* let's combine information from two sources (individual data, family data) 
tab tc42i_ tc42f_ , missing 

gen tc42_=.
gen t4_=. 
gen tc42year_=. 

label variable tc42_ "edu of r_"
label values tc42_ lb4 

replace t4_=t4i_ if t4i_!=. & t4f_==. 
replace tc42_=tc42i_ if tc42i_!=. & tc42f_==. 
replace tc42year_=tc42yeari_ if tc42i_!=. & tc42f_==. 
replace t4_=t4f_ if t4i_==. & t4f_!=. 
replace tc42_=tc42f_ if tc42i_==. & tc42f_!=. 
replace tc42year_=tc42yearf_ if tc42i_==. & tc42f_!=. 

replace t4_=t4i_ if  tc42yeari_>= tc42yearf_ & t4i_!=. & t4f_!=. 
replace tc42_=tc42i_ if tc42yeari_>= tc42yearf_ & tc42i_!=. & tc42f_!=. 
replace tc42year_=tc42yeari_ if tc42yeari_>= tc42yearf_ & tc42i_!=. & tc42f_!=. 

replace t4_=t4f_ if tc42yeari_< tc42yearf_ & t4i_!=. & t4f_!=. 
replace tc42_=tc42f_ if tc42yeari_< tc42yearf_ & tc42i_!=. & tc42f_!=. 
replace tc42year_=tc42yearf_ if tc42yeari_< tc42yearf_ & tc42i_!=. & tc42f_!=. 

tab t4_ 
tab tc42_ 
tab tc42year_ 

drop  t4i_ tc42i_ tc42yeari_ tc42f_ tc42yearf_ t4f_

save type_ind_ing4, replace 

*** type: religion 
clear

use type_tc25
rename id68_i id68
rename idperson_i idp 
drop sex_i 

save type_tc25_edit, replace

clear
use type_ind_ing4
merge 1:1 id68 idp using type_tc25_edit 
drop _merge 

save type_ind_ing5, replace 

*** type: hieght (7), body mass (6) 
clear

use type_t67
rename id68_i id68
rename idperson_i idp 
drop sex_i 

save type_t678_edit, replace

clear
use type_ind_ing5
merge 1:1 id68 idp using type_t678_edit 
drop _merge 

order id68 idp sex smpl tc14_ tc13_ tc25_ t4_ tc42_  tc53_ t6_ tc62_ t7_ tc72_ t8_ t9_ tc92_ tc82_ wghtl_* wghtcs_*

label variable t4_ "edu of r_"
label variable t6_ "body mass of r_"
label variable t7_ "height of r_"

save type_ind1, replace

log close 





