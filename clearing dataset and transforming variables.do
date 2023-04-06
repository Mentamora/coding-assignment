use "C:\Users\Mora_Menta\Downloads\F00010734-WVS_Cross-National_Wave_7_stata_v5\WVS_Cross-National_Wave_7_Stata_v5_0.dta"

#using the latest Eruopean Values Survey dataset which contains data until 2022, I conduct an analysis exploring relationship between participation in lawful demonstrations, party membership and income of respondent
#Dropping variables except for the three I will use
keep Q98 Q211 Q288

#Q211 is the variable measuring whether respondent has participated in a lawful protest. according to the codebook of the dataset, the following labels were assinged to the following values:
#Attending lawful demonstrations
#-5 Missing: Other
#-4 Not asked in survey
#-3 Not applicable
#-2 No answer
#-1 Don´t know
#1 Have done
#2 Might do
#3 Would never do

#first, i drop missing values
drop if Q211 == -5
drop if Q211 == -3
drop if Q211 == -4
drop if Q211 == -2
drop if Q211 == -1
tab Q211

#I recode the variable into a dummy variable, with a value of 1 if rsondent has participated in demonstration, 0 if has not (Might do, or would never do)

recode Q211 (1 = 1) (2 = 0) (3 = 0)
tab Q211

#assigning a label to Q211 based on whether responded attended protest or not
label define protest 1 "Attended protest" 0 "Did not attend protest"
label values Q211 protest

#Q288 is a variable measuring household income of respondent, deviding subjects of the research into 10 income categories, with 1 being the lowest and 10 being the highest
#The coding of the variable is the following: -5 Missing: Other, -4 Not asked in survey, -3 Not applicable, -2 No answer, -1 Don´t know, 1 Lower step, 2 second step, 3 Third step, 4 Fourth step, 5 Fifth step, 6 Sixth step, 7 Seventh step, 8 Eight step, 9 Nineth step, 10 Tenth step

#dropping missing observations
drop if Q288 == -5
drop if Q288 == -4
drop if Q288 == -3
drop if Q288 == -2
drop if Q288 == -1
tab Q288


#Q98 measures if respondent is member of a political party
# It is coded the following way: -5 Missing: Other, -4 Not asked in survey, -3 Not applicable, -2 No answer, -1 Don´t know, 0 Not mentioned/Not a member, 1 Inactive member, 2 Active member

#dropping missing observations
drop if missing(Q98)
tab Q98

#recoding Q98 to a dummy where party members (inactive members and active members) will have the value of 1, and not members will have the value of 0.
recode Q98 (0 = 0) (1 = 1) (2 = 1)
#assigning values a label accordingly

label define party_membership 1 "Member" 0 "Not a member"
label values Q98 party_membership



save Cleared_WVS_Cross-National_Wave_7_Stata_v5_0.dta

