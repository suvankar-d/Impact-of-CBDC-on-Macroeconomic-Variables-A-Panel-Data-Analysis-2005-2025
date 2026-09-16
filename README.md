# Impact of CBDC on Macroeconomic Variables

## Impact of Central Bank Digital Currency (CBDC) on Macroeconomic Variables in the Form of Monetary Transmission and Financial Stability: A Panel Data Analysis (2005–2025)

### Overview

This project examines the potential impact of Central Bank Digital Currency (CBDC) adoption on macroeconomic variables, with particular emphasis on **monetary transmission** and **financial stability**. The study uses a balanced panel covering eight countries over 2005–2025 and applies panel-data regression techniques.

The analysis compares countries that have implemented or actively piloted CBDCs with countries described in the study as emerging/research-stage CBDC economies.

## Research Objectives

- Analyse the effects of CBDC adoption on macroeconomic variables.
- Compare CBDC-adopting and non-CBDC/emerging-CBDC countries.
- Examine variation in inflation, GDP growth and monetary/financial variables following CBDC introduction.
- Evaluate the relationship using panel-data techniques.
- Account for country-specific and time-specific factors.

## Countries and Period

**Study period:** 2005–2025  
**Number of countries:** 8  
**Panel observations:** 168

### CBDC / actively piloted group
- China
- Nigeria
- Bahamas
- Jamaica

### Emerging / research-stage group
- Uruguay
- India
- Brazil
- South Africa

> The country classification above follows the supplied report/PPT.

## Variables

| Variable | Role in analysis |
|---|---|
| `credit` | Dependent variable in the monetary-transmission specification |
| `bank_deposits` | Financial-stability outcome |
| `cbdc_dummy` | CBDC adoption indicator |
| `policy_rate` | Monetary-policy instrument |
| `inflation` | Macroeconomic control |
| `gdp_growth` | Macroeconomic control |
| `cbdc_policy` | CBDC policy variable / interaction-related explanatory variable |

The supplied materials also describe inflation, GDP growth, policy rate, bank deposits and credit as the principal macroeconomic variables.

## Theoretical Framework

The study combines:

1. **Monetary Transmission Theory**
2. **Financial Intermediation Approach**

The proposed channels include the interest-rate channel, credit channel, exchange-rate channel and asset-price channel.

CBDCs may create a more direct monetary-policy channel by providing digital central-bank money to households and firms. At the same time, CBDCs may affect commercial-bank deposits and therefore the traditional bank-lending channel.

## Empirical Strategy

The project uses panel regression models to exploit both cross-country and time-series variation.

### Diagnostic test: VIF

The supplied report reports the following VIF values:

| Variable | VIF |
|---|---:|
| CBDC policy | 4.92 |
| CBDC dummy | 3.71 |
| Inflation | 2.58 |
| Policy rate | 2.36 |
| GDP growth | 1.01 |

The report interprets these values as indicating low-to-moderate multicollinearity and no major multicollinearity concern.

### Pooled OLS

The pooled regression uses credit as the dependent variable. The reported model statistics are:

- Observations: 168
- R²: 0.3541
- Adjusted R²: 0.3347
- Prob > F: 0.0000

The supplied report states that the CBDC dummy is statistically insignificant in the pooled model (`p = 0.958`), while the policy rate, inflation and GDP growth are reported as significant predictors of credit. The CBDC policy variable is described as weak/limited at approximately the 10% level (`p ≈ 0.083`).

### Hausman test: Monetary Transmission

The reported Hausman statistic is:

- χ²(5) = 7.03
- p = 0.2185

The report therefore selects the **Random Effects (RE)** specification at conventional significance levels.

### Hausman test: Financial Stability

The second reported Hausman test gives:

- χ²(5) = 10.12
- p = 0.0719

At the 5% level, the report does not reject the null and uses Random Effects, while noting that the result is close to the 10% threshold and motivates robustness checks using Fixed Effects or cluster-robust standard errors.

## Reported Random-Effects Results

### Monetary transmission

The report gives the following RE coefficients:

| Variable | RE coefficient |
|---|---:|
| `cbdc_dummy` | 12.05796 |
| `policy_rate` | -0.8451249 |
| `inflation` | 0.3210386 |
| `gdp_growth` | -0.7847437 |
| `cbdc_policy` | -0.55532 |

The report describes the CBDC dummy as positive and significant in this RE specification, the policy rate as negative and significant, GDP growth as negative and significant, and inflation as insignificant.

### Financial stability

The second specification reports:

| Variable | RE coefficient |
|---|---:|
| `cbdc_dummy` | 17.77078 |
| `policy_rate` | -0.421999 |
| `inflation` | 0.0785234 |
| `gdp_growth` | -0.5069237 |
| `cbdc_policy` | -0.6896737 |

The report describes CBDC adoption as associated with higher bank deposits in the short run, while the policy-rate effect on deposits is reported as insignificant.

## Graphical Analysis

The supplied report discusses:

- Policy rate vs. credit
- Inflation vs. credit
- GDP growth vs. credit
- Country-level credit trends
- Policy rate vs. bank deposits
- Inflation vs. bank deposits
- GDP growth vs. bank deposits
- Country-level bank-deposit trends

The report describes a negative relationship between policy rate and credit, a negative relationship between inflation and credit, and a positive relationship between GDP growth and credit.

For deposits, the report highlights substantial cross-country heterogeneity and identifies China as a structural outlier in the supplied graphical analysis.

## Policy Implications

The study discusses several potential implications:

- CBDCs may provide a faster and more direct monetary-transmission channel.
- CBDCs may support financial inclusion and digital payments.
- CBDCs can alter commercial-bank intermediation and deposit behaviour.
- CBDCs may create both efficiency benefits and financial-stability risks.
- Holding limits, tiered remuneration and hybrid designs are discussed as possible safeguards.
- Cybersecurity, data privacy and cross-border considerations are also identified as policy issues.

## Conclusion

The supplied study concludes that CBDCs have the potential to change monetary-policy transmission and financial intermediation. The empirical discussion indicates that traditional macroeconomic variables remain important, while the short-term CBDC effects are described as limited in some specifications. The report also emphasizes that the financial and macroeconomic effects of CBDCs depend on institutional conditions and CBDC design.

## Repository Structure

```text
Impact-of-CBDC-Variables/
│
├── README.md
├── code/
│   ├── CBDC_Analysis.do
│   └── CBDC_Graphs.do
│
├── graphs/
│   ├── 01_vif.png
│   ├── 02_pooled_ols.png
│   ├── 03_monetary_transmission.png
│   └── 04_financial_stability.png
│
└── data/
    └── [original panel dataset]
```

## Reproducibility

The Stata files are separated into:

- `CBDC_Analysis.do` — data setup, panel declaration, diagnostics, regressions and Hausman tests.
- `CBDC_Graphs.do` — graph-generation commands only.


## References

The supplied report cites:

- Fernández-Villaverde, J., Sanches, D., Schilling, L., & Uhlig, H. (2021). *Central bank digital currency: Central banking for all?* Review of Economic Dynamics, 41, 225–242.
- He, D. (2018). *Monetary policy in the digital age.* International Monetary Fund.
- International Monetary Fund. (2020). *Digital money across borders: Macro-financial implications.*
- Kumhof, M., & Noone, C. (2018). *Central bank digital currencies—Design principles and balance sheet implications.* Bank of England.
- Mancini-Griffoli, T., et al. (2019). *Casting light on central bank digital currency.* International Monetary Fund.
- People's Bank of China. (2021). *Progress of research and development of e-CNY in China.*
- Reserve Bank of India. (2022). *Concept note on central bank digital currency.*
