* 1. File Name: do_ren_ind.do
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
log using "`cache_folder'/log_do_ren_ind.txt", text replace 

* 2. This file renames variables of ind2009er.dta
* "C:\Users\Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3"
** notes: 
* 3. Input: 
* ind2011er.dta 
* : 1,499 variables 
* : 73,251 observations 
* rename_ind2011er_20140718_01.xlsx (copied cells for repeated commans) 
* 4. Output:
* ind_long1.dta  (original + renamed variables) (I stopped saving this file) 
*  obs:        73,251                          
* vars:         2,116                          18 Jul 2014 13:13
* size:   483,017,094 (54.0% of memory free)
*Contains data from D:/Research/Opportunity/.cache/2021-02/ind_short1.dta (only renamed variables) 
*  obs:        73,251                          
* vars:           616                          6 Feb 2021 23:25
* size:   180,490,464                          
*Sorted by: id68_i  idperson_i
* Contains data from D:/Research/Opportunity/.cache/2021-02/ind_short2.dta
*  obs:        73,251                          
* vars:           695                          6 Feb 2021 23:25
* size:   203,637,780                          
*Sorted by: id68r_  idpr_
* wghtavg_i: "average normalized longitudinal sample weights" 
* wght_i`y': "normalized weight each year" (same mean across years) 
* 5. Date: 
* based on \Sophie Shin\My Research\Empirical Work\PSID data\manage\workspace3\do_rename_ind_20140718_01.do
* based on do_ren_ind_20140228_01 from workspace2 folder 
* first composed 7/18/2014 
* last runned 2/7/2021 
* second last runned do_ren_ind_20140718_02 (workspace3)  do_ren_ind_20140228_01 (workspace2) 

use `input_folder'/ind2011er.dta

* (copied from relevant excel file) 
* variable label is not copied. To see the label, I need to look at original variables..
* ex: de ER30001 
gen ER=. 
gen id68_i=ER30001
gen idperson_i=ER30002
gen sex_i=ER32000
gen follow_i=ER32003
gen smpl_i=ER32006
gen bweight_i=ER32014
gen bstable_i=ER32015
gen nbirth_i=ER32022
gen ydatamh_i=ER32033
gen nm_i=ER32034
gen mstartm1_i=ER32035
gen ystartm1_i=ER32036
gen statusm1_i=ER32037
gen mendm1_i=ER32038
gen yendm1_i=ER32039
gen mstartm9_i=ER32042
gen ystartm9_i=ER32043
gen statusm9_i=ER32044
gen mendm9_i=ER32045
gen yendm9_i=ER32046
gen ydeath_i=ER32050
gen inus1968_i=ER31987

gen idyy_i1968=ER30001
gen seq_i1968=ER30002
gen rth_i1968=ER30003
gen hhwk_i1968=ER
gen resp_i1968=ER
gen empl_i1968=ER
gen inc_i1968=ER30012
gen edu_i1968=ER30010
gen follow_i1968=ER
gen none_i1968=ER30018
gen wghtl_i1968=ER30019
gen wghtcs_i1968=ER
gen yborn_i1968=ER
gen hwk_i1968=ER30013
gen health_i1968=ER
gen decidec_i1968=ER

gen idyy_i1969=ER30020
gen seq_i1969=ER30021
gen rth_i1969=ER30022
gen hhwk_i1969=ER30029
gen resp_i1969=ER30031
gen empl_i1969=ER
gen inc_i1969=ER30033
gen edu_i1969=ER
gen follow_i1969=ER
gen none_i1969=ER30041
gen wghtl_i1969=ER30042
gen wghtcs_i1969=ER
gen yborn_i1969=ER
gen hwk_i1969=ER30034
gen health_i1969=ER
gen decidec_i1969=ER

gen idyy_i1970=ER30043
gen seq_i1970=ER30044
gen rth_i1970=ER30045
gen hhwk_i1970=ER30053
gen resp_i1970=ER30055
gen empl_i1970=ER
gen inc_i1970=ER30057
gen edu_i1970=ER30052
gen follow_i1970=ER
gen none_i1970=ER30065
gen wghtl_i1970=ER30066
gen wghtcs_i1970=ER
gen yborn_i1970=ER
gen hwk_i1970=ER30058
gen health_i1970=ER
gen decidec_i1970=ER

gen idyy_i1971=ER30067
gen seq_i1971=ER30068
gen rth_i1971=ER30069
gen hhwk_i1971=ER30077
gen resp_i1971=ER30079
gen empl_i1971=ER
gen inc_i1971=ER30081
gen edu_i1971=ER30076
gen follow_i1971=ER
gen none_i1971=ER30089
gen wghtl_i1971=ER30090
gen wghtcs_i1971=ER
gen yborn_i1971=ER
gen hwk_i1971=ER30082
gen health_i1971=ER
gen decidec_i1971=ER

gen idyy_i1972=ER30091
gen seq_i1972=ER30092
gen rth_i1972=ER30093
gen hhwk_i1972=ER30102
gen resp_i1972=ER30104
gen empl_i1972=ER
gen inc_i1972=ER30106
gen edu_i1972=ER30110
gen follow_i1972=ER
gen none_i1972=ER30115
gen wghtl_i1972=ER30116
gen wghtcs_i1972=ER
gen yborn_i1972=ER
gen hwk_i1972=ER30107
gen health_i1972=ER
gen decidec_i1972=ER

gen idyy_i1973=ER30117
gen seq_i1973=ER30118
gen rth_i1973=ER30119
gen hhwk_i1973=ER30127
gen resp_i1973=ER30128
gen empl_i1973=ER
gen inc_i1973=ER30130
gen edu_i1973=ER30126
gen follow_i1973=ER
gen none_i1973=ER30136
gen wghtl_i1973=ER30137
gen wghtcs_i1973=ER
gen yborn_i1973=ER
gen hwk_i1973=ER30131
gen health_i1973=ER
gen decidec_i1973=ER

gen idyy_i1974=ER30138
gen seq_i1974=ER30139
gen rth_i1974=ER30140
gen hhwk_i1974=ER30148
gen resp_i1974=ER30149
gen empl_i1974=ER
gen inc_i1974=ER30152
gen edu_i1974=ER30147
gen follow_i1974=ER
gen none_i1974=ER30158
gen wghtl_i1974=ER30159
gen wghtcs_i1974=ER
gen yborn_i1974=ER
gen hwk_i1974=ER30153
gen health_i1974=ER
gen decidec_i1974=ER

gen idyy_i1975=ER30160
gen seq_i1975=ER30161
gen rth_i1975=ER30162
gen hhwk_i1975=ER
gen resp_i1975=ER30170
gen empl_i1975=ER
gen inc_i1975=ER30173
gen edu_i1975=ER30181
gen follow_i1975=ER
gen none_i1975=ER30186
gen wghtl_i1975=ER30187
gen wghtcs_i1975=ER
gen yborn_i1975=ER
gen hwk_i1975=ER30178
gen health_i1975=ER
gen decidec_i1975=ER

gen idyy_i1976=ER30188
gen seq_i1976=ER30189
gen rth_i1976=ER30190
gen hhwk_i1976=ER30198
gen resp_i1976=ER30200
gen empl_i1976=ER
gen inc_i1976=ER30202
gen edu_i1976=ER30197
gen follow_i1976=ER
gen none_i1976=ER30215
gen wghtl_i1976=ER30216
gen wghtcs_i1976=ER
gen yborn_i1976=ER
gen hwk_i1976=ER30204
gen health_i1976=ER
gen decidec_i1976=ER

gen idyy_i1977=ER30217
gen seq_i1977=ER30218
gen rth_i1977=ER30219
gen hhwk_i1977=ER30227
gen resp_i1977=ER30229
gen empl_i1977=ER
gen inc_i1977=ER30231
gen edu_i1977=ER30226
gen follow_i1977=ER
gen none_i1977=ER30244
gen wghtl_i1977=ER30245
gen wghtcs_i1977=ER
gen yborn_i1977=ER
gen hwk_i1977=ER30233
gen health_i1977=ER
gen decidec_i1977=ER

gen idyy_i1978=ER30246
gen seq_i1978=ER30247
gen rth_i1978=ER30248
gen hhwk_i1978=ER30256
gen resp_i1978=ER30266
gen empl_i1978=ER
gen inc_i1978=ER30268
gen edu_i1978=ER30255
gen follow_i1978=ER
gen none_i1978=ER30281
gen wghtl_i1978=ER30282
gen wghtcs_i1978=ER
gen yborn_i1978=ER
gen hwk_i1978=ER30270
gen health_i1978=ER
gen decidec_i1978=ER

gen idyy_i1979=ER30283
gen seq_i1979=ER30284
gen rth_i1979=ER30285
gen hhwk_i1979=ER30291
gen resp_i1979=ER30292
gen empl_i1979=ER30293
gen inc_i1979=ER30298
gen edu_i1979=ER30296
gen follow_i1979=ER
gen none_i1979=ER30311
gen wghtl_i1979=ER30312
gen wghtcs_i1979=ER
gen yborn_i1979=ER
gen hwk_i1979=ER30300
gen health_i1979=ER
gen decidec_i1979=ER

gen idyy_i1980=ER30313
gen seq_i1980=ER30314
gen rth_i1980=ER30315
gen hhwk_i1980=ER30321
gen resp_i1980=ER30322
gen empl_i1980=ER30323
gen inc_i1980=ER30328
gen edu_i1980=ER30326
gen follow_i1980=ER
gen none_i1980=ER30341
gen wghtl_i1980=ER30342
gen wghtcs_i1980=ER
gen yborn_i1980=ER
gen hwk_i1980=ER30330
gen health_i1980=ER
gen decidec_i1980=ER

gen idyy_i1981=ER30343
gen seq_i1981=ER30344
gen rth_i1981=ER30345
gen hhwk_i1981=ER30351
gen resp_i1981=ER30352
gen empl_i1981=ER30353
gen inc_i1981=ER30358
gen edu_i1981=ER30356
gen follow_i1981=ER
gen none_i1981=ER30371
gen wghtl_i1981=ER30372
gen wghtcs_i1981=ER
gen yborn_i1981=ER
gen hwk_i1981=ER30360
gen health_i1981=ER
gen decidec_i1981=ER

gen idyy_i1982=ER30373
gen seq_i1982=ER30374
gen rth_i1982=ER30375
gen hhwk_i1982=ER
gen resp_i1982=ER30381
gen empl_i1982=ER30382
gen inc_i1982=ER30386
gen edu_i1982=ER30384
gen follow_i1982=ER
gen none_i1982=ER30397
gen wghtl_i1982=ER30398
gen wghtcs_i1982=ER
gen yborn_i1982=ER
gen hwk_i1982=ER30388
gen health_i1982=ER
gen decidec_i1982=ER

gen idyy_i1983=ER30399
gen seq_i1983=ER30400
gen rth_i1983=ER30401
gen hhwk_i1983=ER30409
gen resp_i1983=ER30410
gen empl_i1983=ER30411
gen inc_i1983=ER30415
gen edu_i1983=ER30413
gen follow_i1983=ER
gen none_i1983=ER30427
gen wghtl_i1983=ER30428
gen wghtcs_i1983=ER
gen yborn_i1983=ER30404
gen hwk_i1983=ER30417
gen health_i1983=ER
gen decidec_i1983=ER

gen idyy_i1984=ER30429
gen seq_i1984=ER30430
gen rth_i1984=ER30431
gen hhwk_i1984=ER30439
gen resp_i1984=ER30440
gen empl_i1984=ER30441
gen inc_i1984=ER30445
gen edu_i1984=ER30443
gen follow_i1984=ER
gen none_i1984=ER30461
gen wghtl_i1984=ER30462
gen wghtcs_i1984=ER
gen yborn_i1984=ER30434
gen hwk_i1984=ER30447
gen health_i1984=ER
gen decidec_i1984=ER

gen idyy_i1985=ER30463
gen seq_i1985=ER30464
gen rth_i1985=ER30465
gen hhwk_i1985=ER30473
gen resp_i1985=ER
gen empl_i1985=ER30474
gen inc_i1985=ER30480
gen edu_i1985=ER30478
gen follow_i1985=ER
gen none_i1985=ER30496
gen wghtl_i1985=ER30497
gen wghtcs_i1985=ER
gen yborn_i1985=ER30468
gen hwk_i1985=ER30482
gen health_i1985=ER
gen decidec_i1985=ER

gen idyy_i1986=ER30498
gen seq_i1986=ER30499
gen rth_i1986=ER30500
gen hhwk_i1986=ER30508
gen resp_i1986=ER
gen empl_i1986=ER30509
gen inc_i1986=ER30515
gen edu_i1986=ER30513
gen follow_i1986=ER
gen none_i1986=ER30533
gen wghtl_i1986=ER30534
gen wghtcs_i1986=ER
gen yborn_i1986=ER30503
gen hwk_i1986=ER30517
gen health_i1986=ER30527
gen decidec_i1986=ER

gen idyy_i1987=ER30535
gen seq_i1987=ER30536
gen rth_i1987=ER30537
gen hhwk_i1987=ER
gen resp_i1987=ER
gen empl_i1987=ER30545
gen inc_i1987=ER30551
gen edu_i1987=ER30549
gen follow_i1987=ER
gen none_i1987=ER30568
gen wghtl_i1987=ER30569
gen wghtcs_i1987=ER
gen yborn_i1987=ER30540
gen hwk_i1987=ER30553
gen health_i1987=ER
gen decidec_i1987=ER

gen idyy_i1988=ER30570
gen seq_i1988=ER30571
gen rth_i1988=ER30572
gen hhwk_i1988=ER
gen resp_i1988=ER
gen empl_i1988=ER30580
gen inc_i1988=ER30586
gen edu_i1988=ER30584
gen follow_i1988=ER
gen none_i1988=ER30604
gen wghtl_i1988=ER30605
gen wghtcs_i1988=ER
gen yborn_i1988=ER30575
gen hwk_i1988=ER30588
gen health_i1988=ER
gen decidec_i1988=ER

gen idyy_i1989=ER30606
gen seq_i1989=ER30607
gen rth_i1989=ER30608
gen hhwk_i1989=ER
gen resp_i1989=ER
gen empl_i1989=ER30616
gen inc_i1989=ER30622
gen edu_i1989=ER30620
gen follow_i1989=ER
gen none_i1989=ER30640
gen wghtl_i1989=ER30641
gen wghtcs_i1989=ER
gen yborn_i1989=ER30611
gen hwk_i1989=ER30624
gen health_i1989=ER
gen decidec_i1989=ER

gen idyy_i1990=ER30642
gen seq_i1990=ER30643
gen rth_i1990=ER30644
gen hhwk_i1990=ER
gen resp_i1990=ER
gen empl_i1990=ER30653
gen inc_i1990=ER30659
gen edu_i1990=ER30657
gen follow_i1990=ER
gen none_i1990=ER30685
gen wghtl_i1990=ER30688
gen wghtcs_i1990=ER
gen yborn_i1990=ER30647
gen hwk_i1990=ER30661
gen health_i1990=ER
gen decidec_i1990=ER
gen inus_i1990=ER30674

gen idyy_i1991=ER30689
gen seq_i1991=ER30690
gen rth_i1991=ER30691
gen hhwk_i1991=ER
gen resp_i1991=ER
gen empl_i1991=ER30699
gen inc_i1991=ER30705
gen edu_i1991=ER30703
gen follow_i1991=ER
gen none_i1991=ER30729
gen wghtl_i1991=ER30732
gen wghtcs_i1991=ER
gen yborn_i1991=ER30694
gen hwk_i1991=ER30709
gen health_i1991=ER
gen decidec_i1991=ER

gen idyy_i1992=ER30733
gen seq_i1992=ER30734
gen rth_i1992=ER30735
gen hhwk_i1992=ER
gen resp_i1992=ER
gen empl_i1992=ER30744
gen inc_i1992=ER30750
gen edu_i1992=ER30748
gen follow_i1992=ER
gen none_i1992=ER30802
gen wghtl_i1992=ER30805
gen wghtcs_i1992=ER
gen yborn_i1992=ER30738
gen hwk_i1992=ER30754
gen health_i1992=ER
gen decidec_i1992=ER
gen inus_i1992=ER30767

gen idyy_i1993=ER30806
gen seq_i1993=ER30807
gen rth_i1993=ER30808
gen hhwk_i1993=ER
gen resp_i1993=ER
gen empl_i1993=ER30816
gen inc_i1993=ER30821
gen edu_i1993=ER30820
gen follow_i1993=ER30860
gen none_i1993=ER30863
gen wghtl_i1993=ER30866
gen wghtcs_i1993=ER
gen yborn_i1993=ER30811
gen hwk_i1993=ER
gen health_i1993=ER
gen decidec_i1993=ER

gen idyy_i1994=ER33101
gen seq_i1994=ER33102
gen rth_i1994=ER33103
gen hhwk_i1994=ER
gen resp_i1994=ER
gen empl_i1994=ER33111
gen inc_i1994=ER
gen edu_i1994=ER33115
gen follow_i1994=ER33150
gen none_i1994=ER33127
gen wghtl_i1994=ER33121
gen wghtcs_i1994=ER
gen yborn_i1994=ER33106
gen hwk_i1994=ER
gen health_i1994=ER33128
gen decidec_i1994=ER

gen idyy_i1995=ER33201
gen seq_i1995=ER33202
gen rth_i1995=ER33203
gen hhwk_i1995=ER
gen resp_i1995=ER33219
gen empl_i1995=ER33211
gen inc_i1995=ER
gen edu_i1995=ER33215
gen follow_i1995=ER33299B
gen none_i1995=ER33283
gen wghtl_i1995=ER33277
gen wghtcs_i1995=ER
gen yborn_i1995=ER33206
gen hwk_i1995=ER
gen health_i1995=ER33284
gen decidec_i1995=ER

gen idyy_i1996=ER33301
gen seq_i1996=ER33302
gen rth_i1996=ER33303
gen hhwk_i1996=ER
gen resp_i1996=ER
gen empl_i1996=ER33311
gen inc_i1996=ER
gen edu_i1996=ER33315
gen follow_i1996=ER33323
gen none_i1996=ER33325
gen wghtl_i1996=ER33318
gen wghtcs_i1996=ER
gen yborn_i1996=ER33306
gen hwk_i1996=ER
gen health_i1996=ER33326
gen decidec_i1996=ER

gen idyy_i1997=ER33401
gen seq_i1997=ER33402
gen rth_i1997=ER33403
gen hhwk_i1997=ER
gen resp_i1997=ER
gen empl_i1997=ER33411
gen inc_i1997=ER
gen edu_i1997=ER33415
gen follow_i1997=ER33435
gen none_i1997=ER33437
gen wghtl_i1997=ER33430
gen wghtcs_i1997=ER33438
gen yborn_i1997=ER33406
gen hwk_i1997=ER
gen health_i1997=ER
gen decidec_i1997=ER

gen idyy_i1999=ER33501
gen seq_i1999=ER33502
gen rth_i1999=ER33503
gen hhwk_i1999=ER
gen resp_i1999=ER33511
gen empl_i1999=ER33512
gen inc_i1999=ER
gen edu_i1999=ER33516
gen follow_i1999=ER33543
gen none_i1999=ER33545
gen wghtl_i1999=ER33546
gen wghtcs_i1999=ER33547
gen yborn_i1999=ER33506
gen hwk_i1999=ER
gen health_i1999=ER
gen decidec_i1999=ER

gen idyy_i2001=ER33601
gen seq_i2001=ER33602
gen rth_i2001=ER33603
gen hhwk_i2001=ER
gen resp_i2001=ER33611
gen empl_i2001=ER33612
gen inc_i2001=ER
gen edu_i2001=ER33616
gen follow_i2001=ER33634
gen none_i2001=ER33636
gen wghtl_i2001=ER33637
gen wghtcs_i2001=ER33639
gen yborn_i2001=ER33606
gen hwk_i2001=ER
gen health_i2001=ER
gen decidec_i2001=ER

gen idyy_i2003=ER33701
gen seq_i2003=ER33702
gen rth_i2003=ER33703
gen hhwk_i2003=ER
gen resp_i2003=ER33711
gen empl_i2003=ER33712
gen inc_i2003=ER
gen edu_i2003=ER33716
gen follow_i2003=ER33737
gen none_i2003=ER33739
gen wghtl_i2003=ER33740
gen wghtcs_i2003=ER33742
gen yborn_i2003=ER33706
gen hwk_i2003=ER
gen health_i2003=ER
gen decidec_i2003=ER33741

gen idyy_i2005=ER33801
gen seq_i2005=ER33802
gen rth_i2005=ER33803
gen hhwk_i2005=ER
gen resp_i2005=ER33811
gen empl_i2005=ER33813
gen inc_i2005=ER
gen edu_i2005=ER33817
gen follow_i2005=ER33843
gen none_i2005=ER33847
gen wghtl_i2005=ER33848
gen wghtcs_i2005=ER33849
gen yborn_i2005=ER33806
gen hwk_i2005=ER
gen health_i2005=ER
gen decidec_i2005=ER33838

gen idyy_i2007=ER33901
gen seq_i2007=ER33902
gen rth_i2007=ER33903
gen hhwk_i2007=ER
gen resp_i2007=ER33911
gen empl_i2007=ER33913
gen inc_i2007=ER
gen edu_i2007=ER33917
gen follow_i2007=ER33943
gen none_i2007=ER33949
gen wghtl_i2007=ER33950
gen wghtcs_i2007=ER33951
gen yborn_i2007=ER33906
gen hwk_i2007=ER
gen health_i2007=ER
gen decidec_i2007=ER

gen idyy_i2009=ER34001
gen seq_i2009=ER34002
gen rth_i2009=ER34003
gen hhwk_i2009=ER
gen resp_i2009=ER34011
gen empl_i2009=ER34016
gen inc_i2009=ER
gen edu_i2009=ER34020
gen follow_i2009=ER34037
gen none_i2009=ER34044
gen wghtl_i2009=ER34045
gen wghtcs_i2009=ER34046
gen yborn_i2009=ER34006
gen hwk_i2009=ER
gen health_i2009=ER
gen decidec_i2009=ER

gen idyy_i2011=ER34101
gen seq_i2011=ER34102
gen rth_i2011=ER34103
gen hhwk_i2011=ER
gen resp_i2011=ER34111
gen empl_i2011=ER34116
gen inc_i2011=ER
gen edu_i2011=ER34119
gen follow_i2011=ER34149
gen none_i2011=ER34153
gen wghtl_i2011=ER34154
gen wghtcs_i2011=ER34155
gen yborn_i2011=ER34106
gen hwk_i2011=ER
gen health_i2011=ER
gen decidec_i2011=ER

*edition in 2/18: I did not read data from 2011 

*sort id68_i idperson_i  

*save `cache_folder'/ind_long1.dta, replace

*de 

keep *_i *_i* 
sort id68_i idperson_i 

save `cache_folder'/ind_short1.dta, replace 

de, short 
*Contains data from D:/Research/Opportunity/.cache/2021-02/ind_short1.dta
*  obs:        73,251                          
* vars:           616                          6 Feb 2021 23:25
* size:   180,490,464                          
*Sorted by: id68_i  idperson_i

* why does the PSID provide weights for analysis? 
* The PSID sample combines the SRC (Survey Research Center) 
* and SEO (Survey of Economic Opportunity) samples. 
* Both samples are probability samples 
* (i.e., samples for which every element in the population has 
* a known nonzero chance of selection). 
* Their combination is also a probability sample. 
* The combination, however, is a sample with unequal selection 
* probabilities, and as a result, compensatory weighting is needed 
* in estimation, at least for descriptive statistics. 
* Weight adjustments are also needed to attempt to compensate 
* for differential nonresponse in 1968 and subsequent waves. 
* Weights supplied on PSID data files are designed to compensate 
* for both unequal selection probabilities and differential attrition.
* (https://psidonline.isr.umich.edu/Guide/FAQ.aspx?Type=10) 
 
* normalize longitudinal weight 
* order id68_i idperson_i wghtl_i*

foreach y of numlist 1968/1996 1997(2)2011{
	gen wghtsumtotal_i`y'=sum(wghtl_i`y')
	sort id68_i idperson 
	replace wghtsumtotal_i`y'=wghtsumtotal_i`y'[_N]
	gen wght_i`y'= wghtl_i`y'/wghtsumtotal_i`y' *1000 
}
*
* let's test if two weights result in the same statistics 
foreach y of numlist 1968/1996 1997(2) 2011{
	summarize edu_i`y' [aw=wghtl_i`y']
	summarize edu_i`y' [aw=wght_i`y']
}
*
sum wght_i*
* same mean across years 

gen wghtsum_i=0
gen wghtnonzero_i=0
foreach y of numlist 1968/1996 1997(2)2011{
	replace wghtsum_i=wghtsum_i+wght_i`y' 
	replace wghtnonzero_i=wghtnonzero_i+1 if wght_i`y'!=0 
}
*
gen wghtavg_i= wghtsum_i/wghtnonzero_i if wghtnonzero_i!=0 
replace wghtavg_i=0 if wghtnonzero_i==0 
* average weight of individual : wghtavg_i 
* I need to use this to find repsentative distribution 

sum wghtsumtotal_i*
sum wght_i* 
sum wghtavg_i wghtnonzero_i

* drop wghtsumtotal_i*
label variable wghtavg_i "average normalized longitudinal sample weights"

* wghtavg_i: "average normalized longitudinal sample weights"
* wght_i`y': "normalized weight each year" 

order id68_i idperson_i sex_i wghtavg_i smpl_i

gen id68r_=id68_i
gen idpr_= idperson_i 

sort id68r_ idpr_
order id68r_ idpr_ 

save `cache_folder'/ind_short2, replace 
de, short

* Contains data from D:/Research/Opportunity/.cache/2021-02/ind_short2.dta
*  obs:        73,251                          
* vars:           695                          6 Feb 2021 23:25
* size:   203,637,780                          
*Sorted by: id68r_  idpr_



log close 














































