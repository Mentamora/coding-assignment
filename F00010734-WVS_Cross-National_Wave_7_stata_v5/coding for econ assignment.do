# v261_ppp - Q98 is the variable measuring houshold net income in euros (x1000), it was calculated by using the IMF exchange rate, than corrected for ppp (purchasing power parity)
# v12 - Q4 whether subject belongs to party organisation
# v21 - Q5 whether sibject did voluntary work in the last 6 months, 1= yes, 2=no

use "C:\Users\Mora_Menta\Downloads\F00010734-WVS_Cross-National_Wave_7_stata_v5\WVS_Cross-National_Wave_7_Stata_v5_0.dta"

tab Q98
tab Q4
tab Q5

#E027 - Political action: attending lawful/peaceful demonstrations
Now I’d like you to look at this card. I’m going to read out some different forms of political action that
people can take, and I’d like you to tell me, for each one, whether you have actually done any of these
things, whether you might do it or would never, under any circumstances, do it.
Master Question in EVS5 (Q30C); in WVS7 (Q211):
Attending lawful demonstrations
-5 Missing: Other
-4 Not asked in survey
-3 Not applicable
-2 No answer
-1 Don´t know
1 Have done
2 Might do
3 Would never do

drop if Q211 == -5

drop if Q211 == -3

drop if Q211 == -4

drop if Q211 == -2

drop if Q211 == -1

tab Q211
recode Q211 (1 = 1) (2 = 0) (3 = 0)
tab Q211

#X047_WVS7 - Scale of incomes (WVS7)
Master Question in WVS7 (Q288):
On this card is an income scale on which 1 indicates the lowest income group and 10 the highest
income group in your country. We would like to know in what group your household is. Please,
specify the appropriate number, counting all wages, salaries, pensions and other incomes that come
in. (Code one number):
-5 Missing: Other
-4 Not asked in survey
-3 Not applicable
-2 No answer
-1 Don´t know
1 Lower step
2 second step
3 Third step
4 Fourth step
5 Fiȇh step
6 Sixth step
7 Seventh step
8 Eight step
9 Nineth step
10 Tenth step

drop if Q288 == -5
(188 observations deleted)

. drop if Q288 = -4
=exp not allowed
r(101);

. drop if Q288 == -4
(0 observations deleted)

. drop if Q288 == -3
(0 observations deleted)

. drop if Q288 == -2
(1,378 observations deleted)

. drop if Q288 == -1
(863 observations deleted)

. tab Q288


label define protest 1 "Attended protest" 0 "Did not attend protest"

label values Q211 protest

regress Q288 Q211, robust


saveold C:\Users\Mora_Menta\Downloads\F00010734-WVS_Cross-National_Wave_7_stata_v5\WVS_Cross-National_Wave_7_Stata_v5_0.dta

