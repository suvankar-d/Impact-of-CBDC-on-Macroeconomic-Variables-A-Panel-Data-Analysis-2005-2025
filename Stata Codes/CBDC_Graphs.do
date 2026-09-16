*******************************************************
* IMPACT OF CBDC ON MACROECONOMIC VARIABLES
* GRAPH GENERATION ONLY
* Panel Data Analysis, 2005-2025
*******************************************************

* IMPORTANT:
* Load the project dataset before running this file.
* Example:
* use "data/cbdc_panel.dta", clear

*******************************************************
* GRAPH 1: VIF
*******************************************************

* VIF values reported in the supplied report:
* CBDC policy = 4.92
* CBDC dummy  = 3.71
* Inflation   = 2.58
* Policy rate = 2.36
* GDP growth  = 1.01

preserve
clear
input str20 variable vif_value
"CBDC policy" 4.92
"CBDC dummy" 3.71
"Inflation" 2.58
"Policy rate" 2.36
"GDP growth" 1.01
end

graph bar vif_value, over(variable, sort(vif_value) descending) ///
    ytitle("VIF") ///
    title("Variance Inflation Factor (VIF)") ///
    blabel(bar, format(%4.2f)) ///
    name(vif_graph, replace)

graph export "graphs/01_vif.png", replace width(2000)
restore

*******************************************************
* GRAPH 2: POLICY RATE VS CREDIT
*******************************************************

twoway (scatter credit policy_rate) ///
       (lfit credit policy_rate), ///
       xtitle("Policy Rate") ///
       ytitle("Credit") ///
       title("Policy Rate and Credit") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/02_policy_rate_credit.png", replace width(2000)

*******************************************************
* GRAPH 3: INFLATION VS CREDIT
*******************************************************

twoway (scatter credit inflation) ///
       (lfit credit inflation), ///
       xtitle("Inflation Rate") ///
       ytitle("Credit") ///
       title("Inflation and Credit") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/03_inflation_credit.png", replace width(2000)

*******************************************************
* GRAPH 4: GDP GROWTH VS CREDIT
*******************************************************

twoway (scatter credit gdp_growth) ///
       (lfit credit gdp_growth), ///
       xtitle("GDP Growth Rate") ///
       ytitle("Credit") ///
       title("GDP Growth and Credit") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/04_gdp_growth_credit.png", replace width(2000)

*******************************************************
* GRAPH 5: COUNTRY CREDIT TREND
*******************************************************

xtline credit, overlay ///
    xtitle("Year") ///
    ytitle("Credit") ///
    title("Credit Trend Across Countries") ///
    legend(cols(2))

graph export "graphs/05_credit_country_trend.png", replace width(2000)

*******************************************************
* GRAPH 6: POLICY RATE VS BANK DEPOSITS
*******************************************************

twoway (scatter bank_deposits policy_rate) ///
       (lfit bank_deposits policy_rate), ///
       xtitle("Policy Rate") ///
       ytitle("Bank Deposits") ///
       title("Policy Rate and Bank Deposits") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/06_policy_rate_deposits.png", replace width(2000)

*******************************************************
* GRAPH 7: INFLATION VS BANK DEPOSITS
*******************************************************

twoway (scatter bank_deposits inflation) ///
       (lfit bank_deposits inflation), ///
       xtitle("Inflation Rate") ///
       ytitle("Bank Deposits") ///
       title("Inflation and Bank Deposits") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/07_inflation_deposits.png", replace width(2000)

*******************************************************
* GRAPH 8: GDP GROWTH VS BANK DEPOSITS
*******************************************************

twoway (scatter bank_deposits gdp_growth) ///
       (lfit bank_deposits gdp_growth), ///
       xtitle("GDP Growth Rate") ///
       ytitle("Bank Deposits") ///
       title("GDP Growth and Bank Deposits") ///
       legend(order(1 "Observations" 2 "Linear fit"))

graph export "graphs/08_gdp_growth_deposits.png", replace width(2000)

*******************************************************
* GRAPH 9: COUNTRY BANK-DEPOSIT TREND
*******************************************************

xtline bank_deposits, overlay ///
    xtitle("Year") ///
    ytitle("Bank Deposits") ///
    title("Bank Deposit Trend Across Countries") ///
    legend(cols(2))

graph export "graphs/09_deposits_country_trend.png", replace width(2000)

*******************************************************
* END OF GRAPH FILE
*******************************************************
