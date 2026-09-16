*******************************************************
* IMPACT OF CBDC ON MACROECONOMIC VARIABLES
* Panel Data Analysis, 2005-2025
* Analysis / estimation file
*******************************************************

clear all
set more off

*******************************************************
* 1. DATA SETUP
*******************************************************

* Replace the path below with the supplied panel dataset.
* Example:
* use "data/cbdc_panel.dta", clear
*
* If using Excel:
* import excel "data/cbdc_panel.xlsx", firstrow clear
*
* If using CSV:
* import delimited "data/cbdc_panel.csv", clear

*******************************************************
* 2. VARIABLE CHECKS
*******************************************************

describe
summarize

* Expected variables from the supplied report:
* country year credit bank_deposits cbdc_dummy policy_rate
* inflation gdp_growth cbdc_policy

codebook country year
summarize credit bank_deposits cbdc_dummy policy_rate inflation ///
    gdp_growth cbdc_policy

*******************************************************
* 3. PANEL DECLARATION
*******************************************************

* If country is a string:
* encode country, gen(country_id)

* If country_id already exists, use:
* xtset country_id year

* Otherwise, after encoding:
* xtset country_id year

*******************************************************
* 4. MULTICOLLINEARITY: VIF
*******************************************************

* Pooled OLS used for the VIF diagnostic.
reg credit cbdc_policy cbdc_dummy inflation policy_rate gdp_growth

vif

*******************************************************
* 5. POOLED OLS: MONETARY TRANSMISSION
*******************************************************

reg credit cbdc_policy cbdc_dummy inflation policy_rate gdp_growth

*******************************************************
* 6. FIXED EFFECTS: MONETARY TRANSMISSION
*******************************************************

xtreg credit cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, fe

estimates store fe_monetary

*******************************************************
* 7. RANDOM EFFECTS: MONETARY TRANSMISSION
*******************************************************

xtreg credit cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, re

estimates store re_monetary

*******************************************************
* 8. HAUSMAN TEST: MONETARY TRANSMISSION
*******************************************************

hausman fe_monetary re_monetary, sigmamore

* Reported result in supplied material:
* chi2(5) = 7.03
* Prob > chi2 = 0.2185
* RE selected at conventional significance levels.

*******************************************************
* 9. FINANCIAL STABILITY: FIXED EFFECTS
*******************************************************

xtreg bank_deposits cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, fe

estimates store fe_financial

*******************************************************
* 10. FINANCIAL STABILITY: RANDOM EFFECTS
*******************************************************

xtreg bank_deposits cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, re

estimates store re_financial

*******************************************************
* 11. HAUSMAN TEST: FINANCIAL STABILITY
*******************************************************

hausman fe_financial re_financial, sigmamore

* Reported result in supplied material:
* chi2(5) = 10.12
* Prob > chi2 = 0.0719
* RE selected at the 5% level.
* Consider FE / cluster-robust estimates as robustness checks.

*******************************************************
* 12. OPTIONAL ROBUSTNESS CHECKS
*******************************************************

* Country-clustered standard errors:
xtreg credit cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, re vce(cluster country_id)

xtreg bank_deposits cbdc_policy cbdc_dummy inflation policy_rate ///
    gdp_growth, re vce(cluster country_id)

*******************************************************
* END OF ANALYSIS FILE
*******************************************************
