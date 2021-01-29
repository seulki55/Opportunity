display _newline(200)
clear all

set more off
set mem 2000m
set maxvar 30000

cd  "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"

log using "do_type_tc14_yyyymmdd_nn.txt", text replace

* (copy this area to evernote) 
* 1. file name : do_type_tc14_yyyymmdd.do 
* 2. role of this program: 
*  	1) Construct (respondent's type) 
*		tc14 : race & ethnicity 
* 		(tc13 : race) 		
* 	2) Generate some statistics related to race distribution and marriage patterns of given year. 
* 3. inputs: 
* -ind_fam_short1  
* rth_yyyy  1 Head 2 Wife 3 QWife 4 Other 5 Moverout ,all years, relationship to head of r_
* withw_yyyy 0 no wife 1 with wife or Qwife 
* 4. outputs: 
* -type_tc14.dta 
* tc14_ : 1 NH_White 2 NH_Black 3 Hispanic 4 Other
* tc14year_ : year this trait is taken 
* tc14sp_ : sp's type, in the same year (I may not use this) 
* tc13r_: 1 White 2 Black 3 Other 
* 2nd race ever reported (add_tc142==0) or not (add_tc142==1)   
* change in race every reported (add_tc14c==0) 
* 5. date:
* first composed : 2013/7/7 
* last runned : do_type_tc14_20141006_draft, do_type_tc14_20141001_01
* 6. notes: 
* 	1) based on workplace2\ do_type_tc14_20140228_01  
* 	2) do_type_tc14_20131015_key_outputs.doc contains key outputs
* 		that will go to my draft and appendix. (They are all old versions) 
* 	    (See discussion on how I define racial trait doc_type_tc14_20130828_02.doc 
*		I may not use this. I will directly update my findings to the appendix 
* 		and I will keep the log file from the program. )
*   3) key info printed do_type_tc14_20130907_03 key info
* 7. Things to do: 
* (updated 20140807) 
* 	1) Try various ways to choose one trait over years. See the robustness of my results 
* 		(line around 410) 
* 		previous results ; most recent ; earlist ; most frequent .. 
* 	2) I want this file to be more simpler. 
* 		- part that shows statistics (have separate doc. or txt. files) 
* 		- part that generate key variables that carry on to other programs 
* 	3) Hispanics if someone reports herself as Hispanic only once. (Check about this) 
* 

**********************************************************
**********************************************************

clear
use ind_fam_short1  
* use ind_fam_short2_2011 

**********************************************************
* race 
keep  id68_i idperson_i sex_i rth_1* rth_2* race* his* ethn* wghtl_i* withw_* ageh_* yborn_i*

label define lb1 1 White 2 Black 3 Hispanic 4 Other
label define lb14 1 NH_White 2 NH_Black 3 Hispanic 4 Other
label define lb13 1 White 2 Black 3 Other  


* order id68 idperson race*

* hispanics 
foreach i of numlist 1985/1997 1999(2)2011{
	gen hisph_`i'=. 
	gen hispw_`i'=. 
	replace hisph_`i'=1 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	replace hispw_`i'=1 if hisw_f`i'>=1 & hisw_f`i'<=9 & hisw_f`i'!=.
	replace hisph_`i'=1 if ethnh_f`i'==4
	replace hisph_`i'=1 if ethn1h_f`i'== 12 |ethn1h_f`i'== 13 | ethn1h_f`i'== 14
 	replace hispw_`i'=1 if ethnw_f`i'==4
	replace hispw_`i'=1 if ethn1w_f`i'== 12 |ethn1w_f`i'== 13 | ethn1w_f`i'== 14
}
*
* sample size of hispanics 
foreach i of numlist 1985/1997 1999(2)2011{
	tab hisph_`i' if rth_`i'==1 
}
*
* racial trait (based on race question) 
foreach i of numlist 1968/1984{
	recode race1h_f`i' (1=1) (2=2) (3=3) (4/7=4) (0 8 9=.), gen(tc14h_`i')
	label variable tc14h_`i' "`i' race of h_"
	label values tc14h_`i' lb1
*	gen t1h_`i'=race1h_f`i' (I am hot having original variable, only categorized var..)
*	tab tc13h_`i' if rth_`i'==10 & seq_`i'==1
}
foreach i of numlist 1968/1984{
*	recode race1w_f`i' (1=1) (2=2) (3=3) (4/7=4) (0 8 9=.)  if cplh_f`i'==1| cplh_f`i'==2 , gen(tc14w_`i')
* 	technically, I need to take wife's value for the case where the wife is present 
*	but this case is safely classified as 0 in the data, so I don't need to do this 
	recode race1w_f`i' (1=1) (2=2) (3=3) (4/7=4) (0 8 9=.), gen(tc14w_`i')
	label variable tc14w_`i' "`i' race of w_"
	label values tc14w_`i' lb1
*	gen t1w_`i'=race1w_f`i'
*	tab tc13h_`i' if rth_`i'==10 & seq_`i'==1
}
*
foreach i of numlist 1985/1996 1997(2)2003 {
	recode race1h_f`i' (1=1) (2=2) (5=3) (3 4 6 7=4) (0 8 9=.), gen(tc14h_`i')
*	replace tc14h_`i'=3 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	label variable tc14h_`i' "`i' race of h_"
	label values tc14h_`i' lb1
}
foreach i of numlist 1985/1996 1997(2)2003 {
	recode race1w_f`i' (1=1) (2=2) (5=3) (3 4 6 7=4) (0 8 9=.), gen(tc14w_`i')
*	replace tc14w_`i'=3 if hisw_f`i'>=1 & hisw_f`i'<=9 & hisw_f`i'!=.
	label variable tc14w_`i' "`i' race of w_"
	label values tc14w_`i' lb1
}

foreach i of numlist 2005(2)2011 {
	recode race1h_f`i' (1=1) (2=2) (3/7=4) (0 8 9=.), gen(tc14h_`i')
*	replace tc14h_`i'=3 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	label variable tc14h_`i' "`i' race of h_"
	label values tc14h_`i' lb1
}
foreach i of numlist 2005(2)2011 {
	recode race1w_f`i' (1=1) (2=2) (3/7=4) (0 8 9=.) , gen(tc14w_`i')
*	replace tc14w_`i'=3 if hisw_f`i'>=1 & hisw_f`i'<=9 & hisw_f`i'!=. 
	label variable tc14w_`i' "`i' race of w_"
	label values tc14w_`i' lb1
}
*

** tc13: racial trait , only based on racial question 
foreach i of numlist 1968/1996 1997(2)2011{
	gen tc13h_`i'=tc14h_`i' 
	gen tc13w_`i'=tc14w_`i'
	replace tc13h_`i'=3 if tc14h_`i'==4 
	replace tc13w_`i'=3 if tc14w_`i'==4
}
*
** tc14: racial trait, based on race and ethnicity 
foreach i of numlist 1985/1996 1997(2)2011{
	replace tc14h_`i'=3 if hisph_`i'==1 
	replace tc14w_`i'=3 if hispw_`i'==1	
}
* 
** Table: Hispanics' reports of their race 
foreach i of numlist 1985/1996 1997(2)2011{
	tab tc14h_`i' tc13h_`i' if rth_`i'==1 & tc14h_`i'==3, row nokey
}
* ( we do not have spanish info for year 1997...)
tab race1h_f1996 if tc14h_1996==3 & rth_1996==1
tab race1h_f2003 if tc14h_2003==3 & rth_2003==1
tab race1h_f2011 if tc14h_2011==3 & rth_2011==1
* 
** Who are other's 
foreach i of numlist 1968/1997 1999(2)2011{
	tab race1h_f`i' if tc14h_`i'==4 
	tab race1h_f`i' if tc14h_`i'==4 [aw=wghtl_i`i']
}
*
foreach i of numlist 1968/1997 1999(2)2011{
	tab race1h_f`i' if tc13h_`i'==3 
	tab race1h_f`i' if tc13h_`i'==3 [aw=wghtl_i`i']	
}
*

** Who are other's 
foreach i of numlist 1968 1985 1997 2011{
	tab race1h_f`i' if tc14h_`i'==4 
	tab race1h_f`i' if tc14h_`i'==4 [aw=wghtl_i`i']
}
*
foreach i of numlist 1968 1985 1997 2011{
	tab race1h_f`i' if tc13h_`i'==3 
	tab race1h_f`i' if tc13h_`i'==3 [aw=wghtl_i`i']	
}
*
* consistent over years? 
foreach i of numlist 1968/1997 1999(2)2011{
	tab tc14h_`i'
}
*
foreach i of numlist 1968/1997 1999(2)2011{
	tab tc14h_`i' [aw=wghtl_i`i']	
}
* this is not consistent over year. 
* using racial category only seems problematic. 
foreach i of numlist 1968/1997 1999(2)2011{
	tab tc13h_`i'
}
*
foreach i of numlist 1968/1997 1999(2)2011{
	tab tc13h_`i' [aw=wghtl_i`i']	
}
*

** 2nd mentioned race 
*
foreach i of numlist 1985/1996 1997(2)2003 {
	recode race2h_f`i' (1=1) (2=2) (5=3) (3 4 6 7=4) (0 8 9=.), gen(tc142h_`i')
*	replace tc14h_`i'=3 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	label variable tc142h_`i' "`i' race of h_, second"
	label values tc142h_`i' lb1
}
foreach i of numlist 1985/1996 1997(2)2003 {
	recode race2w_f`i' (1=1) (2=2) (5=3) (3 4 6 7=4) (0 8 9=.), gen(tc142w_`i')
*	replace tc14w_`i'=3 if hisw_f`i'>=1 & hisw_f`i'<=9 & hisw_f`i'!=.
	label variable tc142w_`i' "`i' race of w_, second"
	label values tc142w_`i' lb1
}

foreach i of numlist 2005(2)2011 {
	recode race2h_f`i' (1=1) (2=2) (3/7=4) (0 8 9=.), gen(tc142h_`i')
*	replace tc14h_`i'=3 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	label variable tc142h_`i' "`i' race of h_, second"
	label values tc142h_`i' lb1
}
*
foreach i of numlist 2005(2)2011 {
	recode race2w_f`i' (1=1) (2=2) (3/7=4) (0 8 9=.), gen(tc142w_`i')
*	replace tc14h_`i'=3 if hish_f`i'>=1 & hish_f`i'<=9 & hish_f`i'!=. 
	label variable tc142w_`i' "`i' race of w_, second"
	label values tc142w_`i' lb1
}
*

foreach i of numlist 1985/1997 1999(2)2011 {
	tab tc142h_`i' tc14h_`i' if rth_`i'==1, missing column 
}
foreach i of numlist 1985/1997 1999(2)2011 {
	tab tc142h_`i' tc13h_`i' if rth_`i'==1, missing column 
}
* those who mention other race as their second race are 
* (tc14) 
* less than 1% among whites and black said their second race is white and black. 
* less than 2-4 % among whites and black. 
* less than 3-7 % among Hispanc and others.  
* (tc13) 
* less than 2-4 % among whites and blakcs
* less than 3-5 % among others 

* word file 
*drop tc14h2_* 



** replace variable as their own variable (constructing tcnnr_yyyy ) 
* (consider whether this individual was head or wife of the family)
foreach i of numlist 1968/1997 1999(2)2011 {
	foreach j of numlist 13 14 {
		gen tc`j'r_`i'=. 
		gen tc`j'sp_`i'=.
	}
}
*
foreach i of numlist 1968/1997 1999(2)2011 {
	foreach j of numlist 14 13 {
		replace tc`j'r_`i'=tc`j'h_`i' if rth_`i'==1 
		replace tc`j'r_`i'=tc`j'w_`i' if rth_`i'==2 | rth_`i'==3 
		replace tc`j'sp_`i'=tc`j'h_`i' if rth_`i'==2 | rth_`i'==3
		replace tc`j'sp_`i'=tc`j'w_`i' if rth_`i'==1 & withw_`i'==1
		replace tc`j'sp_`i'=0 if tc`j'sp_`i'==. & rth_`i'==1 & withw_`i'==0 & ageh_f`i'>15 & ageh_f`i'<77 
		label variable tc`j'r_`i' "`i' race of r_"
		label variable tc`j'sp_`i' "`i' race of sp_"
		label values tc`j'r_`i' lb`j'
		label values tc`j'sp_`i' lb`j'	
	}
}
*

* particular year 
* year 1985 
foreach y of numlist 1985{
	tab sex_i if tc14r_`y'!=. & yborn_i`y'> `y'-77 & yborn_i`y'< `y'-15 [aw=wghtl_i`y'] 
	tab tc14r_`y' if sex_i==1 & tc14r_`y'!=4 & yborn_i`y'> `y'-77 & yborn_i`y'< `y'-15 [aw=wghtl_i`y']
	tab tc14r_`y' if sex_i==2 & tc14r_`y'!=4 & yborn_i`y'> `y'-77 & yborn_i`y'< `y'-15 [aw=wghtl_i`y']
	tab tc14r_`y' tc14sp_`y' if sex_i==1 & yborn_i`y'> `y'-77 & yborn_i`y'< `y'-15   [aw=wghtl_i`y'], nofreq row cell
	tab tc14sp_`y' tc14r_`y' if sex_i==2 & yborn_i`y'> `y'-77 & yborn_i`y'< `y'-15  [aw=wghtl_i`y'], nofreq column cell 		
}
*

****************************
** year 1991  
foreach i of numlist 1991{
	tab tc14r_`i' [aw=wghtl_i`i']	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
*

** year 2001  
foreach i of numlist 2001{
	tab tc14r_`i' [aw=wghtl_i`i']	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
*

** year 2011  
foreach i of numlist 2011{
	tab tc14r_`i' [aw=wghtl_i`i']	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
*


*****************************


** find the distribution considering weight 
foreach y of numlist 1968/1997 1999(2)2011{
	foreach j of numlist 14 {
		tab tc`j'r_`y' [aw=wghtl_i`y']
	}
}
*
foreach y of numlist 1968/1997 1999(2)2011{
	foreach j of numlist 13 {
		tab tc`j'r_`y' [aw=wghtl_i`y']
	}
}
*
foreach y of numlist 1968/1997 1999(2)2011{
	foreach j of numlist 14 {
		tab tc`j'r_`y' if sex_i==1 
		tab tc`j'r_`y' if sex_i==2
		tab tc`j'r_`y' if sex_i==1 [aw=wghtl_i`y']
		tab tc`j'r_`y' if sex_i==2 [aw=wghtl_i`y']
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1 , row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2 , column cell 
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1   [aw=wghtl_i`y'], nofreq row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2   [aw=wghtl_i`y'], nofreq column cell 	
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1 & tc`j'sp_`y'!=0     [aw=wghtl_i`y'], nofreq row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2 & tc`j'sp_`y'!=0     [aw=wghtl_i`y'], nofreq column cell 		
	}
}
*
foreach y of numlist 1968/1997 1999(2)2011{
	foreach j of numlist 13 {
		tab tc`j'r_`y' if sex_i==1 
		tab tc`j'r_`y' if sex_i==2
		tab tc`j'r_`y' if sex_i==1 [aw=wghtl_i`y']
		tab tc`j'r_`y' if sex_i==2 [aw=wghtl_i`y']
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1 , row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2 , column cell 
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1   [aw=wghtl_i`y'], nofreq row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2   [aw=wghtl_i`y'], nofreq column cell 	
		tab tc`j'r_`y' tc`j'sp_`y' if sex_i==1 & tc`j'sp_`y'!=0     [aw=wghtl_i`y'], nofreq row cell
		tab tc`j'sp_`y' tc`j'r_`y' if sex_i==2 & tc`j'sp_`y'!=0     [aw=wghtl_i`y'], nofreq column cell 		
	}
}
*


* second mentioned
foreach i of numlist 1985/1997 1999(2)2011  {
	foreach j of numlist 142 {
		gen tc`j'r_`i'=. 
	}
	label values tc142r_`i' lb1 
	label variable tc142r_`i' "`i' race of r_, second mentioned"
	label values tc142r_`i' lb1
}

foreach i of numlist 1985/1997 1999(2)2011  {
	foreach j of numlist 142 {
		replace tc`j'r_`i'=tc`j'h_`i' if rth_`i'==1 
		replace tc`j'r_`i'=tc`j'w_`i' if rth_`i'==2 | rth_`i'==3 
	}
}
* 
* order id68_i idperson_i tc14r_* 


** let's choose one trait (from a certain year) 
* as individuals' invariant trait. 
foreach i of numlist 1969/1997{
	local lagi=`i'-1 
	gen dif1_tc14_`i'=0 if tc14r_`i'==tc14r_`lagi' & tc14r_`i'!=. & tc14r_`lagi'!=. 
	replace dif1_tc14_`i'=1 if tc14r_`i'!=tc14r_`lagi' & tc14r_`i'!=. & tc14r_`lagi'!=.
}
*
foreach i of numlist 1999(2)2011 {
	local lagi=`i'-2 
	gen dif1_tc14_`i'=0 if tc14r_`i'==tc14r_`lagi' & tc14r_`i'!=. & tc14r_`lagi'!=. 
	replace dif1_tc14_`i'=1 if tc14r_`i'!=tc14r_`lagi' & tc14r_`i'!=. & tc14r_`lagi'!=.
}
* (if changes occur, compared to previous year) 
sum dif1_tc14* 
* year 1985
tab tc14r_1985 tc14r_1984, column 
* year 1997
tab tc14r_1997 tc14r_1996, column
tab tc14r_1999 tc14r_1996, column 
* year 2005
tab tc14r_2005 tc14r_2003, column

gen tc14r_=. 
gen tc14year_=. 
gen tc14sp_=. 

label variable tc14r_ "race of r_"
*label variable tc14sp_ "race of r_'s sp_, same year"
label variable tc14year_ "race of r_ from which year?"
label values tc14r_ lb14
label values tc14sp_ lb14 

save ing1, replace

clear 

use ing1 

gen tc14cr_=. 
gen tc14ccr_=. 

*********************************************************
* Try several ways to pick one identity over years (work: 2014/08/07) 
* Excluding individuals whose reports were inconsistent cannot be an answer, 
* 	since then I could not get results at all due to small sample size problem. 
* I need to see whether my results & sample are robust to these changes. 
**********************************************************
 
* (1: previous results_ 20131130 )
* foreach i of numlist  1985/1996 1999(2)2011 1968/1984{

* (2: earliest report) 
* foreach i of numlist 1968/1996 1999(2)2011 { 

* (3: most recent) 
* foreach i of numlist 2011(-2)1999 1996(-1)1885 1984(-1)1968 {

* (4: most frequent) 
* This should consider when they ask these question to each and all individuals 

* I am not using 1997 data (since Hispanics are not precisely identified)

*(earliest)
*foreach i of numlist 1968/1996 1999(2)2011 { 
*(latest)
*foreach i of numlist  2011(-2)1999 1996(-1)1968 {
*(final) 
foreach i of numlist  1985/1996 1997(2)2011 1968/1984 { 
	replace tc14year_=`i' if tc14r_==. & tc14r_`i'!=. 
	replace tc14sp_=tc14h_`i' if tc14r_==. & tc14r_`i'!=. & (rth_`i'==2 | rth_`i'==3 )
	replace tc14sp_=tc14w_`i' if tc14r_==. & tc14r_`i'!=. & (rth_`i'==1 )
	gen tc14diff_`i'=1 if tc14r_!=. & tc14r_`i'!=. & tc14r_!= tc14r_`i' 
	replace tc14r_= tc14r_`i' if tc14r_==. & tc14r_`i'!=. 
	replace tc14cr_= tc14r_`i' if tc14r_!=. & tc14r_!=tc14r_`i' & tc14cr_==. 
	replace tc14ccr_= tc14r_`i' if tc14r_!=. & tc14cr_!=. & tc14cr_!=tc14r_`i' & tc14ccr_==. 
}
*
* different racial identity rather than recorded one is observed 
* how many times? 
gen tc14check_=0 if tc14r_!=. 
*(earliest)
*foreach i of numlist 1968/1996 1999(2)2011 { 
*(latest)
*foreach i of numlist  2011(-2)1999 1996(-1)1968 {
*(final) 
foreach i of numlist  1985/1996 1997(2)2011 1968/1984 { 
	replace tc14check_ = tc14check_ + 1 if tc14diff_`i'==1 
}
*
tab tc14check_ tc14r_ , column
tab tc14check_  
tab tc14r_ if tc14check_>0 
tab tc14check_ tc14r_ 
display 1447/36119
display (17753+10589 -17317 -10260) /(17753+10589)

tab tc14r_ tc14cr_
tab tc14r_ tc14ccr_ 
* some of them are categorized in different categories in a certain years. 
* but then most of them (93%) are reported later their tc14r_ categories. 
display (177+182+121+23)/543

* tc13
** let's choose one trait (from a certain year) 
* as individuals' invariant trait. 
foreach i of numlist 1969/1997{
	local lagi=`i'-1 
	gen dif1_tc13_`i'=0 if tc13r_`i'==tc13r_`lagi' & tc13r_`i'!=. & tc13r_`lagi'!=. 
	replace dif1_tc13_`i'=1 if tc13r_`i'!=tc13r_`lagi' & tc13r_`i'!=. & tc13r_`lagi'!=.
}
*
foreach i of numlist 1999(2)2011 {
	local lagi=`i'-2 
	gen dif1_tc13_`i'=0 if tc13r_`i'==tc13r_`lagi' & tc13r_`i'!=. & tc13r_`lagi'!=. 
	replace dif1_tc13_`i'=1 if tc13r_`i'!=tc13r_`lagi' & tc13r_`i'!=. & tc13r_`lagi'!=.
}
*
sum dif1_tc13* 
* year 1985
tab tc13r_1985 tc13r_1984, column 
* year 1997
tab tc13r_1997 tc13r_1996, column
tab tc13r_1999 tc13r_1996, column 
* year 2005
tab tc13r_2005 tc13r_2003, column

gen tc13r_=. 
gen tc13year_=. 
gen tc13sp_=. 

label variable tc13r_ "race of r_"
*label variable tc13sp_ "race of r_'s sp_, same year"
label variable tc13year_ "race of r_ from which year?"
label values tc13r_ lb13
label values tc13sp_ lb13 

* I am not using 1997 data (for tc13, I will use it.) 
foreach i of numlist  1985/1996 1997(2)2011 1968/1984 {
*foreach i of numlist  1985/1996 1999(2)2011 1997 1968/1984 {
*foreach i of numlist 2005(2)2009 1985/1996 {
	replace tc13year_=`i' if tc13r_==. & tc13r_`i'!=. 
	replace tc13sp_=tc13h_`i' if tc13r_==. & tc13r_`i'!=. & (rth_`i'==2 | rth_`i'==3 )
	replace tc13sp_=tc13w_`i' if tc13r_==. & tc13r_`i'!=. & (rth_`i'==1 )
	gen tc13diff_`i'=1 if tc13r_!=. & tc13r_`i'!=. & tc13r_!= tc13r_`i' 
	replace tc13r_= tc13r_`i' if tc13r_==. & tc13r_`i'!=. 
}
*
* different racial identity rather than recorded one is observed 
* how many times? 
gen tc13check_=0 if tc13r_!=. 
foreach i of numlist 1985/1996 1997(2)2011 1968/1984 {
*foreach i of numlist 1985/1996 1999(2)2011 1997 1968/1984 {
	replace tc13check_ = tc13check_ + 1 if tc13diff_`i'==1 
}
*
tab tc13check_ tc13r_ , column
tab tc13check_  
tab tc13r_ if tc13check_>0 

* 2nd mentione race is reported at least once
gen tc142check_=0 if tc14r_!=. 
foreach i of numlist 1985/1996 1997(2)2011 {
	replace tc142check_=tc142check_+1 if tc142r_`i'!=. 
}
*

* white hispanics only 
tab tc14r_  if tc14r_==1 | tc14r_==2 | tc14r_==4 | (tc14r_==3 & tc13r_==1) 



* so far
*Contains data from ind_fam_short1.dta
*  obs:        36,874                          
* vars:         3,143                          12 Jul 2013 09:42
* size:   463,874,920 (77.9% of memory free)



tab tc14r_ if sex_i==1
tab tc14r_ if sex_i==2 
tab tc14r_ tc14sp_ if sex_i==1 , row 
tab tc14sp_ tc14r_ if sex_i==2 , column 
tab tc14year_ 
tab tc14r_ if tc14check_>0 
tab tc14r_ if tc142check_>0


tab tc13r_ if sex_i==1
tab tc13r_ if sex_i==2 
tab tc13r_ tc13sp_ if sex_i==1 , row 
tab tc13sp_ tc13r_ if sex_i==2 , column 
tab tc13year_ 
tab tc13r_ if tc13check_>0 
tab tc13r_ if tc142check_>0

* white hispanics only 
tab tc14r_  if tc14r_==1 | tc14r_==2 | tc14r_==4 | (tc14r_==3 & tc13r_==1)  & sex_i==1
tab tc14r_  if tc14r_==1 | tc14r_==2 | tc14r_==4 | (tc14r_==3 & tc13r_==1)  & sex_i==2

* tc14_ : 1 White 2 Black 3 Hispanic 4 Other 
* tc14year_ : year this trait is taken 
* tc14sp_ : sp's type, in the same year
* tc14check_: whether there is a change in type recording. (1,323 cases) 

rename tc14r_ tc14_
rename tc13r_ tc13_ 

* 2nd race ever reported (add_tc142==0) or not (add_tc142==1) 
gen add_tc142=. 
replace add_tc142=1 if tc142check==0
replace add_tc142=0 if tc142check>0 & tc142check!=. 
tab tc14_, sum(add_tc142)  
label variable add_tc142 "2nd race not reported"

* change in race ever reported (add_tc14c==0) 
gen add_tc14c=.
replace add_tc14c=1 if tc14check==0 
replace add_tc14c=0 if tc14check>0 & tc14check!=. & add_tc14c==. 
replace add_tc14c=1 if tc14_==tc14ccr_
* If the same race is recorded after the strange race, I assume tc14_ is the correct data. 
tab tc14_, sum(add_tc14c)
label variable add_tc14c "change not observed"

tab tc14_ if add_tc142==1, sum(add_tc14c) 


* key info 
* comparison 
foreach i of numlist 1971 1981 1986 1991 1996 2001 2005 2011{
	tab tc14r_`i' [aw=wghtl_i`i']	
}
*  
foreach i of numlist 1971 1981 1986 1991 1996 2001 2005 2011{	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
* 
foreach i of numlist 1971 1981 1986 1991 1996 2001 2005 2011{
	tab tc13r_`i' [aw=wghtl_i`i']	
}
* 
foreach i of numlist 1971 1981 1986 1991 1996 2001 2005 2011{	
	tab tc13r_`i' tc13sp_`i' [aw=wghtl_i`i'] if tc13sp_`i'!=0, row 
}
*

*********************************************
** draft
* 2nd race ever reported (add_tc142==0) or not (add_tc142==1) 
tab tc14_, sum(add_tc142)
sum add_tc142 if tc14_!=4   
* change in race every reported (add_tc14c==0) 
tab tc14_, sum(add_tc14c)
sum add_tc14c if tc14_!=4   
** year 2001 fraction of intermarriages (intro) 
foreach i of numlist 2001{
	tab tc14r_`i' [aw=wghtl_i`i']	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
*
** year 2011 fraction of intermarriages (intro) 
foreach i of numlist 2011{
	tab tc14r_`i' [aw=wghtl_i`i']	
	tab tc14r_`i' tc14sp_`i' [aw=wghtl_i`i'] if tc14sp_`i'!=0, row 
}
*********************************************    

keep id68_i idperson_i sex_i tc14_ tc14sp_ tc14year_ tc14check_ tc13_ tc13sp_ tc13year_ add_tc142 add_tc14c tc13check_

save type_tc14, replace 

*save type_tc14edit, replace

log close 
