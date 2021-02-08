* 1. File Name: do_mer_ren_ind.do
*** sequence 
clear all 

set more off
set maxvar 30000 

* assign local variables (based on global variables set at c:\ado\plus\profile.do
local input_interface="2013-08-09"
local cache_interface="2021-02"

local input_folder="$Data_Path/PSID/Interfaces/`input_interface'"
local cache_folder="$Opportunity_Path/.cache/`cache_interface'"

* write output to a log file
log using "`cache_folder'/log_do_mer_ind_fam.txt", text replace 

* (copy this area to evernote) 
* 2. role of this program: 
*  1) This file merge individual data and family data 
* 3. inputs:  
* -ind_short2
* -famyyyy_short1
* 4. outputs: 
* -ind_fam_1 
*Contains data from D:/Research/Opportunity/.cache/2021-02/ind_fam.dta
*  obs:        73,251                          
* vars:         2,931                          7 Feb 2021 21:52
* size:   858,794,724                          
*Sorted by: id68_i  idperson_i
* -ind_fam_short1
* make a new data set that has only head and wife "wife" in the sample. 
*Contains data from D:/Research/Opportunity/.cache/2021-02/ind_fam_short1.dta
*  obs:        38,084                          
* vars:         3,042                          7 Feb 2021 22:01
* size:   463,406,112                          
*Sorted by: id68_i  idperson_i
* rth_yyyy  1 Head 2 Wife 3 QWife 4 Other 5 Moverout 
* withw_yyyy  1 "w/ W or Qw" 0 "nowife"  
* withw2_yyyy  1 "w/ W" 2 "w/ Qw" 0 "nowife"  
* 5. date:
* first composed : 2013/7/8
* last runned : 2021/2/7
* 6. notes:  
*  1) based on do_mer_ind_fam_20140806_01.do 

clear 
use `cache_folder'/ind_short2 

foreach i of numlist 1968/1997 1999(2)2011 {
	gen idyy_f`i'=idyy_i`i'
	sort idyy_f`i'
	
	merge m:1 idyy_f`i' using `cache_folder'/fam`i'_short1
	drop _merge
}
*
* # of matched obs. generally gets smaller over years. 
sort id68_i idperson_i 

save `cache_folder'/ind_fam_1, replace 
de, short


clear

use `cache_folder'/ind_fam_1, replace 

* make a new data set that has only head and wife "wife" in the sample. 
label define lbrth 1 Head 2 Wife 3 QWife 4 Other 5 Moverout
foreach i of numlist 1968/1982 {
	recode rth_i`i' (1=1) (2=2) (3/9=4) (0=.) , gen (rth_`i')
	* wife and "wife" combined into one category. 
	replace rth_`i'=5 if (rth_`i'==1 | rth_`i'==2 | rth_`i'==3) & seq_i`i'>50 & seq_i`i'!=. 
	* Since mover-out heads are not present. 
	* the information is for current head with sequence number less than 20. 
	label variable rth_`i' "`i' relationship to head of r_"
	label values rth_`i' lbrth
}
foreach i of numlist 1983/1997 1999(2)2011 {
	recode rth_i`i' (10=1) (20=2) (22=3) (30/99=4) (0=.) , gen (rth_`i')
	replace rth_`i'=5 if (rth_`i'==1 | rth_`i'==2 | rth_`i'==3) & seq_i`i'>50 & seq_i`i'!=. 
*	replace rth_i`i'=. if seq_i`i'>50 & seq_i`i'!=. 
	label variable rth_`i' "`i' relationship to head of r_"
	label values rth_`i' lbrth
}
*
tab rth_1982
tab rth_1999 
tab rth_2011
*foreach i of numlist 1982 1983 {
*	sort idyy_f`i' rth_`i' 
*	by idyy_f`i' rth_`i' : gen multih_`i'= _N if rth_`i'==1 
*}
*tab multih_1982
*tab multih_1983 
* we have the case with two heads! consider sequence number also (I edited this part) 
*
 *order  id68_i  idperson_i follow_i rth_19* rth_20*
 *tab rth_1984
 
* once head or wife 
gen onceHorW=.  
 foreach i of numlist 1968/1997 1999(2)2011 {
	replace onceHorW=1 if rth_`i'==1 | rth_`i'==2 | rth_`i'==3 
 }
 tab onceHorW, missing 
* order  id68_i  idperson_i sex_i smpl_i onceHorW
 
** keep if an individual is once head or wife or Qwife 
* (because we know information of their traits from fam data) 
keep if onceHorW==1 
*
*   onceHorW |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |     36,874       51.73       51.73
*          . |     34,411       48.27      100.00
*------------+-----------------------------------
*      Total |     71,285      100.00
drop onceHorW

* construct withw_yyyy withw2_yyyy 
* 	denoting whether the head of this household is with wife or qwife. 
label define lbwithw2 1 "w/ W" 2 "w/ Qw" 0 "nowife"
label define lbwithw 1 "w/ W or Qw" 0 "nowife"

foreach i of numlist 1968/1997 1999(2)2011 {
	* but info only available from 1983/1993 1999(2)2009 
	recode cplh_f`i' (1=1) (2=2) (3 4 5 =0), gen (withw2_`i')
	label variable withw2_`i' "`i' head couple status of FU_ "
	label values withw2_`i' lbwithw2 
}
*
foreach i of numlist 1968/1997 1999(2)2011 {
	gen withw_`i'=. 
	label variable withw_`i' "`i' head couple status of FU_ "
	label values withw_`i' lbwithw 
}
*
* use info from cplh_f 
foreach i of numlist 1983/1993 1999(2)2011 {
	replace withw_`i'=withw2_`i'
	replace withw_`i'=1 if withw2_`i'==2 
}
* use info from agew_f
foreach i of numlist 1968/1982 1994/1997 {
	replace withw_`i'=0 if agew_f`i'==0 
	replace withw_`i'=1 if agew_f`i'>0 
}
*
foreach i of numlist 1968/1997 1999(2)2011 {
*	tab withw_`i' 
	tab withw_`i' rth_`i'
	tab withw2_`i' rth_`i' 
}
* wife present or not 
* cplh_f`i'==1 (head with wife) | cplh_f`i'==2 (head with "wife")  is a certain way. 
* If cplh_f not available use agew_f`i'.. 

foreach i of numlist 1968/1997 1999(2)2011 {
	sum agew_f`i' if agew_f`i'!=0  
}
*

foreach i of numlist 1968/1997 1999(2)2011 {
	tab cplh_f`i', sum(agew_f`i') 
	tab cplh_f`i' if agew_f`i'==0 
}
*

tab rth_2011
tab withw_2011
tab withw2_2011 

sort id68_i idperson_i 
save `cache_folder'/ind_fam_short1, replace 

de
de, short 
*  obs:        38,084                          
* vars:         3,042                          6 Aug 2014 10:01
* size:   463,710,784 (77.9% of memory free)
* rth_yyyy  1 Head 2 Wife 3 QWife 4 Other 5 Moverout 
* withw_yyyy  1 "w/ W or Qw" 0 "nowife"  
* withw2_yyyy  1 "w/ W" 2 "w/ Qw" 0 "nowife"  

**********************************************************
**********************************************************

log close
