* 1. File Name: do_ren_fam_yyyymmdd_nn
*** sequence 
clear all
log close
cd "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"
* write output to a log file
log using "log_do_ren_fam_yyyymmdd_nn.txt", text replace
* change stata default settings
* 2. This file renames variables of famyyyy.data 
* 3. Input: 
* famyyyy.dta
* rename_fam_20140806_01.xlsx (copied cells for repeated commans) 
* 4. Output: 
* famyyyy_short1.dta
* 5. Date: 
* based on \workplace2\do_rename_fam_20131010_01 (exactly copied) 
* first composed 7/7/2013
* last runned do_ren_fam_20140806_01.do

set more off
set mem 1000m
set maxvar 30000 


use fam1968

gen V=.
gen idyy_f1968=V3 
gen sexh_f1968=V119 
gen ageh_f1968=V117 
gen agew_f1968=V118 
gen state1_f1968=V93 
gen state2_f1968=V 
gen region_f1968=V361 
gen urban_f1968=V 
gen cplh_f1968=V 
gen cpls_f1968=V 
gen newh_f1968=V 
gen neww_f1968=V 
gen weight_f1968=V439 
gen resp_f1968=V180 
gen respw_f1968=V 
gen ninter_f1968=V 
gen nkid_f1968=V398 
gen hwrkh_f1968=V 
gen hwrkw_f1968=V 
gen spndj_f1968=V 
gen spndr_f1968=V 
gen spndsp_f1968=V 
gen inch_f1968=V74 
gen incw_f1968=V75 
gen wageh_f1968=V337 
gen wagew_f1968=V338 
gen lfph_f1968=V196 
gen lfpw_f1968=V 
gen occh_f1968=V 
gen occw_f1968=V 
gen wghth_f1968=V 
gen wghtw_f1968=V 
gen hght1h_f1968=V 
gen hght2h_f1968=V 
gen hght1w_f1968=V 
gen hght2w_f1968=V 
gen race1h_f1968=V181 
gen race2h_f1968=V 
gen race1w_f1968=V 
gen race2w_f1968=V 
gen ethnh_f1968=V 
gen ethn1h_f1968=V 
gen ethn2h_f1968=V 
gen ethnw_f1968=V 
gen ethn1w_f1968=V 
gen ethn2w_f1968=V 
gen relih_f1968=V 
gen relidh_f1968=V 
gen reliw_f1968=V 
gen relidw_f1968=V 
gen eduh_f1968=V 
gen eduw_f1968=V 
gen drinkh_f1968=V 
gen drinkw_f1968=V 
gen cigarh_f1968=V 
gen cigarw_f1968=V 
gen pare1h_f1968=V317 
gen pare1w_f1968=V 
gen hish_f1968=V 
gen hisw_f1968=V 

keep *_f1968
sum
save fam1968_short1, replace

clear



use fam1969

gen V=.
gen idyy_f1969=V442 
gen sexh_f1969=V1010 
gen ageh_f1969=V1008 
gen agew_f1969=V1011 
gen state1_f1969=V537 
gen state2_f1969=V 
gen region_f1969=V876 
gen urban_f1969=V 
gen cplh_f1969=V 
gen cpls_f1969=V 
gen newh_f1969=V791 
gen neww_f1969=V 
gen weight_f1969=V1014 
gen resp_f1969=V800 
gen respw_f1969=V 
gen ninter_f1969=V 
gen nkid_f1969=V550 
gen hwrkh_f1969=V 
gen hwrkw_f1969=V 
gen spndj_f1969=V 
gen spndr_f1969=V 
gen spndsp_f1969=V 
gen inch_f1969=V514 
gen incw_f1969=V516 
gen wageh_f1969=V871 
gen wagew_f1969=V873 
gen lfph_f1969=V639 
gen lfpw_f1969=V 
gen occh_f1969=V 
gen occw_f1969=V 
gen wghth_f1969=V 
gen wghtw_f1969=V 
gen hght1h_f1969=V 
gen hght2h_f1969=V 
gen hght1w_f1969=V 
gen hght2w_f1969=V 
gen race1h_f1969=V801 
gen race2h_f1969=V 
gen race1w_f1969=V 
gen race2w_f1969=V 
gen ethnh_f1969=V 
gen ethn1h_f1969=V 
gen ethn2h_f1969=V 
gen ethnw_f1969=V 
gen ethn1w_f1969=V 
gen ethn2w_f1969=V 
gen relih_f1969=V 
gen relidh_f1969=V 
gen reliw_f1969=V 
gen relidw_f1969=V 
gen eduh_f1969=V 
gen eduw_f1969=V 
gen drinkh_f1969=V 
gen drinkw_f1969=V 
gen cigarh_f1969=V 
gen cigarw_f1969=V 
gen pare1h_f1969=V792 
gen pare1w_f1969=V 
gen hish_f1969=V 
gen hisw_f1969=V 

keep *_f1969
sum
save fam1969_short1, replace

clear


use fam1970

gen V=.
gen idyy_f1970=V1102 
gen sexh_f1970=V1240 
gen ageh_f1970=V1239 
gen agew_f1970=V1241 
gen state1_f1970=V1103 
gen state2_f1970=V 
gen region_f1970=V1572 
gen urban_f1970=V 
gen cplh_f1970=V 
gen cpls_f1970=V 
gen newh_f1970=V1461 
gen neww_f1970=V 
gen weight_f1970=V1609 
gen resp_f1970=V1489 
gen respw_f1970=V 
gen ninter_f1970=V 
gen nkid_f1970=V1242 
gen hwrkh_f1970=V 
gen hwrkw_f1970=V 
gen spndj_f1970=V 
gen spndr_f1970=V 
gen spndsp_f1970=V 
gen inch_f1970=V1196 
gen incw_f1970=V1198 
gen wageh_f1970=V1567 
gen wagew_f1970=V1569 
gen lfph_f1970=V1278 
gen lfpw_f1970=V 
gen occh_f1970=V 
gen occw_f1970=V 
gen wghth_f1970=V 
gen wghtw_f1970=V 
gen hght1h_f1970=V 
gen hght2h_f1970=V 
gen hght1w_f1970=V 
gen hght2w_f1970=V 
gen race1h_f1970=V1490 
gen race2h_f1970=V 
gen race1w_f1970=V 
gen race2w_f1970=V 
gen ethnh_f1970=V 
gen ethn1h_f1970=V 
gen ethn2h_f1970=V 
gen ethnw_f1970=V 
gen ethn1w_f1970=V 
gen ethn2w_f1970=V 
gen relih_f1970=V1431 
gen relidh_f1970=V 
gen reliw_f1970=V 
gen relidw_f1970=V 
gen eduh_f1970=V 
gen eduw_f1970=V 
gen drinkh_f1970=V 
gen drinkw_f1970=V 
gen cigarh_f1970=V 
gen cigarw_f1970=V 
gen pare1h_f1970=V1483 
gen pare1w_f1970=V 
gen hish_f1970=V 
gen hisw_f1970=V 

keep *_f1970
sum
save fam1970_short1, replace

clear


use fam1971

gen V=.
gen idyy_f1971=V1802 
gen sexh_f1971=V1943 
gen ageh_f1971=V1942 
gen agew_f1971=V1944 
gen state1_f1971=V1803 
gen state2_f1971=V 
gen region_f1971=V2284 
gen urban_f1971=V 
gen cplh_f1971=V 
gen cpls_f1971=V 
gen newh_f1971=V2165 
gen neww_f1971=V 
gen weight_f1971=V2321 
gen resp_f1971=V2201 
gen respw_f1971=V 
gen ninter_f1971=V 
gen nkid_f1971=V1945 
gen hwrkh_f1971=V 
gen hwrkw_f1971=V 
gen spndj_f1971=V 
gen spndr_f1971=V 
gen spndsp_f1971=V 
gen inch_f1971=V1897 
gen incw_f1971=V1899 
gen wageh_f1971=V2279 
gen wagew_f1971=V2281 
gen lfph_f1971=V1983 
gen lfpw_f1971=V 
gen occh_f1971=V 
gen occw_f1971=V 
gen wghth_f1971=V 
gen wghtw_f1971=V 
gen hght1h_f1971=V 
gen hght2h_f1971=V 
gen hght1w_f1971=V 
gen hght2w_f1971=V 
gen race1h_f1971=V2202 
gen race2h_f1971=V 
gen race1w_f1971=V 
gen race2w_f1971=V 
gen ethnh_f1971=V 
gen ethn1h_f1971=V 
gen ethn2h_f1971=V 
gen ethnw_f1971=V 
gen ethn1w_f1971=V 
gen ethn2w_f1971=V 
gen relih_f1971=V2187 
gen relidh_f1971=V 
gen reliw_f1971=V 
gen relidw_f1971=V 
gen eduh_f1971=V 
gen eduw_f1971=V 
gen drinkh_f1971=V 
gen drinkw_f1971=V 
gen cigarh_f1971=V 
gen cigarw_f1971=V 
gen pare1h_f1971=V2195 
gen pare1w_f1971=V 
gen hish_f1971=V 
gen hisw_f1971=V 

keep *_f1971
sum
save fam1971_short1, replace

clear


use fam1972

gen V=.
gen idyy_f1972=V2402 
gen sexh_f1972=V2543 
gen ageh_f1972=V2542 
gen agew_f1972=V2544 
gen state1_f1972=V2403 
gen state2_f1972=V 
gen region_f1972=V2911 
gen urban_f1972=V 
gen cplh_f1972=V 
gen cpls_f1972=V 
gen newh_f1972=V2791 
gen neww_f1972=V 
gen weight_f1972=V2968 
gen resp_f1972=V2827 
gen respw_f1972=V 
gen ninter_f1972=V 
gen nkid_f1972=V2545 
gen hwrkh_f1972=V 
gen hwrkw_f1972=V 
gen spndj_f1972=V 
gen spndr_f1972=V 
gen spndsp_f1972=V 
gen inch_f1972=V2498 
gen incw_f1972=V2500 
gen wageh_f1972=V2906 
gen wagew_f1972=V2908 
gen lfph_f1972=V2581 
gen lfpw_f1972=V 
gen occh_f1972=V 
gen occw_f1972=V 
gen wghth_f1972=V 
gen wghtw_f1972=V 
gen hght1h_f1972=V 
gen hght2h_f1972=V 
gen hght1w_f1972=V 
gen hght2w_f1972=V 
gen race1h_f1972=V2828 
gen race2h_f1972=V 
gen race1w_f1972=V 
gen race2w_f1972=V 
gen ethnh_f1972=V 
gen ethn1h_f1972=V 
gen ethn2h_f1972=V 
gen ethnw_f1972=V 
gen ethn1w_f1972=V 
gen ethn2w_f1972=V 
gen relih_f1972=V2813 
gen relidh_f1972=V 
gen reliw_f1972=V 
gen relidw_f1972=V 
gen eduh_f1972=V 
gen eduw_f1972=V 
gen drinkh_f1972=V 
gen drinkw_f1972=V 
gen cigarh_f1972=V 
gen cigarw_f1972=V 
gen pare1h_f1972=V2821 
gen pare1w_f1972=V 
gen hish_f1972=V 
gen hisw_f1972=V 

keep *_f1972
sum
save fam1972_short1, replace

clear


use fam1973

gen V=.
gen idyy_f1973=V3002 
gen sexh_f1973=V3096 
gen ageh_f1973=V3095 
gen agew_f1973=V3097 
gen state1_f1973=V3003 
gen state2_f1973=V 
gen region_f1973=V3279 
gen urban_f1973=V 
gen cplh_f1973=V 
gen cpls_f1973=V 
gen newh_f1973=V3217 
gen neww_f1973=V3215 
gen weight_f1973=V3301 
gen resp_f1973=V3248 
gen respw_f1973=V 
gen ninter_f1973=V 
gen nkid_f1973=V3098 
gen hwrkh_f1973=V 
gen hwrkw_f1973=V 
gen spndj_f1973=V 
gen spndr_f1973=V 
gen spndsp_f1973=V 
gen inch_f1973=V3051 
gen incw_f1973=V3053 
gen wageh_f1973=V3275 
gen wagew_f1973=V3277 
gen lfph_f1973=V3114 
gen lfpw_f1973=V 
gen occh_f1973=V 
gen occw_f1973=V 
gen wghth_f1973=V 
gen wghtw_f1973=V 
gen hght1h_f1973=V 
gen hght2h_f1973=V 
gen hght1w_f1973=V 
gen hght2w_f1973=V 
gen race1h_f1973=V3300 
gen race2h_f1973=V 
gen race1w_f1973=V 
gen race2w_f1973=V 
gen ethnh_f1973=V 
gen ethn1h_f1973=V 
gen ethn2h_f1973=V 
gen ethnw_f1973=V 
gen ethn1w_f1973=V 
gen ethn2w_f1973=V 
gen relih_f1973=V3231 
gen relidh_f1973=V 
gen reliw_f1973=V 
gen relidw_f1973=V 
gen eduh_f1973=V 
gen eduw_f1973=V 
gen drinkh_f1973=V 
gen drinkw_f1973=V 
gen cigarh_f1973=V 
gen cigarw_f1973=V 
gen pare1h_f1973=V3239 
gen pare1w_f1973=V 
gen hish_f1973=V 
gen hisw_f1973=V 

keep *_f1973
sum
save fam1973_short1, replace

clear


use fam1974

gen V=.
gen idyy_f1974=V3402 
gen sexh_f1974=V3509 
gen ageh_f1974=V3508 
gen agew_f1974=V3510 
gen state1_f1974=V3403 
gen state2_f1974=V 
gen region_f1974=V3699 
gen urban_f1974=V 
gen cplh_f1974=V 
gen cpls_f1974=V 
gen newh_f1974=V3639 
gen neww_f1974=V3637 
gen weight_f1974=V3721 
gen resp_f1974=V3670 
gen respw_f1974=V 
gen ninter_f1974=V 
gen nkid_f1974=V3511 
gen hwrkh_f1974=V 
gen hwrkw_f1974=V 
gen spndj_f1974=V 
gen spndr_f1974=V 
gen spndsp_f1974=V 
gen inch_f1974=V3463 
gen incw_f1974=V3465 
gen wageh_f1974=V3695 
gen wagew_f1974=V3697 
gen lfph_f1974=V3528 
gen lfpw_f1974=V 
gen occh_f1974=V3529 
gen occw_f1974=V 
gen wghth_f1974=V 
gen wghtw_f1974=V 
gen hght1h_f1974=V 
gen hght2h_f1974=V 
gen hght1w_f1974=V 
gen hght2w_f1974=V 
gen race1h_f1974=V3720 
gen race2h_f1974=V 
gen race1w_f1974=V 
gen race2w_f1974=V 
gen ethnh_f1974=V 
gen ethn1h_f1974=V 
gen ethn2h_f1974=V 
gen ethnw_f1974=V 
gen ethn1w_f1974=V 
gen ethn2w_f1974=V 
gen relih_f1974=V3653 
gen relidh_f1974=V 
gen reliw_f1974=V 
gen relidw_f1974=V 
gen eduh_f1974=V 
gen eduw_f1974=V 
gen drinkh_f1974=V 
gen drinkw_f1974=V 
gen cigarh_f1974=V 
gen cigarw_f1974=V 
gen pare1h_f1974=V3661 
gen pare1w_f1974=V 
gen hish_f1974=V 
gen hisw_f1974=V 

keep *_f1974
sum
save fam1974_short1, replace

clear


use fam1975

gen V=.
gen idyy_f1975=V3802 
gen sexh_f1975=V3922 
gen ageh_f1975=V3921 
gen agew_f1975=V3923 
gen state1_f1975=V3803 
gen state2_f1975=V 
gen region_f1975=V4178 
gen urban_f1975=V 
gen cplh_f1975=V 
gen cpls_f1975=V 
gen newh_f1975=V4114 
gen neww_f1975=V4107 
gen weight_f1975=V4224 
gen resp_f1975=V4149 
gen respw_f1975=V 
gen ninter_f1975=V 
gen nkid_f1975=V3924 
gen hwrkh_f1975=V 
gen hwrkw_f1975=V 
gen spndj_f1975=V 
gen spndr_f1975=V 
gen spndsp_f1975=V 
gen inch_f1975=V3863 
gen incw_f1975=V3865 
gen wageh_f1975=V4174 
gen wagew_f1975=V4176 
gen lfph_f1975=V3967 
gen lfpw_f1975=V 
gen occh_f1975=V 
gen occw_f1975=V 
gen wghth_f1975=V 
gen wghtw_f1975=V 
gen hght1h_f1975=V 
gen hght2h_f1975=V 
gen hght1w_f1975=V 
gen hght2w_f1975=V 
gen race1h_f1975=V4204 
gen race2h_f1975=V 
gen race1w_f1975=V 
gen race2w_f1975=V 
gen ethnh_f1975=V 
gen ethn1h_f1975=V 
gen ethn2h_f1975=V 
gen ethnw_f1975=V 
gen ethn1w_f1975=V 
gen ethn2w_f1975=V 
gen relih_f1975=V4129 
gen relidh_f1975=V 
gen reliw_f1975=V 
gen relidw_f1975=V 
gen eduh_f1975=V4093 
gen eduw_f1975=V4102 
gen drinkh_f1975=V 
gen drinkw_f1975=V 
gen cigarh_f1975=V 
gen cigarw_f1975=V 
gen pare1h_f1975=V4137 
gen pare1w_f1975=V 
gen hish_f1975=V 
gen hisw_f1975=V 

keep *_f1975
sum
save fam1975_short1, replace

clear


use fam1976

gen V=.
gen idyy_f1976=V4302 
gen sexh_f1976=V4437 
gen ageh_f1976=V4436 
gen agew_f1976=V4438 
gen state1_f1976=V4303 
gen state2_f1976=V 
gen region_f1976=V5054 
gen urban_f1976=V 
gen cplh_f1976=V 
gen cpls_f1976=V 
gen newh_f1976=V4658 
gen neww_f1976=V4694 
gen weight_f1976=V5099 
gen resp_f1976=V4700 
gen respw_f1976=V5026 
gen ninter_f1976=V 
gen nkid_f1976=V4439 
gen hwrkh_f1976=V4609 
gen hwrkw_f1976=V4768 
gen spndj_f1976=V 
gen spndr_f1976=V 
gen spndsp_f1976=V 
gen inch_f1976=V5031 
gen incw_f1976=V4379 
gen wageh_f1976=V5050 
gen wagew_f1976=V5052 
gen lfph_f1976=V4458 
gen lfpw_f1976=V4841 
gen occh_f1976=V 
gen occw_f1976=V 
gen wghth_f1976=V 
gen wghtw_f1976=V 
gen hght1h_f1976=V 
gen hght2h_f1976=V 
gen hght1w_f1976=V 
gen hght2w_f1976=V 
gen race1h_f1976=V5096 
gen race2h_f1976=V 
gen race1w_f1976=V 
gen race2w_f1976=V 
gen ethnh_f1976=V 
gen ethn1h_f1976=V 
gen ethn2h_f1976=V 
gen ethnw_f1976=V 
gen ethn1w_f1976=V 
gen ethn2w_f1976=V 
gen relih_f1976=V4693 
gen relidh_f1976=V 
gen reliw_f1976=V4765 
gen relidw_f1976=V 
gen eduh_f1976=V4684 
gen eduw_f1976=V4695 
gen drinkh_f1976=V 
gen drinkw_f1976=V 
gen cigarh_f1976=V 
gen cigarw_f1976=V 
gen pare1h_f1976=V4680 
gen pare1w_f1976=V 
gen hish_f1976=V 
gen hisw_f1976=V 

keep *_f1976
sum
save fam1976_short1, replace

clear


use fam1977

gen V=.
gen idyy_f1977=V5202 
gen sexh_f1977=V5351 
gen ageh_f1977=V5350 
gen agew_f1977=V5352 
gen state1_f1977=V5203 
gen state2_f1977=V 
gen region_f1977=V5633 
gen urban_f1977=V 
gen cplh_f1977=V 
gen cpls_f1977=V 
gen newh_f1977=V5578 
gen neww_f1977=V5566 
gen weight_f1977=V5665 
gen resp_f1977=V5618 
gen respw_f1977=V 
gen ninter_f1977=V 
gen nkid_f1977=V5353 
gen hwrkh_f1977=V5535 
gen hwrkw_f1977=V5534 
gen spndj_f1977=V 
gen spndr_f1977=V 
gen spndsp_f1977=V 
gen inch_f1977=V5627 
gen incw_f1977=V5289 
gen wageh_f1977=V5631 
gen wagew_f1977=V5632 
gen lfph_f1977=V5373 
gen lfpw_f1977=V 
gen occh_f1977=V 
gen occw_f1977=V 
gen wghth_f1977=V 
gen wghtw_f1977=V 
gen hght1h_f1977=V 
gen hght2h_f1977=V 
gen hght1w_f1977=V 
gen hght2w_f1977=V 
gen race1h_f1977=V5662 
gen race2h_f1977=V 
gen race1w_f1977=V 
gen race2w_f1977=V 
gen ethnh_f1977=V 
gen ethn1h_f1977=V 
gen ethn2h_f1977=V 
gen ethnw_f1977=V 
gen ethn1w_f1977=V 
gen ethn2w_f1977=V 
gen relih_f1977=V5617 
gen relidh_f1977=V 
gen reliw_f1977=V 
gen relidw_f1977=V 
gen eduh_f1977=V5608 
gen eduw_f1977=V5567 
gen drinkh_f1977=V 
gen drinkw_f1977=V 
gen cigarh_f1977=V 
gen cigarw_f1977=V 
gen pare1h_f1977=V5600 
gen pare1w_f1977=V 
gen hish_f1977=V 
gen hisw_f1977=V 

keep *_f1977
sum
save fam1977_short1, replace

clear


use fam1978

gen V=.
gen idyy_f1978=V5702 
gen sexh_f1978=V5851 
gen ageh_f1978=V5850 
gen agew_f1978=V5852 
gen state1_f1978=V5703 
gen state2_f1978=V 
gen region_f1978=V6180 
gen urban_f1978=V 
gen cplh_f1978=V 
gen cpls_f1978=V 
gen newh_f1978=V6127 
gen neww_f1978=V6115 
gen weight_f1978=V6212 
gen resp_f1978=V6165 
gen respw_f1978=V 
gen ninter_f1978=V 
gen nkid_f1978=V5853 
gen hwrkh_f1978=V6073 
gen hwrkw_f1978=V6072 
gen spndj_f1978=V 
gen spndr_f1978=V 
gen spndsp_f1978=V 
gen inch_f1978=V6174 
gen incw_f1978=V5788 
gen wageh_f1978=V6178 
gen wagew_f1978=V6179 
gen lfph_f1978=V5872 
gen lfpw_f1978=V 
gen occh_f1978=V 
gen occw_f1978=V 
gen wghth_f1978=V 
gen wghtw_f1978=V 
gen hght1h_f1978=V 
gen hght2h_f1978=V 
gen hght1w_f1978=V 
gen hght2w_f1978=V 
gen race1h_f1978=V6209 
gen race2h_f1978=V 
gen race1w_f1978=V 
gen race2w_f1978=V 
gen ethnh_f1978=V 
gen ethn1h_f1978=V 
gen ethn2h_f1978=V 
gen ethnw_f1978=V 
gen ethn1w_f1978=V 
gen ethn2w_f1978=V 
gen relih_f1978=V 
gen relidh_f1978=V 
gen reliw_f1978=V 
gen relidw_f1978=V 
gen eduh_f1978=V6157 
gen eduw_f1978=V6116 
gen drinkh_f1978=V 
gen drinkw_f1978=V 
gen cigarh_f1978=V 
gen cigarw_f1978=V 
gen pare1h_f1978=V6149 
gen pare1w_f1978=V 
gen hish_f1978=V 
gen hisw_f1978=V 

keep *_f1978
sum
save fam1978_short1, replace

clear


use fam1979

gen V=.
gen idyy_f1979=V6302 
gen sexh_f1979=V6463 
gen ageh_f1979=V6462 
gen agew_f1979=V6464 
gen state1_f1979=V6303 
gen state2_f1979=V 
gen region_f1979=V6773 
gen urban_f1979=V 
gen cplh_f1979=V 
gen cpls_f1979=V 
gen newh_f1979=V6724 
gen neww_f1979=V6712 
gen weight_f1979=V6805 
gen resp_f1979=V6764 
gen respw_f1979=V 
gen ninter_f1979=V 
gen nkid_f1979=V6465 
gen hwrkh_f1979=V6664 
gen hwrkw_f1979=V6663 
gen spndj_f1979=V 
gen spndr_f1979=V 
gen spndsp_f1979=V 
gen inch_f1979=V6767 
gen incw_f1979=V6398 
gen wageh_f1979=V6771 
gen wagew_f1979=V6772 
gen lfph_f1979=V6492 
gen lfpw_f1979=V6591 
gen occh_f1979=V 
gen occw_f1979=V 
gen wghth_f1979=V 
gen wghtw_f1979=V 
gen hght1h_f1979=V 
gen hght2h_f1979=V 
gen hght1w_f1979=V 
gen hght2w_f1979=V 
gen race1h_f1979=V6802 
gen race2h_f1979=V 
gen race1w_f1979=V 
gen race2w_f1979=V 
gen ethnh_f1979=V 
gen ethn1h_f1979=V 
gen ethn2h_f1979=V 
gen ethnw_f1979=V 
gen ethn1w_f1979=V 
gen ethn2w_f1979=V 
gen relih_f1979=V6763 
gen relidh_f1979=V 
gen reliw_f1979=V 
gen relidw_f1979=V 
gen eduh_f1979=V6754 
gen eduw_f1979=V6713 
gen drinkh_f1979=V 
gen drinkw_f1979=V 
gen cigarh_f1979=V 
gen cigarw_f1979=V 
gen pare1h_f1979=V6746 
gen pare1w_f1979=V 
gen hish_f1979=V 
gen hisw_f1979=V 

keep *_f1979
sum
save fam1979_short1, replace

clear


use fam1980

gen V=.
gen idyy_f1980=V6902 
gen sexh_f1980=V7068 
gen ageh_f1980=V7067 
gen agew_f1980=V7069 
gen state1_f1980=V6903 
gen state2_f1980=V 
gen region_f1980=V7419 
gen urban_f1980=V 
gen cplh_f1980=V 
gen cpls_f1980=V 
gen newh_f1980=V7357 
gen neww_f1980=V7345 
gen weight_f1980=V7451 
gen resp_f1980=V7397 
gen respw_f1980=V 
gen ninter_f1980=V 
gen nkid_f1980=V7070 
gen hwrkh_f1980=V7266 
gen hwrkw_f1980=V7265 
gen spndj_f1980=V 
gen spndr_f1980=V 
gen spndsp_f1980=V 
gen inch_f1980=V7413 
gen incw_f1980=V6988 
gen wageh_f1980=V7417 
gen wagew_f1980=V7418 
gen lfph_f1980=V7095 
gen lfpw_f1980=V7193 
gen occh_f1980=V 
gen occw_f1980=V 
gen wghth_f1980=V 
gen wghtw_f1980=V 
gen hght1h_f1980=V 
gen hght2h_f1980=V 
gen hght1w_f1980=V 
gen hght2w_f1980=V 
gen race1h_f1980=V7447 
gen race2h_f1980=V 
gen race1w_f1980=V 
gen race2w_f1980=V 
gen ethnh_f1980=V 
gen ethn1h_f1980=V 
gen ethn2h_f1980=V 
gen ethnw_f1980=V 
gen ethn1w_f1980=V 
gen ethn2w_f1980=V 
gen relih_f1980=V7396 
gen relidh_f1980=V 
gen reliw_f1980=V 
gen relidw_f1980=V 
gen eduh_f1980=V7387 
gen eduw_f1980=V7346 
gen drinkh_f1980=V 
gen drinkw_f1980=V 
gen cigarh_f1980=V 
gen cigarw_f1980=V 
gen pare1h_f1980=V7379 
gen pare1w_f1980=V 
gen hish_f1980=V 
gen hisw_f1980=V 

keep *_f1980
sum
save fam1980_short1, replace

clear


use fam1981

gen V=.
gen idyy_f1981=V7502 
gen sexh_f1981=V7659 
gen ageh_f1981=V7658 
gen agew_f1981=V7660 
gen state1_f1981=V7503 
gen state2_f1981=V 
gen region_f1981=V8071 
gen urban_f1981=V 
gen cplh_f1981=V 
gen cpls_f1981=V 
gen newh_f1981=V8009 
gen neww_f1981=V7997 
gen weight_f1981=V8103 
gen resp_f1981=V8049 
gen respw_f1981=V 
gen ninter_f1981=V8051 
gen nkid_f1981=V7661 
gen hwrkh_f1981=V7957 
gen hwrkw_f1981=V7956 
gen spndj_f1981=V 
gen spndr_f1981=V 
gen spndsp_f1981=V 
gen inch_f1981=V8066 
gen incw_f1981=V7580 
gen wageh_f1981=V8069 
gen wagew_f1981=V8070 
gen lfph_f1981=V7706 
gen lfpw_f1981=V7879 
gen occh_f1981=V7712 
gen occw_f1981=V7885 
gen wghth_f1981=V 
gen wghtw_f1981=V 
gen hght1h_f1981=V 
gen hght2h_f1981=V 
gen hght1w_f1981=V 
gen hght2w_f1981=V 
gen race1h_f1981=V8099 
gen race2h_f1981=V 
gen race1w_f1981=V 
gen race2w_f1981=V 
gen ethnh_f1981=V 
gen ethn1h_f1981=V 
gen ethn2h_f1981=V 
gen ethnw_f1981=V 
gen ethn1w_f1981=V 
gen ethn2w_f1981=V 
gen relih_f1981=V8048 
gen relidh_f1981=V 
gen reliw_f1981=V 
gen relidw_f1981=V 
gen eduh_f1981=V8039 
gen eduw_f1981=V7998 
gen drinkh_f1981=V 
gen drinkw_f1981=V 
gen cigarh_f1981=V 
gen cigarw_f1981=V 
gen pare1h_f1981=V8031 
gen pare1w_f1981=V 
gen hish_f1981=V 
gen hisw_f1981=V 

keep *_f1981
sum
save fam1981_short1, replace

clear


use fam1982

gen V=.
gen idyy_f1982=V8202 
gen sexh_f1982=V8353 
gen ageh_f1982=V8352 
gen agew_f1982=V8354 
gen state1_f1982=V8203 
gen state2_f1982=V 
gen region_f1982=V8695 
gen urban_f1982=V 
gen cplh_f1982=V 
gen cpls_f1982=V 
gen newh_f1982=V8633 
gen neww_f1982=V8621 
gen weight_f1982=V8727 
gen resp_f1982=V8673 
gen respw_f1982=V 
gen ninter_f1982=V8675 
gen nkid_f1982=V8355 
gen hwrkh_f1982=V 
gen hwrkw_f1982=V 
gen spndj_f1982=V 
gen spndr_f1982=V 
gen spndsp_f1982=V 
gen inch_f1982=V8690 
gen incw_f1982=V8273 
gen wageh_f1982=V8693 
gen wagew_f1982=V8694 
gen lfph_f1982=V8374 
gen lfpw_f1982=V8538 
gen occh_f1982=V8380 
gen occw_f1982=V8544 
gen wghth_f1982=V 
gen wghtw_f1982=V 
gen hght1h_f1982=V 
gen hght2h_f1982=V 
gen hght1w_f1982=V 
gen hght2w_f1982=V 
gen race1h_f1982=V8723 
gen race2h_f1982=V 
gen race1w_f1982=V 
gen race2w_f1982=V 
gen ethnh_f1982=V 
gen ethn1h_f1982=V 
gen ethn2h_f1982=V 
gen ethnw_f1982=V 
gen ethn1w_f1982=V 
gen ethn2w_f1982=V 
gen relih_f1982=V8672 
gen relidh_f1982=V 
gen reliw_f1982=V 
gen relidw_f1982=V 
gen eduh_f1982=V8663 
gen eduw_f1982=V8622 
gen drinkh_f1982=V 
gen drinkw_f1982=V 
gen cigarh_f1982=V 
gen cigarw_f1982=V 
gen pare1h_f1982=V8655 
gen pare1w_f1982=V 
gen hish_f1982=V 
gen hisw_f1982=V 

keep *_f1982
sum
save fam1982_short1, replace

clear



use fam1983

gen V=.
gen idyy_f1983=V8802 
gen sexh_f1983=V8962 
gen ageh_f1983=V8961 
gen agew_f1983=V8963 
gen state1_f1983=V8803 
gen state2_f1983=V 
gen region_f1983=V9381 
gen urban_f1983=V 
gen cplh_f1983=V9421 
gen cpls_f1983=V9424 
gen newh_f1983=V9319 
gen neww_f1983=V9307 
gen weight_f1983=V9433 
gen resp_f1983=V9359 
gen respw_f1983=V 
gen ninter_f1983=V9361 
gen nkid_f1983=V8964 
gen hwrkh_f1983=V9281 
gen hwrkw_f1983=V9280 
gen spndj_f1983=V 
gen spndr_f1983=V 
gen spndsp_f1983=V 
gen inch_f1983=V9376 
gen incw_f1983=V8881 
gen wageh_f1983=V9379 
gen wagew_f1983=V9380 
gen lfph_f1983=V9005 
gen lfpw_f1983=V9188 
gen occh_f1983=V9011 
gen occw_f1983=V9194 
gen wghth_f1983=V 
gen wghtw_f1983=V 
gen hght1h_f1983=V 
gen hght2h_f1983=V 
gen hght1w_f1983=V 
gen hght2w_f1983=V 
gen race1h_f1983=V9408 
gen race2h_f1983=V 
gen race1w_f1983=V 
gen race2w_f1983=V 
gen ethnh_f1983=V 
gen ethn1h_f1983=V 
gen ethn2h_f1983=V 
gen ethnw_f1983=V 
gen ethn1w_f1983=V 
gen ethn2w_f1983=V 
gen relih_f1983=V9358 
gen relidh_f1983=V 
gen reliw_f1983=V 
gen relidw_f1983=V 
gen eduh_f1983=V9349 
gen eduw_f1983=V9308 
gen drinkh_f1983=V 
gen drinkw_f1983=V 
gen cigarh_f1983=V 
gen cigarw_f1983=V 
gen pare1h_f1983=V9341 
gen pare1w_f1983=V 
gen hish_f1983=V 
gen hisw_f1983=V 

keep *_f1983
sum
save fam1983_short1, replace

clear



use fam1984

gen V=.
gen idyy_f1984=V10002 
gen sexh_f1984=V10420 
gen ageh_f1984=V10419 
gen agew_f1984=V10421 
gen state1_f1984=V10003 
gen state2_f1984=V 
gen region_f1984=V11028 
gen urban_f1984=V 
gen cplh_f1984=V11067 
gen cpls_f1984=V11070 
gen newh_f1984=V10966 
gen neww_f1984=V10954 
gen weight_f1984=V11079 
gen resp_f1984=V11006 
gen respw_f1984=V 
gen ninter_f1984=V11008 
gen nkid_f1984=V10422 
gen hwrkh_f1984=V10867 
gen hwrkw_f1984=V10866 
gen spndj_f1984=V 
gen spndr_f1984=V 
gen spndsp_f1984=V 
gen inch_f1984=V11023 
gen incw_f1984=V10263 
gen wageh_f1984=V11026 
gen wagew_f1984=V11027 
gen lfph_f1984=V10453 
gen lfpw_f1984=V10671 
gen occh_f1984=V10460 
gen occw_f1984=V10678 
gen wghth_f1984=V 
gen wghtw_f1984=V 
gen hght1h_f1984=V 
gen hght2h_f1984=V 
gen hght1w_f1984=V 
gen hght2w_f1984=V 
gen race1h_f1984=V11055 
gen race2h_f1984=V 
gen race1w_f1984=V 
gen race2w_f1984=V 
gen ethnh_f1984=V 
gen ethn1h_f1984=V 
gen ethn2h_f1984=V 
gen ethnw_f1984=V 
gen ethn1w_f1984=V 
gen ethn2w_f1984=V 
gen relih_f1984=V11005 
gen relidh_f1984=V 
gen reliw_f1984=V 
gen relidw_f1984=V 
gen eduh_f1984=V10996 
gen eduw_f1984=V10955 
gen drinkh_f1984=V 
gen drinkw_f1984=V 
gen cigarh_f1984=V 
gen cigarw_f1984=V 
gen pare1h_f1984=V10988 
gen pare1w_f1984=V 
gen hish_f1984=V 
gen hisw_f1984=V 

keep *_f1984
sum
save fam1984_short1, replace

clear


use fam1985

gen V=.
gen idyy_f1985=V11102 
gen sexh_f1985=V11607 
gen ageh_f1985=V11606 
gen agew_f1985=V11608 
gen state1_f1985=V11103 
gen state2_f1985=V12380 
gen region_f1985=V12379 
gen urban_f1985=V12382 
gen cplh_f1985=V12428 
gen cpls_f1985=V12431 
gen newh_f1985=V11906 
gen neww_f1985=V 
gen weight_f1985=V12446 
gen resp_f1985=V12354 
gen respw_f1985=V12355 
gen ninter_f1985=V12357 
gen nkid_f1985=V11609 
gen hwrkh_f1985=V11982 
gen hwrkw_f1985=V12337 
gen spndj_f1985=V 
gen spndr_f1985=V 
gen spndsp_f1985=V 
gen inch_f1985=V12372 
gen incw_f1985=V11404 
gen wageh_f1985=V12377 
gen wagew_f1985=V12378 
gen lfph_f1985=V11637 
gen lfpw_f1985=V12000 
gen occh_f1985=V11651 
gen occw_f1985=V12014 
gen wghth_f1985=V 
gen wghtw_f1985=V 
gen hght1h_f1985=V 
gen hght2h_f1985=V 
gen hght1w_f1985=V 
gen hght2w_f1985=V 
gen race1h_f1985=V11938 
gen race2h_f1985=V11939 
gen race1w_f1985=V12293 
gen race2w_f1985=V12294 
gen ethnh_f1985=V 
gen ethn1h_f1985=V 
gen ethn2h_f1985=V 
gen ethnw_f1985=V 
gen ethn1w_f1985=V 
gen ethn2w_f1985=V 
gen relih_f1985=V11981 
gen relidh_f1985=V 
gen reliw_f1985=V12336 
gen relidw_f1985=V 
gen eduh_f1985=V 
gen eduw_f1985=V 
gen drinkh_f1985=V 
gen drinkw_f1985=V 
gen cigarh_f1985=V 
gen cigarw_f1985=V 
gen pare1h_f1985=V11921 
gen pare1w_f1985=V12276 
gen hish_f1985=V11937 
gen hisw_f1985=V12292 
gen idate_f1985=V11600 



keep *_f1985
sum
save fam1985_short1, replace

clear


use fam1986

gen V=.
gen idyy_f1986=V12502 
gen sexh_f1986=V13012 
gen ageh_f1986=V13011 
gen agew_f1986=V13013 
gen state1_f1986=V12503 
gen state2_f1986=V13632 
gen region_f1986=V13631 
gen urban_f1986=V13634 
gen cplh_f1986=V13667 
gen cpls_f1986=V13670 
gen newh_f1986=V13533 
gen neww_f1986=V13484 
gen weight_f1986=V13687 
gen resp_f1986=V13607 
gen respw_f1986=V 
gen ninter_f1986=V13609 
gen nkid_f1986=V13014 
gen hwrkh_f1986=V13394 
gen hwrkw_f1986=V13393 
gen spndj_f1986=V 
gen spndr_f1986=V 
gen spndsp_f1986=V 
gen inch_f1986=V13624 
gen incw_f1986=V12803 
gen wageh_f1986=V13629 
gen wagew_f1986=V13630 
gen lfph_f1986=V13046 
gen lfpw_f1986=V13225 
gen occh_f1986=V13054 
gen occw_f1986=V13233 
gen wghth_f1986=V13438 
gen wghtw_f1986=V13473 
gen hght1h_f1986=V 
gen hght2h_f1986=V13437 
gen hght1w_f1986=V 
gen hght2w_f1986=V13472 
gen race1h_f1986=V13565 
gen race2h_f1986=V13566 
gen race1w_f1986=V13500 
gen race2w_f1986=V13501 
gen ethnh_f1986=V 
gen ethn1h_f1986=V 
gen ethn2h_f1986=V 
gen ethnw_f1986=V 
gen ethn1w_f1986=V 
gen ethn2w_f1986=V 
gen relih_f1986=V13604 
gen relidh_f1986=V 
gen reliw_f1986=V13530 
gen relidw_f1986=V 
gen eduh_f1986=V 
gen eduw_f1986=V 
gen drinkh_f1986=V 
gen drinkw_f1986=V 
gen cigarh_f1986=V13442 
gen cigarw_f1986=V13477 
gen pare1h_f1986=V13548 
gen pare1w_f1986=V 
gen hish_f1986=V13564 
gen hisw_f1986=V13499 
gen idate_f1986=V13008 


keep *_f1986
sum
save fam1986_short1, replace

clear


use fam1987

gen V=.
gen idyy_f1987=V13702 
gen sexh_f1987=V14115 
gen ageh_f1987=V14114 
gen agew_f1987=V14116 
gen state1_f1987=V13703 
gen state2_f1987=V14679 
gen region_f1987=V14678 
gen urban_f1987=V14681 
gen cplh_f1987=V14714 
gen cpls_f1987=V14717 
gen newh_f1987=V14580 
gen neww_f1987=V14531 
gen weight_f1987=V14737 
gen resp_f1987=V14654 
gen respw_f1987=V 
gen ninter_f1987=V14656 
gen nkid_f1987=V14117 
gen hwrkh_f1987=V14486 
gen hwrkw_f1987=V14485 
gen spndj_f1987=V 
gen spndr_f1987=V 
gen spndsp_f1987=V 
gen inch_f1987=V14671 
gen incw_f1987=V13905 
gen wageh_f1987=V14676 
gen wagew_f1987=V14677 
gen lfph_f1987=V14146 
gen lfpw_f1987=V14321 
gen occh_f1987=V14154 
gen occw_f1987=V14329 
gen wghth_f1987=V 
gen wghtw_f1987=V 
gen hght1h_f1987=V 
gen hght2h_f1987=V 
gen hght1w_f1987=V 
gen hght2w_f1987=V 
gen race1h_f1987=V14612 
gen race2h_f1987=V14613 
gen race1w_f1987=V14547 
gen race2w_f1987=V14548 
gen ethnh_f1987=V 
gen ethn1h_f1987=V 
gen ethn2h_f1987=V 
gen ethnw_f1987=V 
gen ethn1w_f1987=V 
gen ethn2w_f1987=V 
gen relih_f1987=V14651 
gen relidh_f1987=V 
gen reliw_f1987=V14577 
gen relidw_f1987=V 
gen eduh_f1987=V 
gen eduw_f1987=V 
gen drinkh_f1987=V 
gen drinkw_f1987=V 
gen cigarh_f1987=V 
gen cigarw_f1987=V 
gen pare1h_f1987=V14595 
gen pare1w_f1987=V 
gen hish_f1987=V14611 
gen hisw_f1987=V14546 
gen idate_f1987=V14111 


keep *_f1987
sum
save fam1987_short1, replace

clear


use fam1988

gen V=.
gen idyy_f1988=V14802 
gen sexh_f1988=V15131 
gen ageh_f1988=V15130 
gen agew_f1988=V15132 
gen state1_f1988=V14803 
gen state2_f1988=V16153 
gen region_f1988=V16152 
gen urban_f1988=V16155 
gen cplh_f1988=V16189 
gen cpls_f1988=V16192 
gen newh_f1988=V16054 
gen neww_f1988=V16005 
gen weight_f1988=V16208 
gen resp_f1988=V16128 
gen respw_f1988=V 
gen ninter_f1988=V16130 
gen nkid_f1988=V15133 
gen hwrkh_f1988=V15759 
gen hwrkw_f1988=V15758 
gen spndj_f1988=V 
gen spndr_f1988=V 
gen spndsp_f1988=V 
gen inch_f1988=V16145 
gen incw_f1988=V14920 
gen wageh_f1988=V16150 
gen wagew_f1988=V16151 
gen lfph_f1988=V15154 
gen lfpw_f1988=V15456 
gen occh_f1988=V15162 
gen occw_f1988=V15464 
gen wghth_f1988=V 
gen wghtw_f1988=V 
gen hght1h_f1988=V 
gen hght2h_f1988=V 
gen hght1w_f1988=V 
gen hght2w_f1988=V 
gen race1h_f1988=V16086 
gen race2h_f1988=V16087 
gen race1w_f1988=V16021 
gen race2w_f1988=V16022 
gen ethnh_f1988=V 
gen ethn1h_f1988=V 
gen ethn2h_f1988=V 
gen ethnw_f1988=V 
gen ethn1w_f1988=V 
gen ethn2w_f1988=V 
gen relih_f1988=V16125 
gen relidh_f1988=V 
gen reliw_f1988=V16051 
gen relidw_f1988=V 
gen eduh_f1988=V 
gen eduw_f1988=V 
gen drinkh_f1988=V 
gen drinkw_f1988=V 
gen cigarh_f1988=V 
gen cigarw_f1988=V 
gen pare1h_f1988=V16069 
gen pare1w_f1988=V 
gen hish_f1988=V16085 
gen hisw_f1988=V16020 
gen idate_f1988=V15127 


keep *_f1988
sum
save fam1988_short1, replace

clear


use fam1989

gen V=.
gen idyy_f1989=V16302 
gen sexh_f1989=V16632 
gen ageh_f1989=V16631 
gen agew_f1989=V16633 
gen state1_f1989=V16303 
gen state2_f1989=V17539 
gen region_f1989=V17538 
gen urban_f1989=V17541 
gen cplh_f1989=V17567 
gen cpls_f1989=V17570 
gen newh_f1989=V17451 
gen neww_f1989=V17402 
gen weight_f1989=V17612 
gen resp_f1989=V17525 
gen respw_f1989=V 
gen ninter_f1989=V17527 
gen nkid_f1989=V16634 
gen hwrkh_f1989=V17294 
gen hwrkw_f1989=V17293 
gen spndj_f1989=V 
gen spndr_f1989=V 
gen spndsp_f1989=V 
gen inch_f1989=V17534 
gen incw_f1989=V16420 
gen wageh_f1989=V17536 
gen wagew_f1989=V17537 
gen lfph_f1989=V16655 
gen lfpw_f1989=V16974 
gen occh_f1989=V16663 
gen occw_f1989=V16982 
gen wghth_f1989=V 
gen wghtw_f1989=V 
gen hght1h_f1989=V 
gen hght2h_f1989=V 
gen hght1w_f1989=V 
gen hght2w_f1989=V 
gen race1h_f1989=V17483 
gen race2h_f1989=V17484 
gen race1w_f1989=V17418 
gen race2w_f1989=V17419 
gen ethnh_f1989=V 
gen ethn1h_f1989=V 
gen ethn2h_f1989=V 
gen ethnw_f1989=V 
gen ethn1w_f1989=V 
gen ethn2w_f1989=V 
gen relih_f1989=V17522 
gen relidh_f1989=V 
gen reliw_f1989=V17448 
gen relidw_f1989=V 
gen eduh_f1989=V 
gen eduw_f1989=V 
gen drinkh_f1989=V 
gen drinkw_f1989=V 
gen cigarh_f1989=V 
gen cigarw_f1989=V 
gen pare1h_f1989=V17466 
gen pare1w_f1989=V 
gen hish_f1989=V17482 
gen hisw_f1989=V17417 
gen idate_f1989=V16628 


keep *_f1989
sum
save fam1989_short1, replace

clear


use fam1990

gen V=.
gen idyy_f1990=V17702 
gen sexh_f1990=V18050 
gen ageh_f1990=V18049 
gen agew_f1990=V18051 
gen state1_f1990=V17703 
gen state2_f1990=V18890 
gen region_f1990=V18889 
gen urban_f1990=V18892 
gen cplh_f1990=V18918 
gen cpls_f1990=V18921 
gen newh_f1990=V18782 
gen neww_f1990=V18733 
gen weight_f1990=V18943 
gen resp_f1990=V18856 
gen respw_f1990=V 
gen ninter_f1990=V18861 
gen nkid_f1990=V18052 
gen hwrkh_f1990=V18698 
gen hwrkw_f1990=V18697 
gen spndj_f1990=V 
gen spndr_f1990=V 
gen spndsp_f1990=V 
gen inch_f1990=V18878 
gen incw_f1990=V17836 
gen wageh_f1990=V18887 
gen wagew_f1990=V18888 
gen lfph_f1990=V18093 
gen lfpw_f1990=V18395 
gen occh_f1990=V18101 
gen occw_f1990=V18403 
gen wghth_f1990=V 
gen wghtw_f1990=V 
gen hght1h_f1990=V 
gen hght2h_f1990=V 
gen hght1w_f1990=V 
gen hght2w_f1990=V 
gen race1h_f1990=V18814 
gen race2h_f1990=V18815 
gen race1w_f1990=V18749 
gen race2w_f1990=V18750 
gen ethnh_f1990=V 
gen ethn1h_f1990=V 
gen ethn2h_f1990=V 
gen ethnw_f1990=V 
gen ethn1w_f1990=V 
gen ethn2w_f1990=V 
gen relih_f1990=V18853 
gen relidh_f1990=V 
gen reliw_f1990=V18779 
gen relidw_f1990=V 
gen eduh_f1990=V 
gen eduw_f1990=V 
gen drinkh_f1990=V 
gen drinkw_f1990=V 
gen cigarh_f1990=V 
gen cigarw_f1990=V 
gen pare1h_f1990=V18797 
gen pare1w_f1990=V 
gen hish_f1990=V18813 
gen hisw_f1990=V18748 
gen idate_f1990=V18046 


keep *_f1990
sum
save fam1990_short1, replace

clear


use fam1991

gen V=.
gen idyy_f1991=V19002 
gen sexh_f1991=V19350 
gen ageh_f1991=V19349 
gen agew_f1991=V19351 
gen state1_f1991=V19003 
gen state2_f1991=V20190 
gen region_f1991=V20189 
gen urban_f1991=V20192 
gen cplh_f1991=V20218 
gen cpls_f1991=V20221 
gen newh_f1991=V20082 
gen neww_f1991=V20033 
gen weight_f1991=V20243 
gen resp_f1991=V20156 
gen respw_f1991=V 
gen ninter_f1991=V20161 
gen nkid_f1991=V19352 
gen hwrkh_f1991=V19998 
gen hwrkw_f1991=V19997 
gen spndj_f1991=V 
gen spndr_f1991=V 
gen spndsp_f1991=V 
gen inch_f1991=V20178 
gen incw_f1991=V19136 
gen wageh_f1991=V20187 
gen wagew_f1991=V20188 
gen lfph_f1991=V19393 
gen lfpw_f1991=V19695 
gen occh_f1991=V19401 
gen occw_f1991=V19703 
gen wghth_f1991=V 
gen wghtw_f1991=V 
gen hght1h_f1991=V 
gen hght2h_f1991=V 
gen hght1w_f1991=V 
gen hght2w_f1991=V 
gen race1h_f1991=V20114 
gen race2h_f1991=V20115 
gen race1w_f1991=V20049 
gen race2w_f1991=V20050 
gen ethnh_f1991=V 
gen ethn1h_f1991=V 
gen ethn2h_f1991=V 
gen ethnw_f1991=V 
gen ethn1w_f1991=V 
gen ethn2w_f1991=V 
gen relih_f1991=V20153 
gen relidh_f1991=V 
gen reliw_f1991=V20079 
gen relidw_f1991=V 
gen eduh_f1991=V20198 
gen eduw_f1991=V20199 
gen drinkh_f1991=V 
gen drinkw_f1991=V 
gen cigarh_f1991=V 
gen cigarw_f1991=V 
gen pare1h_f1991=V20097 
gen pare1w_f1991=V 
gen hish_f1991=V20113 
gen hisw_f1991=V20048 
gen idate_f1991=V19346 


keep *_f1991
sum
save fam1991_short1, replace

clear


use fam1992

gen V=.
gen idyy_f1992=V20302 
gen sexh_f1992=V20652 
gen ageh_f1992=V20651 
gen agew_f1992=V20653 
gen state1_f1992=V20303 
gen state2_f1992=V21496 
gen region_f1992=V21495 
gen urban_f1992=V21498 
gen cplh_f1992=V21524 
gen cpls_f1992=V21527 
gen newh_f1992=V21388 
gen neww_f1992=V21339 
gen weight_f1992=V21547 
gen resp_f1992=V21462 
gen respw_f1992=V 
gen ninter_f1992=V21467 
gen nkid_f1992=V20654 
gen hwrkh_f1992=V21298 
gen hwrkw_f1992=V21297 
gen spndj_f1992=V 
gen spndr_f1992=V 
gen spndsp_f1992=V 
gen inch_f1992=V21484 
gen incw_f1992=V20436 
gen wageh_f1992=V21493 
gen wagew_f1992=V21494 
gen lfph_f1992=V20693 
gen lfpw_f1992=V20995 
gen occh_f1992=V20701 
gen occw_f1992=V21003 
gen wghth_f1992=V 
gen wghtw_f1992=V 
gen hght1h_f1992=V 
gen hght2h_f1992=V 
gen hght1w_f1992=V 
gen hght2w_f1992=V 
gen race1h_f1992=V21420 
gen race2h_f1992=V21421 
gen race1w_f1992=V21355 
gen race2w_f1992=V21356 
gen ethnh_f1992=V 
gen ethn1h_f1992=V 
gen ethn2h_f1992=V 
gen ethnw_f1992=V 
gen ethn1w_f1992=V 
gen ethn2w_f1992=V 
gen relih_f1992=V21459 
gen relidh_f1992=V 
gen reliw_f1992=V21385 
gen relidw_f1992=V 
gen eduh_f1992=V21504 
gen eduw_f1992=V21505 
gen drinkh_f1992=V 
gen drinkw_f1992=V 
gen cigarh_f1992=V 
gen cigarw_f1992=V 
gen pare1h_f1992=V21403 
gen pare1w_f1992=V 
gen hish_f1992=V21419 
gen hisw_f1992=V21354 
gen idate_f1992=V20648 


keep *_f1992
sum
save fam1992_short1, replace

clear


use fam1993

gen V=.
gen idyy_f1993=V21602 
gen sexh_f1993=V22407 
gen ageh_f1993=V22406 
gen agew_f1993=V22408 
gen state1_f1993=V21603 
gen state2_f1993=V23328 
gen region_f1993=V23327 
gen urban_f1993=V23330 
gen cplh_f1993=V23338 
gen cpls_f1993=V23341 
gen newh_f1993=V23245 
gen neww_f1993=V23196 
gen weight_f1993=V 
gen resp_f1993=V23318 
gen respw_f1993=V 
gen ninter_f1993=V23321 
gen nkid_f1993=V22409 
gen hwrkh_f1993=V23156 
gen hwrkw_f1993=V23154 
gen spndj_f1993=V 
gen spndr_f1993=V 
gen spndsp_f1993=V 
gen inch_f1993=V23323 
gen incw_f1993=V23324 
gen wageh_f1993=V 
gen wagew_f1993=V 
gen lfph_f1993=V22448 
gen lfpw_f1993=V22801 
gen occh_f1993=V22456 
gen occw_f1993=V22809 
gen wghth_f1993=V 
gen wghtw_f1993=V 
gen hght1h_f1993=V 
gen hght2h_f1993=V 
gen hght1w_f1993=V 
gen hght2w_f1993=V 
gen race1h_f1993=V23276 
gen race2h_f1993=V23277 
gen race1w_f1993=V23212 
gen race2w_f1993=V23213 
gen ethnh_f1993=V 
gen ethn1h_f1993=V 
gen ethn2h_f1993=V 
gen ethnw_f1993=V 
gen ethn1w_f1993=V 
gen ethn2w_f1993=V 
gen relih_f1993=V23315 
gen relidh_f1993=V 
gen reliw_f1993=V23242 
gen relidw_f1993=V 
gen eduh_f1993=V23333 
gen eduw_f1993=V23334 
gen drinkh_f1993=V 
gen drinkw_f1993=V 
gen cigarh_f1993=V 
gen cigarw_f1993=V 
gen pare1h_f1993=V23259 
gen pare1w_f1993=V 
gen hish_f1993=V23275 
gen hisw_f1993=V23211 
gen idate_f1993=V22403 


keep *_f1993
sum
save fam1993_short1, replace

clear

use fam1994

gen ER=.
gen idyy_f1994=ER2002 
gen sexh_f1994=ER2008 
gen ageh_f1994=ER2007 
gen agew_f1994=ER2009 
gen state1_f1994=ER 
gen state2_f1994=ER 
gen region_f1994=ER 
gen urban_f1994=ER 
gen cplh_f1994=ER 
gen cpls_f1994=ER 
gen newh_f1994=ER3917 
gen neww_f1994=ER3863 
gen weight_f1994=ER 
gen resp_f1994=ER2013 
gen respw_f1994=ER 
gen ninter_f1994=ER 
gen nkid_f1994=ER2010 
gen hwrkh_f1994=ER3056 
gen hwrkw_f1994=ER3055 
gen spndj_f1994=ER 
gen spndr_f1994=ER 
gen spndsp_f1994=ER 
gen inch_f1994=ER 
gen incw_f1994=ER 
gen wageh_f1994=ER 
gen wagew_f1994=ER 
gen lfph_f1994=ER2068 
gen lfpw_f1994=ER2562 
gen occh_f1994=ER 
gen occw_f1994=ER 
gen wghth_f1994=ER 
gen wghtw_f1994=ER 
gen hght1h_f1994=ER 
gen hght2h_f1994=ER 
gen hght1w_f1994=ER 
gen hght2w_f1994=ER 
gen race1h_f1994=ER3944 
gen race2h_f1994=ER3945 
gen race1w_f1994=ER3883 
gen race2w_f1994=ER3884 
gen ethnh_f1994=ER 
gen ethn1h_f1994=ER 
gen ethn2h_f1994=ER 
gen ethnw_f1994=ER 
gen ethn1w_f1994=ER 
gen ethn2w_f1994=ER 
gen relih_f1994=ER3983 
gen relidh_f1994=ER3984 
gen reliw_f1994=ER3913 
gen relidw_f1994=ER3914 
gen eduh_f1994=ER 
gen eduw_f1994=ER 
gen drinkh_f1994=ER 
gen drinkw_f1994=ER 
gen cigarh_f1994=ER 
gen cigarw_f1994=ER 
gen pare1h_f1994=ER3923 
gen pare1w_f1994=ER 
gen hish_f1994=ER3941 
gen hisw_f1994=ER3880 
gen idate_f1994=ER2005 


keep *_f1994
sum
save fam1994_short1, replace

clear

use fam1995

gen ER=.
gen idyy_f1995=ER5002 
gen sexh_f1995=ER5007 
gen ageh_f1995=ER5006 
gen agew_f1995=ER5008 
gen state1_f1995=ER 
gen state2_f1995=ER 
gen region_f1995=ER 
gen urban_f1995=ER 
gen cplh_f1995=ER 
gen cpls_f1995=ER 
gen newh_f1995=ER6787 
gen neww_f1995=ER6733 
gen weight_f1995=ER 
gen resp_f1995=ER5012 
gen respw_f1995=ER 
gen ninter_f1995=ER 
gen nkid_f1995=ER5009 
gen hwrkh_f1995=ER6055 
gen hwrkw_f1995=ER6054 
gen spndj_f1995=ER 
gen spndr_f1995=ER 
gen spndsp_f1995=ER 
gen inch_f1995=ER 
gen incw_f1995=ER 
gen wageh_f1995=ER 
gen wagew_f1995=ER 
gen lfph_f1995=ER5067 
gen lfpw_f1995=ER5561 
gen occh_f1995=ER 
gen occw_f1995=ER 
gen wghth_f1995=ER 
gen wghtw_f1995=ER 
gen hght1h_f1995=ER 
gen hght2h_f1995=ER 
gen hght1w_f1995=ER 
gen hght2w_f1995=ER 
gen race1h_f1995=ER6814 
gen race2h_f1995=ER6815 
gen race1w_f1995=ER6753 
gen race2w_f1995=ER6754 
gen ethnh_f1995=ER 
gen ethn1h_f1995=ER 
gen ethn2h_f1995=ER 
gen ethnw_f1995=ER 
gen ethn1w_f1995=ER 
gen ethn2w_f1995=ER 
gen relih_f1995=ER6853 
gen relidh_f1995=ER6854 
gen reliw_f1995=ER6783 
gen relidw_f1995=ER6784 
gen eduh_f1995=ER 
gen eduw_f1995=ER 
gen drinkh_f1995=ER 
gen drinkw_f1995=ER 
gen cigarh_f1995=ER 
gen cigarw_f1995=ER 
gen pare1h_f1995=ER6793 
gen pare1w_f1995=ER 
gen hish_f1995=ER6811 
gen hisw_f1995=ER6750 
gen idate_f1995=ER5004 


keep *_f1995
sum
save fam1995_short1, replace

clear

use fam1996

gen ER=.
gen idyy_f1996=ER7002 
gen sexh_f1996=ER7007 
gen ageh_f1996=ER7006 
gen agew_f1996=ER7008 
gen state1_f1996=ER 
gen state2_f1996=ER 
gen region_f1996=ER 
gen urban_f1996=ER 
gen cplh_f1996=ER 
gen cpls_f1996=ER 
gen newh_f1996=ER9033 
gen neww_f1996=ER8979 
gen weight_f1996=ER 
gen resp_f1996=ER7012 
gen respw_f1996=ER 
gen ninter_f1996=ER 
gen nkid_f1996=ER7009 
gen hwrkh_f1996=ER8152 
gen hwrkw_f1996=ER8151 
gen spndj_f1996=ER 
gen spndr_f1996=ER 
gen spndsp_f1996=ER 
gen inch_f1996=ER 
gen incw_f1996=ER 
gen wageh_f1996=ER 
gen wagew_f1996=ER 
gen lfph_f1996=ER7163 
gen lfpw_f1996=ER7657 
gen occh_f1996=ER 
gen occw_f1996=ER 
gen wghth_f1996=ER 
gen wghtw_f1996=ER 
gen hght1h_f1996=ER 
gen hght2h_f1996=ER 
gen hght1w_f1996=ER 
gen hght2w_f1996=ER 
gen race1h_f1996=ER9060 
gen race2h_f1996=ER9061 
gen race1w_f1996=ER8999 
gen race2w_f1996=ER9000 
gen ethnh_f1996=ER 
gen ethn1h_f1996=ER 
gen ethn2h_f1996=ER 
gen ethnw_f1996=ER 
gen ethn1w_f1996=ER 
gen ethn2w_f1996=ER 
gen relih_f1996=ER9099 
gen relidh_f1996=ER9100 
gen reliw_f1996=ER9029 
gen relidw_f1996=ER9030 
gen eduh_f1996=ER 
gen eduw_f1996=ER 
gen drinkh_f1996=ER 
gen drinkw_f1996=ER 
gen cigarh_f1996=ER 
gen cigarw_f1996=ER 
gen pare1h_f1996=ER9039 
gen pare1w_f1996=ER 
gen hish_f1996=ER9057 
gen hisw_f1996=ER8996 
gen idate_f1996=ER7004 

keep *_f1996
sum
save fam1996_short1, replace

clear

use fam1997

gen ER=.
gen idyy_f1997=ER10002 
gen sexh_f1997=ER10010 
gen ageh_f1997=ER10009 
gen agew_f1997=ER10011 
gen state1_f1997=ER 
gen state2_f1997=ER10004 
gen region_f1997=ER 
gen urban_f1997=ER 
gen cplh_f1997=ER 
gen cpls_f1997=ER 
gen newh_f1997=ER11812 
gen neww_f1997=ER11731 
gen weight_f1997=ER12084 
gen resp_f1997=ER10015 
gen respw_f1997=ER 
gen ninter_f1997=ER 
gen nkid_f1997=ER10012 
gen hwrkh_f1997=ER11046 
gen hwrkw_f1997=ER11045 
gen spndj_f1997=ER 
gen spndr_f1997=ER 
gen spndsp_f1997=ER 
gen inch_f1997=ER12080 
gen incw_f1997=ER 
gen wageh_f1997=ER 
gen wagew_f1997=ER 
gen lfph_f1997=ER10081 
gen lfpw_f1997=ER10563 
gen occh_f1997=ER 
gen occw_f1997=ER 
gen wghth_f1997=ER 
gen wghtw_f1997=ER 
gen hght1h_f1997=ER 
gen hght2h_f1997=ER 
gen hght1w_f1997=ER 
gen hght2w_f1997=ER 
gen race1h_f1997=ER11848 
gen race2h_f1997=ER11849 
gen race1w_f1997=ER11760 
gen race2w_f1997=ER11761 
gen ethnh_f1997=ER 
gen ethn1h_f1997=ER 
gen ethn2h_f1997=ER 
gen ethnw_f1997=ER 
gen ethn1w_f1997=ER 
gen ethn2w_f1997=ER 
gen relih_f1997=ER11895 
gen relidh_f1997=ER11896 
gen reliw_f1997=ER11807 
gen relidw_f1997=ER11808 
gen eduh_f1997=ER 
gen eduw_f1997=ER 
gen drinkh_f1997=ER 
gen drinkw_f1997=ER 
gen cigarh_f1997=ER 
gen cigarw_f1997=ER 
gen pare1h_f1997=ER11846 
gen pare1w_f1997=ER 
gen hish_f1997=ER 
gen hisw_f1997=ER 
gen foreignh_f1997=ER11951 
gen foreignw_f1997=ER12033 



keep *_f1997
sum
save fam1997_short1, replace

clear

use fam1999

gen ER=.
gen idyy_f1999=ER13002 
gen sexh_f1999=ER13011 
gen ageh_f1999=ER13010 
gen agew_f1999=ER13012 
gen state1_f1999=ER13004 
gen state2_f1999=ER13005 
gen region_f1999=ER16430 
gen urban_f1999=ER16431 
gen cplh_f1999=ER16425 
gen cpls_f1999=ER 
gen newh_f1999=ER15890 
gen neww_f1999=ER15805 
gen weight_f1999=ER 
gen resp_f1999=ER13016 
gen respw_f1999=ER 
gen ninter_f1999=ER16422 
gen nkid_f1999=ER13013 
gen hwrkh_f1999=ER14230 
gen hwrkw_f1999=ER14229 
gen spndj_f1999=ER15136 
gen spndr_f1999=ER15135 
gen spndsp_f1999=ER15137 
gen inch_f1999=ER16463 
gen incw_f1999=ER 
gen wageh_f1999=ER 
gen wagew_f1999=ER 
gen lfph_f1999=ER13205 
gen lfpw_f1999=ER13717 
gen occh_f1999=ER13215 
gen occw_f1999=ER13727 
gen wghth_f1999=ER15552 
gen wghtw_f1999=ER15660 
gen hght1h_f1999=ER15553 
gen hght2h_f1999=ER15554 
gen hght1w_f1999=ER15661 
gen hght2w_f1999=ER15662 
gen race1h_f1999=ER15928 
gen race2h_f1999=ER15929 
gen race1w_f1999=ER15836 
gen race2w_f1999=ER15837 
gen ethnh_f1999=ER15932 
gen ethn1h_f1999=ER15933 
gen ethn2h_f1999=ER15934 
gen ethnw_f1999=ER15840 
gen ethn1w_f1999=ER15841 
gen ethn2w_f1999=ER15842 
gen relih_f1999=ER15977 
gen relidh_f1999=ER15978 
gen reliw_f1999=ER15884 
gen relidw_f1999=ER15885 
gen eduh_f1999=ER 
gen eduw_f1999=ER 
gen drinkh_f1999=ER 
gen drinkw_f1999=ER 
gen cigarh_f1999=ER15544 
gen cigarw_f1999=ER15652 
gen pare1h_f1999=ER15926 
gen pare1w_f1999=ER 
gen hish_f1999=ER 
gen hisw_f1999=ER 
gen foreignh_f1999=ER16037 
gen foreignw_f1999=ER16124 



keep *_f1999
sum
save fam1999_short1, replace

clear

use fam2001

gen ER=.
gen idyy_f2001=ER17002 
gen sexh_f2001=ER17014 
gen ageh_f2001=ER17013 
gen agew_f2001=ER17015 
gen state1_f2001=ER17004 
gen state2_f2001=ER17005 
gen region_f2001=ER20376 
gen urban_f2001=ER20377 
gen cplh_f2001=ER20371 
gen cpls_f2001=ER 
gen newh_f2001=ER19951 
gen neww_f2001=ER19866 
gen weight_f2001=ER20394 
gen resp_f2001=ER17019 
gen respw_f2001=ER 
gen ninter_f2001=ER20368 
gen nkid_f2001=ER17016 
gen hwrkh_f2001=ER18359 
gen hwrkw_f2001=ER18357 
gen spndj_f2001=ER 
gen spndr_f2001=ER 
gen spndsp_f2001=ER 
gen inch_f2001=ER 
gen incw_f2001=ER 
gen wageh_f2001=ER 
gen wagew_f2001=ER 
gen lfph_f2001=ER17216 
gen lfpw_f2001=ER17786 
gen occh_f2001=ER17226 
gen occw_f2001=ER17796 
gen wghth_f2001=ER19717 
gen wghtw_f2001=ER19825 
gen hght1h_f2001=ER19718 
gen hght2h_f2001=ER19719 
gen hght1w_f2001=ER19826 
gen hght2w_f2001=ER19827 
gen race1h_f2001=ER19989 
gen race2h_f2001=ER19990 
gen race1w_f2001=ER19897 
gen race2w_f2001=ER19898 
gen ethnh_f2001=ER19993 
gen ethn1h_f2001=ER19994 
gen ethn2h_f2001=ER19995 
gen ethnw_f2001=ER19901 
gen ethn1w_f2001=ER19902 
gen ethn2w_f2001=ER19903 
gen relih_f2001=ER20038 
gen relidh_f2001=ER20039 
gen reliw_f2001=ER19945 
gen relidw_f2001=ER19946 
gen eduh_f2001=ER 
gen eduw_f2001=ER 
gen drinkh_f2001=ER 
gen drinkw_f2001=ER 
gen cigarh_f2001=ER19709 
gen cigarw_f2001=ER19817 
gen pare1h_f2001=ER19987 
gen pare1w_f2001=ER 
gen hish_f2001=ER 
gen hisw_f2001=ER 

keep *_f2001
sum
save fam2001_short1, replace

clear

use fam2003

gen ER=.
gen idyy_f2003=ER21002 
gen sexh_f2003=ER21018 
gen ageh_f2003=ER21017 
gen agew_f2003=ER21019 
gen state1_f2003=ER21003 
gen state2_f2003=ER21004 
gen region_f2003=ER24143 
gen urban_f2003=ER24144 
gen cplh_f2003=ER24152 
gen cpls_f2003=ER24155 
gen newh_f2003=ER23388 
gen neww_f2003=ER23303 
gen weight_f2003=ER24179 
gen resp_f2003=ER24073 
gen respw_f2003=ER 
gen ninter_f2003=ER24076 
gen nkid_f2003=ER21020 
gen hwrkh_f2003=ER21625 
gen hwrkw_f2003=ER21623 
gen spndj_f2003=ER 
gen spndr_f2003=ER 
gen spndsp_f2003=ER 
gen inch_f2003=ER24116 
gen incw_f2003=ER 
gen wageh_f2003=ER24137 
gen wagew_f2003=ER24138 
gen lfph_f2003=ER21123 
gen lfpw_f2003=ER21373 
gen occh_f2003=ER21145 
gen occw_f2003=ER21395 
gen wghth_f2003=ER23132 
gen wghtw_f2003=ER23259 
gen hght1h_f2003=ER23133 
gen hght2h_f2003=ER23134 
gen hght1w_f2003=ER23260 
gen hght2w_f2003=ER23261 
gen race1h_f2003=ER23426 
gen race2h_f2003=ER23427 
gen race1w_f2003=ER23334 
gen race2w_f2003=ER23335 
gen ethnh_f2003=ER23430 
gen ethn1h_f2003=ER23431 
gen ethn2h_f2003=ER23432 
gen ethnw_f2003=ER23338 
gen ethn1w_f2003=ER23339 
gen ethn2w_f2003=ER23340 
gen relih_f2003=ER23474 
gen relidh_f2003=ER23475 
gen reliw_f2003=ER23382 
gen relidw_f2003=ER23383 
gen eduh_f2003=ER24148 
gen eduw_f2003=ER24149 
gen drinkh_f2003=ER 
gen drinkw_f2003=ER 
gen cigarh_f2003=ER23124 
gen cigarw_f2003=ER23251 
gen pare1h_f2003=ER23424 
gen pare1w_f2003=ER 
gen hish_f2003=ER 
gen hisw_f2003=ER 

keep *_f2003
sum
save fam2003_short1, replace

clear

use fam2005

gen ER=.
gen idyy_f2005=ER25002 
gen sexh_f2005=ER25018 
gen ageh_f2005=ER25017 
gen agew_f2005=ER25019 
gen state1_f2005=ER25003 
gen state2_f2005=ER25004 
gen region_f2005=ER28042 
gen urban_f2005=ER28043 
gen cplh_f2005=ER28051 
gen cpls_f2005=ER28054 
gen newh_f2005=ER27352 
gen neww_f2005=ER27263 
gen weight_f2005=ER28078 
gen resp_f2005=ER27879 
gen respw_f2005=ER 
gen ninter_f2005=ER27882 
gen nkid_f2005=ER25020 
gen hwrkh_f2005=ER25622 
gen hwrkw_f2005=ER25620 
gen spndj_f2005=ER 
gen spndr_f2005=ER 
gen spndsp_f2005=ER 
gen inch_f2005=ER27931 
gen incw_f2005=ER 
gen wageh_f2005=ER28003 
gen wagew_f2005=ER28004 
gen lfph_f2005=ER25104 
gen lfpw_f2005=ER25362 
gen occh_f2005=ER25127 
gen occw_f2005=ER25385 
gen wghth_f2005=ER27109 
gen wghtw_f2005=ER27232 
gen hght1h_f2005=ER27110 
gen hght2h_f2005=ER27111 
gen hght1w_f2005=ER27233 
gen hght2w_f2005=ER27234 
gen race1h_f2005=ER27393 
gen race2h_f2005=ER27394 
gen race1w_f2005=ER27297 
gen race2w_f2005=ER27298 
gen ethnh_f2005=ER27397 
gen ethn1h_f2005=ER27398 
gen ethn2h_f2005=ER27399 
gen ethnw_f2005=ER27301 
gen ethn1w_f2005=ER27302 
gen ethn2w_f2005=ER27303 
gen relih_f2005=ER27442 
gen relidh_f2005=ER27443 
gen reliw_f2005=ER27346 
gen relidw_f2005=ER27347 
gen eduh_f2005=ER28047 
gen eduw_f2005=ER28048 
gen drinkh_f2005=ER27106 
gen drinkw_f2005=ER27229 
gen cigarh_f2005=ER27099 
gen cigarw_f2005=ER27222 
gen pare1h_f2005=ER27390 
gen pare1w_f2005=ER 
gen hish_f2005=ER27392 
gen hisw_f2005=ER27296 

keep *_f2005
sum
save fam2005_short1, replace

clear

use fam2007

gen ER=.
gen idyy_f2007=ER36002 
gen sexh_f2007=ER36018 
gen ageh_f2007=ER36017 
gen agew_f2007=ER36019 
gen state1_f2007=ER36003 
gen state2_f2007=ER36004 
gen region_f2007=ER41032 
gen urban_f2007=ER41033 
gen cplh_f2007=ER41041 
gen cpls_f2007=ER41044 
gen newh_f2007=ER40527 
gen neww_f2007=ER40438 
gen weight_f2007=ER41069 
gen resp_f2007=ER40869 
gen respw_f2007=ER 
gen ninter_f2007=ER40872 
gen nkid_f2007=ER36020 
gen hwrkh_f2007=ER36627 
gen hwrkw_f2007=ER36625 
gen spndj_f2007=ER 
gen spndr_f2007=ER 
gen spndsp_f2007=ER 
gen inch_f2007=ER40921 
gen incw_f2007=ER 
gen wageh_f2007=ER40993 
gen wagew_f2007=ER40994 
gen lfph_f2007=ER36109 
gen lfpw_f2007=ER36367 
gen occh_f2007=ER36132 
gen occw_f2007=ER36390 
gen wghth_f2007=ER38320 
gen wghtw_f2007=ER39417 
gen hght1h_f2007=ER38321 
gen hght2h_f2007=ER38322 
gen hght1w_f2007=ER39418 
gen hght2w_f2007=ER39419 
gen race1h_f2007=ER40565 
gen race2h_f2007=ER40566 
gen race1w_f2007=ER40472 
gen race2w_f2007=ER40473 
gen ethnh_f2007=ER40569 
gen ethn1h_f2007=ER40570 
gen ethn2h_f2007=ER40571 
gen ethnw_f2007=ER40476 
gen ethn1w_f2007=ER40477 
gen ethn2w_f2007=ER40478 
gen relih_f2007=ER40614 
gen relidh_f2007=ER40615 
gen reliw_f2007=ER40521 
gen relidw_f2007=ER40522 
gen eduh_f2007=ER41037 
gen eduw_f2007=ER41038 
gen drinkh_f2007=ER38317 
gen drinkw_f2007=ER39414 
gen cigarh_f2007=ER38310 
gen cigarw_f2007=ER39407 
gen pare1h_f2007=ER37728 
gen pare1w_f2007=ER 
gen hish_f2007=ER40564 
gen hisw_f2007=ER40471 

keep *_f2007
sum
save fam2007_short1, replace

clear

use fam2009

gen ER=.
gen idyy_f2009=ER42002 
gen sexh_f2009=ER42018 
gen ageh_f2009=ER42017 
gen agew_f2009=ER42019 
gen state1_f2009=ER42003 
gen state2_f2009=ER42004 
gen region_f2009=ER46974 
gen urban_f2009=ER46975 
gen cplh_f2009=ER46985 
gen cpls_f2009=ER46988 
gen newh_f2009=ER46504 
gen neww_f2009=ER46410 
gen weight_f2009=ER47012 
gen resp_f2009=ER46697 
gen respw_f2009=ER 
gen ninter_f2009=ER46760 
gen nkid_f2009=ER42020 
gen hwrkh_f2009=ER42646 
gen hwrkw_f2009=ER42644 
gen spndj_f2009=ER 
gen spndr_f2009=ER 
gen spndsp_f2009=ER 
gen inch_f2009=ER46829 
gen incw_f2009=ER 
gen wageh_f2009=ER46901 
gen wagew_f2009=ER46902 
gen lfph_f2009=ER42140 
gen lfpw_f2009=ER42392 
gen occh_f2009=ER42167 
gen occw_f2009=ER42419 
gen wghth_f2009=ER44293 
gen wghtw_f2009=ER45390 
gen hght1h_f2009=ER44294 
gen hght2h_f2009=ER44295 
gen hght1w_f2009=ER45391 
gen hght2w_f2009=ER45392 
gen race1h_f2009=ER46543 
gen race2h_f2009=ER46544 
gen race1w_f2009=ER46449 
gen race2w_f2009=ER46450 
gen ethnh_f2009=ER46547 
gen ethn1h_f2009=ER46548 
gen ethn2h_f2009=ER46549 
gen ethnw_f2009=ER46453 
gen ethn1w_f2009=ER46454 
gen ethn2w_f2009=ER46455 
gen relih_f2009=ER46592 
gen relidh_f2009=ER46593 
gen reliw_f2009=ER46498 
gen relidw_f2009=ER46499 
gen eduh_f2009=ER46981 
gen eduw_f2009=ER46982 
gen drinkh_f2009=ER44290 
gen drinkw_f2009=ER45387 
gen cigarh_f2009=ER44283 
gen cigarw_f2009=ER45380 
gen pare1h_f2009=ER46540 
gen pare1w_f2009=ER 
gen hish_f2009=ER46542 
gen hisw_f2009=ER46448 

keep *_f2009
sum
save fam2009_short1, replace

clear


use fam2011

gen ER=.
gen idyy_f2011=ER47302 
gen sexh_f2011=ER47318 
gen ageh_f2011=ER47317 
gen agew_f2011=ER47319 
gen state1_f2011=ER47303 
gen state2_f2011=ER47304 
gen region_f2011=ER52398 
gen urban_f2011=ER 
gen cplh_f2011=ER52409 
gen cpls_f2011=ER52412 
gen newh_f2011=ER51865 
gen neww_f2011=ER51771 
gen weight_f2011=ER52436 
gen resp_f2011=ER52097 
gen respw_f2011=ER 
gen ninter_f2011=ER52168 
gen nkid_f2011=ER47320 
gen hwrkh_f2011=ER47964 
gen hwrkw_f2011=ER47962 
gen spndj_f2011=ER 
gen spndr_f2011=ER 
gen spndsp_f2011=ER 
gen inch_f2011=ER52237 
gen incw_f2011=ER 
gen wageh_f2011=ER52309 
gen wagew_f2011=ER52310 
gen lfph_f2011=ER47448 
gen lfpw_f2011=ER47705 
gen occh_f2011=ER47479 
gen occw_f2011=ER47736 
gen wghth_f2011=ER49631 
gen wghtw_f2011=ER50749 
gen hght1h_f2011=ER49633 
gen hght2h_f2011=ER49634 
gen hght1w_f2011=ER50751 
gen hght2w_f2011=ER50752 
gen race1h_f2011=ER51904 
gen race2h_f2011=ER51905 
gen race1w_f2011=ER51810 
gen race2w_f2011=ER51811 
gen ethnh_f2011=ER51908 
gen ethn1h_f2011=ER51909 
gen ethn2h_f2011=ER51910 
gen ethnw_f2011=ER51814 
gen ethn1w_f2011=ER51815 
gen ethn2w_f2011=ER51816 
gen relih_f2011=ER51953 
gen relidh_f2011=ER51954 
gen reliw_f2011=ER51771 
gen relidw_f2011=ER51860 
gen eduh_f2011=ER52405 
gen eduw_f2011=ER52406 
gen drinkh_f2011=ER49628 
gen drinkw_f2011=ER50746 
gen cigarh_f2011=ER49621 
gen cigarw_f2011=ER50739 
gen pare1h_f2011=ER51901 
gen pare1w_f2011=ER 
gen hish_f2011=ER51903 
gen hisw_f2011=ER51809 

keep *_f2011
sum
save fam2011_short1, replace

clear

log close 








