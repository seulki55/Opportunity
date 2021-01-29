display _newline(200)
clear all

set more off
set mem 1000m
set maxvar 30000

cd  "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"

log using "do_matlab_tc14_yyyymmdd_nn", text replace

* (copy this area to evernote) 
* 1. file name : do_tc14_hazard_analysis_yyyymmdd_nn
* 2. role of this program: 
*	1) restrict samples 
*	2) analyze hazard rate of marriage and divorce
*		controlling several dimensions
* 3. inputs: 
* type_ind_event 
* 4. outputs: 

* countr_==1 one individual counted once 
* let's control restrictions on samples using add variable
* 	add=1 in sample, add=0 outof sample 
* 	adds=1 use durs, adds=0 do not use durs
* 	addm=1 use durm, addm=0 do not use durm 
* add_yearborn ==1 born <=1995 
* addm_us ==1 marriage period in the US
* adds_us ==1 siglehood period in the US 
* add_tc142r_ (no second mentioned race) add_tc14cr_ (no change in racial reporting) 
* wghtavg_i (average longitudinal weight) 
* 5. date:
* first composed : 2014/9/17
* last runned : do_tc14_hazard_analysis_20141006_draft, do_tc14_hazard_nalysis_20141001_03
* 6. notes: 
*	1) 	based on 	do_hazard_analysis_20140922_03open
* 					do_matlab_tc14_20140915_04_open1
*	2)	based on hard copy 
*		do_for_draft_20130214_02 log output (PSID\manage\workplace1) 



clear
use type_ind_event

sort id68r_ idpr_ orderm
*order  id68r_ idpr_ id68sp_ idpsp_ tc14r_ tc14sp_ orderm

* restrict samples 
gen tcr_= tc14r_ 
gen tcsp_= tc14sp_ 
gen tcyear_= tc14year_ 

label values tcr_ lb1
label values tcsp_ lb1 

order  id68r_ idpr_ id68sp_ idpsp_ tcr_ tcsp_ orderm

gen wghtlr_=. 

replace wghtlr_=wghtavg_i 


* available samples 
tab tcr_ if sexr_==1 & countr_==1 
tab tcr_ if sexr_==2 & countr_==1 
tab tcr_ tcsp_ if sexr_==1 , row 
tab tcsp_ tcr_ if sexr_==2, column 

* exclude info of whites from Latino sample 
tab tcr_ tcsp_ if sexr_==1 & ( id68r_<7000 | (id68r_>7000 & tcr_==3)) , row 
tab tcsp_ tcr_ if sexr_==2  & ( id68r_<7000 | (id68r_>7000 & tcr_==3)), column

save ing1, replace


clear

use ing1 
***** Let's restrict samples 
gen yyear1=1968
gen yyear2=2012 
* I will look at years between yyear1 and yyear2

gen add=. 
* 1 : this individual will be included
gen adds=. 
gen addm=. 
* 1 : this single or marital duration will be included

replace add=1 if tcr_!=. 

tab add
tab tcr tcsp if add==0

replace adds=1 if durs!=. 
* singlehood starts before coming to the US
sum adds if adds_us==0 
display  1908 /51266
* .03721765

sum adds if ystarts_< yyear1 
replace adds=0 if (ystarts_<yyear1 | ystarts_>yyear2)  & adds!=. 
replace adds=0 if adds_us==0
tab adds 

* marriage 
replace addm=1 if durm!=. 

sum addm if addm_us==0 
sum addm if ystartm_< yyear1 

* durm exists but I will not use this. 
replace addm=0 if (ystartm_<yyear1 | ystartm_>yyear2) & addm!=. 
tab tcsp_ if addm==1 , missing
* no spouse info 
replace addm=0 if tcsp_==. & addm==1 
* marriage outside of the US 
replace addm=0 if addm_us==0 
tab addm 

tab tcr_ tcsp_ if ystartm_< yyear1 & durm!=. & addm_us!=0 
tab tcr_ tcsp_ if ystartm_> yyear1 & ystartm_<yyear2 & durm!=. &   addm_us!=0 
tab tcr_ tcsp_ if ystartm_> yyear2 & durm!=. & addm_us!=0 
* rate of intra marriage 
display (2514+763+485+32)/4005
display (10612+4221+2644+218)/20116
* .94731586
* .87964804

tab tcr_ tcsp_ if ystartm_< 1990 & ystartm_>yyear1 & durm!=. & addm_us!=0 , row
tab tcr_ tcsp_ if ystartm_> 1990  & durm!=. & addm_us!=0, row
display (5516+2288+1663+107)/10540
display (5096+1933+981+111)/9576
* year after 1990,, lower intra-marriage rate.. 
* from .90834915 to .84805764

* I will not use individual's info when there is no dur info from him. 
sort id68r_ idpr_ orderm_m 
by id68r_ idpr_ : gen sumadds=sum(adds)
by id68r_ idpr_ : replace sumadds=sumadds[_N]
by id68r_ idpr_ : gen sumaddm=sum(addm)
by id68r_ idpr_ : replace sumaddm=sumaddm[_N]

tab sumadds if countr_==1
tab sumaddm if countr_==1

replace add=0 if (sumadds==0 & sumaddm==0)
* 38674 real changes made

* available samples 
tab tcr_ if sexr_==1 & countr_==1 & add==1
tab tcr_ if sexr_==2 & countr_==1 & add==1
tab sexr_ if tcr_!=. & countr_==1 & add==1

tab tcr_ if countr_==1 & add==1
tab tcr_ if adds==1 & add==1
tab tcr_ if add==1 & countr_==1, sum(nrecords)
tab tcr_ if add==1 & countr_==1, sum(nrecordm)
tab tcr_ tcsp_ if sexr_==1 & addm==1 & add==1 , row
tab tcsp_ tcr_ if sexr_==2 & addm==1  & add==1, column

* distribution of samples that I will use
tab tcr_ if sexr_==1 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 [aw=wghtlr_]
tab sexr_ if tcr_!=. & countr_==1 & add==1 [aw=wghtlr_]

* problematic samples
tab add_tc142r_ tc14r_ if add==1 , column
tab add_tc14cr_ tc14r_ if add==1 , column
tab tc14r_ tc14sp_ if add==1 , sum(add_tc14cr_)
tab tc14r_ tc14sp_ if add==1 , sum(add_tc142r_)
* If I want to exclude this, I need to do it when I take value tc14r_ for tcr_.. 
* and also consider sp's trait.. 

tab tcr_ tcsp_ if add_tc14cr_==1 & add_tc142r_==1 & addm==1 

* statistics 
tab tcr_ if adds==1 & add==1 & sexr_==1, sum(durs) 
tab tcr_ if adds==1 & add==1 & sexr_==2, sum(durs) 
tab tcr_ if adds==1 & add==1 & sexr_==1, sum(exits) 
tab tcr_ if adds==1 & add==1 & sexr_==2, sum(exits) 
tab tcr_ if adds==1 & add==1 & sexr_==1, sum(yborn_) 
tab tcr_ if adds==1 & add==1 & sexr_==2, sum(yborn_) 
tab tcr_ tcsp_ if addm==1 & add==1 & sexr_==1, sum(durm) 
tab tcr_ tcsp_ if addm==1 & add==1 & sexr_==2, sum(durm) 
tab tcr_ tcsp_ if addm==1 & add==1 & sexr_==1, sum(exitm) 
tab tcr_ tcsp_ if addm==1 & add==1 & sexr_==2, sum(exitm) 


*********************
tab tcr_ if countr_==1 & add==1
tab tcr_ tcsp_ if sexr_==1 & addm==1 & add==1 , row
tab tcsp_ tcr_ if sexr_==2 & addm==1  & add==1, column
tab tcr_ if  countr_==1 [aw=wghtlr_]
tab tcr_ if  countr_==1 & add==1 [aw=wghtlr_]

** (including and excluding others) 
tab tcr_ if sexr_==1 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 [aw=wghtlr_]

tab tcr_ if sexr_==1 & countr_==1 & add==1 & tcr_!=4 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 & tcr_!=4 [aw=wghtlr_]

*********************


* I will exclude non-Hispanics from Latino sample
tab tcr_ if add==1 
gen exclude_latino=. 
replace exclude_latino=1 if tcr_!=. & tc14r_!=3 & id68r_>7000 & add==1 
replace exclude_latino=0 if exclude_latino==. & add==1 
tab exclude_latino


* I will exclude non-Hispanic others 
tab tcr_ if add==1 & exclude_latino==0

gen exclude_others=. 
replace exclude_others=1 if tcr_==4 & add==1 
replace exclude_others=0 if exclude_others==. & add==1 
tab exclude_others

*****************************
** draft 
tab tcr_ if countr_==1 & add==1 
tab exclude_latino if countr_==1
* 240 individuals 
tab exclude_others if countr_==1 & exclude_latino==0 
* 641 individuals 
tab tcr_ if countr_==1 & add==1 & exclude_latino==0 & exclude_others==0 
* w: 12,967 b: 7,790 h:4,972
tab tcr_ if sexr_==1 & countr_==1 & exclude_latino==0  & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & exclude_latino==0  & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==1 & countr_==1 & exclude_latino==0 & exclude_others==0 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & exclude_latino==0 & exclude_others==0 & add==1 [aw=wghtlr_]

* problematic samples 
tab adds_us if exclude_latino==0 & exclude_others==0 & (ystarts_>=yyear1 & ystarts_<=yyear2)   
tab addm_us if exclude_latino==0 & exclude_others==0 & (ystartm_>=yyear1 & ystartm_<=yyear2) 

* number of marriages for currently married individuals females, aged 15-44 in 2006-2007
* who were born in 1993-1962 (I use this for calibrating lambda) 
tab nm_m if sexr_==2 & (yborn_ >=1962 & yborn_ <=1993) & countr_==1 & exclude_latino==0  & add==1 & nowm_m==1  [aw=wghtlr_]  
tab nm_m if sexr_==2 & (yborn_ >=1962 & yborn_ <=1993) & countr_==1 & exclude_latino==0  & add==1 & nowm_m==1  

*****************************

* previous****
*sum add if tcr_!=. & tc14r_!=3 & id68r_>7000 
*replace add=0 if tcr_!=. & tc14r_!=3 & id68r_>7000 
*display 395/49440
* .00798948
* exclude non-Hispanic others 
*replace add=0 if tcr_==4 

* now let's exclude non-Hispanics from Latino wave, non-Hispanic others 
replace add=0 if exclude_others==1 
replace add=0 if exclude_latino==1 
tab tcr_ if countr_==1 & add==1 

* let's remove spouse's info if she/he is non-Hispanic others 
replace tcsp_=. if tcsp_==4 
tab tcr_ if sexr_==1 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 [aw=wghtlr_]
tab sexr_ if tcr_!=. & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if countr_==1 & add==1 [aw=wghtlr_]

* last known marital status
gen now=. 

replace now=0 if (nowm_m==2 | nowm_m==4)  & countr_==1 
* 2: never married, 4: divorced 
replace now=tcsp_ if (nowm_m==1 | nowm_m==5 | nowm_m==3  ) & nm_m==orderm_m 
* 1: married, 3: widowed, 5: separated 

tab tcr_ now if sexr_==1 & add==1 , row
tab tcr_ now if sexr_==2 & add==1  , row


**********************
* draft
* last known marital status
tab tcr_ now if sexr_==1 & add==1 & (addm==1 | adds==1) & now!=4 , row
tab tcr_ now if sexr_==2 & add==1 & (addm==1 | adds==1) & now!=4  , row
* problematic samples 
tab tcr_ add_tc142r_ if add==1 & countr_==1 & tcr_!=3 , row 
tab tcr_ add_tc14cr_ if add==1 & countr_==1, row 
**********************


* couple
gen ctype=. 

gen mtype=. 
gen ftype=. 

replace mtype= tcr_ if sexr_==1 & addm==1 & add==1
replace ftype= tcsp_ if sexr_==1 & addm==1 & add==1

replace mtype= tcsp_ if sexr_==2 & addm==1 & add==1
replace ftype= tcr_ if sexr_==2 & addm==1 & add==1

foreach v in tc14 tc25 tc13 t4 tc42 tc53 t6 tc62 t7 tc72 t8 tc82 t9 tc92 {
	gen m`v'=. 
	gen f`v'=.
	replace m`v'= `v'sp_ if sexr_==2 & addm==1 & add==1
	replace f`v'= `v'r_ if sexr_==2 & addm==1 & add==1
	replace m`v'= `v'r_ if sexr_==1 & addm==1 & add==1
	replace f`v'= `v'sp_ if sexr_==1 & addm==1 & add==1	
}
* I want to have W-W as a base 

replace ctype=10 if mtype==1 & ftype==1
replace ctype=2 if mtype==1 & ftype==2
replace ctype=3 if mtype==1 & ftype==3
replace ctype=4 if mtype==2 & ftype==1
replace ctype=5 if mtype==2 & ftype==2
replace ctype=6 if mtype==2 & ftype==3
replace ctype=7 if mtype==3 & ftype==1
replace ctype=8 if mtype==3 & ftype==2
replace ctype=9 if mtype==3 & ftype==3

tabulate ctype, gen(dtype)

*********************
**  (excluding others) 
tab tcr_ if countr_==1 & add==1
tab tcr_ tcsp_ if sexr_==1 & addm==1 & add==1 , row
tab tcsp_ tcr_ if sexr_==2 & addm==1  & add==1, column
tab tcr_ if  countr_==1 [aw=wghtlr_]
tab tcr_ if  countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==1 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ now if sexr_==1 & add==1 & now!=4 , row
tab tcr_ now if sexr_==2 & add==1  & now!=4  , row
* marriage history (for calibrating lambda) 
tab nm_m if sexr_==2 & yborn_>1962 & yborn_<1993 & countr_==1 & ydata_<2010 & nm_m!=0
tab nm_m if sexr_==2 & yborn_>1962 & yborn_<1993 & countr_==1 & ydata_m==2007 & nm_m!=0

********** 
*******************
* draft
* other traits (couple level, new) 
tab mtype ftype 
tab mtype ftype, sum(ystartm_m)
tab mtype ftype, sum(durm)
tab mtype ftype, sum(exitm)
tab mtype ftype, sum(mt4)
tab mtype ftype, sum(ft4)
tab mtype ftype, sum(mt6)
tab mtype ftype, sum(ft6)
tab mtype ftype, sum(mtc53)
tab mtype ftype, sum(ftc53)
tab mtype ftype, sum(mt7)
tab mtype ftype, sum(ft7)

********************


* other traits (couple level) 
sum ystartm_m if tcr_!=. & add==1 & addm==1, de 
sum yendm_m if tcr_!=. & add==1 & addm==1, de
tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(ystartm_m)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1 , sum(ystartm_m)
tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(yborn_m)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1 , sum(yborn_m)
* intermarriages: star recently.. involve young people 

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(durm)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(durm)
tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(exitm)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(exitm)

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(t4r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(t4r_)
tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(t4sp_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(t4sp_)
* black and hispanic males who marry whites are more educated. 
* education of spouse of whites are all high.... 

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(tc53r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(tc53r_)
* who marry whites, wealthier  

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(t6r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(t6r_)
* who marry white males, thinner

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(t7r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(t7r_)
* no correlations on height..I guess 

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(t8r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(t8r_)
* birth weight: not enough samples

tab tcr_ tcsp_ if sexr_==1 & add==1 & addm==1, sum(tc92r_)
tab tcsp_ tcr_ if sexr_==2 & add==1 & addm==1, sum(tc92r_)
* mother's marital stability: no correlations? 

********** 
* other traits (individual level) 
tab tcr_ tc13r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc13r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc25r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc25r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc42r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc42r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc53r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc53r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc62r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc62r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc72r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc72r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ tc92r_ if sexr_==1 & add==1 & countr_==1, row
tab tcr_ tc92r_ if sexr_==2 & add==1 & countr_==1, row

tab tcr_ if add==1 & countr_==1, sum(yborn_) 
tab tcr_ if add==1 & adds==1, sum(ystarts_) 

save ing2, replace


*********************
* analysis 
clear
use ing2 

* let's compute sample mean of ystartm_ mt4 ft4 mt6 ft6 
egen mean_ystart = mean(ystartm_m) if add==1 & addm==1 
egen mean_mt4 = mean(mt4) if add==1 & addm==1 
egen mean_ft4 = mean(ft4) if add==1 & addm==1 
egen mean_mt6 = mean(mt6) if add==1 & addm==1 
egen mean_ft6 = mean(ft6) if add==1 & addm==1 



* hazard analysis (divorce)
stset, clear

stset durm, failure(exitm)

* not controlling other dimensions 
streg dtype* , d(exp)

predict hh10_d, hazard
predict tt10_d, hazard 

tab ctype, sum(hh10_d)

* controlling other dimensions (hazard rates) 

* display in hazard rates 
*(About hazard ratio) Source: http://www.ats.ucla.edu/STAT/stata/seminars/stata_survival/default.htm
* From looking at the hazard ratios (also called relative risks) the model indicates that 
* as the number of previous drug treatment (ndrugtx) increases by one unit, 
* and all other variables are held constant, the rate of relapse increases by 3.7%. 1.037126

***************************************
** draft 
* new hazard rate of divorce.. other dimensions are controlled.
streg dtype* ystartm_m mt4 ft4 mt6 ft6 , d(exp) 

streg dtype* ystartm_m mt4 ft4 mt6 ft6 , d(exp) nohr 

gen ln_hh11_d= _b[dtype1] * dtype1+ _b[dtype2] *dtype2 + _b[dtype3] * dtype3+ _b[dtype4] *dtype4 +_b[dtype5] * dtype5+ _b[dtype6] *dtype6 + _b[dtype7] * dtype7+ _b[dtype8] *dtype8 + _b[ystartm_m]* mean_ystart + _b[mt4]*mean_mt4 + _b[ft4]*mean_ft4 + _b[mt6]* mean_mt6 + _b[ft6]*mean_ft6 + _b[_cons] 

gen hh11_d= exp(ln_hh11_d)

tab ctype, sum(hh11_d) 
*****************************

********************* matlab file ***********
** this part is copied from the bottom part of 
** do_matlab_tc14_20140922_01 


save ing3, replace


clear
use ing3

* singlehood durations  (not now..) 
* stset durs, failure(exits) 


* for matlab analysis 

gen dtyper_= tcr_ 
gen dtypesp_= tcsp_ 

gen dsexr_= sexr_
gen did68r_= id68r_
gen didpr_ = idpr_
gen dorder1= orderm_m
*gen ddur0= durs
*gen dexit0= exits
*gen ddur1= durm
*gen dexit1= exitm 

gen ddur0= durs if adds==1 
gen dexit0= exits if adds==1
gen ddur1= durm if addm==1
gen dexit1= exitm if addm==1

sort did68r_ didpr_ dorder1

order did68r_ didpr_ dsexr_ dorder1 dtyper_ dtypesp_ ddur0 dexit0 ddur1 dexit1  

replace dtypesp_=4 if dexit0==0 

gen dinfo0=1 if ddur0!=. 
gen dinfo1=1 if ddur1!=. 

* key tables 
* h distribution 
tab tcr_ if sexr_==1 & countr_==1 & add==1 [aw=wghtlr_]
tab tcr_ if sexr_==2 & countr_==1 & add==1 [aw=wghtlr_]

* observed stock distribution 
tab tcr_ now if sexr_==1 & add==1 & (adds==1 | addm==1) & now!=4 , row
tab tcr_ now if sexr_==2 & add==1 & (adds==1 | addm==1) & now!=4  , row

drop if did68r_==. 

outsheet did68r_ didpr_ dsexr_ dorder1 dtyper_ dtypesp_ ddur0 dexit0 ddur1 dexit1 dinfo0 dinfo1 using "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3\mh1_race_matlab_20141006_draft.csv" if add==1, comma nolabel replace

* outsheet did68r_ didpr_ dsexr_ dorder1 dtyper_ dtypesp_ ddur0 dexit0 ddur1 dexit1 using "C:\Users\Sophie Shin\My Research\Empirical Work\Matlab\workspace2\mh1_race_matlab1.csv", comma nolabel replace


save ing3, replace


log close








