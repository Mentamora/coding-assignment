use "C:\Users\Mora_Menta\Downloads\F00010734-WVS_Cross-National_Wave_7_stata_v5\Cleared_WVS_Cross-National_Wave_7_Stata_v5_0.dta"
#regressing variable measuring income on the variable measuring if respondent participated in a protest (with heteroskedasticity robust standard errors)
regress Q288 Q211, robust
#counting how many party members participated in a protest
count if Q98 == 1 & Q211 == 1
#exploring income distribution in the countries
histogram Q288
graph export incomehistogram.pdf

#generate new variable from party members only
gen party_member = 1 if Q98 == 1
#label variable 
lab var party_member "Respondent is member of a party"
tab party_member

save Cleared_WVS_Cross-National_Wave_7_Stata_v5_0.dta, replace