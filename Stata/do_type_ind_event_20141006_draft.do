display _newline(200)

clear all

set more off
set mem 1000m
set maxvar 30000

cd  "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"

log using "do_type_ind_event_yyyymmdd_nn.txt", text replace

* 1. file name : do_type_ind_event_yyyymmdd_nn.do 
* 2. role of this program: 
*  1) Combine type_ind and event file
*		based on respondent's info, and spouse's info 
* 3. inputs: 
* event.dta (previously mh_edit.dta)
* type_ind1.dta 
* 4. outputs: 
* type_ind_event.dta
* trait of r_ and sp_ tc14 t4 tc42 tc53 t6 tc62 t7 tc72 t8 tc82 t9 tc92 
* 	add_tc142r_ (no recond mentioned race) add_tc14cr_ (no change in racial reporting) 
* trait of r_ wghtavg_i (average longitudinal weight) 
* adds_us, addm_us: duration generatd in the US (restricted on 1990, 1992 samples) 
* marriage history of r_ 
*  obs:        87,104                          
* vars:            79                          13 Aug 2014 12:39
* size:    27,176,448 (97.4% of memory free)
* 5. date:
* first composed : 2013/8/11 
* last runned :  do_type_ind_event_20141006_draft, do_type_ind_event_20140917_01   
* 6. notes: 
*  1) based on do_type_ind_event_20140228_01 
* 	(20140311_01, I have dummy variable for validity of tc14 variables. 
*    But since dropping invalid samples gave me strange results. 
*    I will instead use all samples and do robustness check. )    


** respondent 
clear 
use type_ind1

rename id68 id68r_
rename idp idpr_ 
rename sex sexr_
rename smpl smplr_ 

rename add_tc142 add_tc142_
rename add_tc14c add_tc14c_ 

foreach v in tc14 tc25 tc13 t4 tc42 tc53 t6 tc62 t7 tc72 t8 tc82 t9 tc92 add_tc142 add_tc14c tc25check {
	rename `v'_ `v'r_
}
*
keep id68r_ idpr_ sexr_ smplr_ tc14r_ tc13r_  tc25r_ t4r_ tc42r_ tc53r_ t6r_ tc62r_ t7r_ tc72r_ t8r_ t9r_ tc92r_ tc82r_ wght* add_tc142* add_tc14c* tc14year_ tc25year_ 

save type_ind1_r, replace 

clear
use event

merge m:1 id68r_ idpr_ using type_ind1_r 

sort id68r_ idpr_ nm 
*keep if _merge==3 
drop _merge 
* if _merge=1, we do not know the type of this individual 
* if _merge=2, we do not know marital history of this individual 


gen id68sp_ = id68sp_m 
gen idpsp_= idpsp_m 

save mh_edit_ing1, replace

** spouse 
clear 
use type_ind1

rename id68 id68sp_
rename idp idpsp_ 
rename sex sexsp_
rename smpl smplsp_ 

drop tc14sp_ tc13sp_ t4sp_ tc42sp_ tc25sp_ 
*drop  tc14year_ tc14sp_ tc14check_ tc42f_ tc42year_ tc42sp_ t4f_ t4sp_ tc42check_


rename add_tc142 add_tc142_
rename add_tc14c add_tc14c_ 

foreach v in tc14 tc25 tc13 t4 tc42 tc53 t6 tc62 t7 tc72 t8 tc82 t9 tc92 add_tc142 add_tc14c tc25check {
	rename `v'_ `v'sp_
}
*

*foreach v in tc14 tc13 tc25 t4 tc42 tc53 t8 tc82 t9 tc92 tc14check tc13check tc142check{
*	rename `v'_ `v'sp_
*}
*
keep id68sp_ idpsp_ sexsp_ smplsp_ tc14sp_ tc13sp_ tc25sp_ t4sp_ tc42sp_ tc53sp_ t6sp_ tc62sp_ t7sp_ tc72sp_  t8sp_ t9sp_ tc92sp_ tc82sp_ wght* add_tc142* add_tc14c* 
 
save type_ind1_sp, replace 

clear 
use mh_edit_ing1, replace

merge m:1 id68sp_ idpsp_ using type_ind1_sp 
drop if _merge==2 
* they are not spouses of respondents 
* keep if _merge==3
* if _merge=1, we do not know the type of the spouse 
* if _merge=2, we do not know marital history of this individual 

drop _merge 


sort id68r_ idpr_ nm 

order id68r_ idpr_ id68sp_ idpsp_ 

drop wghtcs_* wghtl_* 

save type_ind_event, replace 

de

log close 

