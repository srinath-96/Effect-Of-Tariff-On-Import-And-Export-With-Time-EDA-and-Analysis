# 📊 Econometrics Project: The Effect of Tariffs on Global Imports and Exports (2002-2021)

## 🚩 Introduction

This project analyzes the impact of export and import tariffs on global trade dynamics from 2002 to 2021. It specifically investigates how tariff structures influence trade values and patterns, comparing developed and developing countries to provide deeper insights into international trade policy implications.

---

## 🎯 Problem Statement

- **Research Question:**  
  *How have export and import tariffs impacted the value and composition of international trade over the last two decades (2002-2021)?*

## 🎯 Objectives

- Analyze how export and import tariffs affect global trade values.
- Compare tariff impacts between developed and developing nations.
- Provide empirical insights to inform international trade policies.

## 📚 Literature Review Highlights

- **Impact of Trade and Tariffs (York, 2018)**: Tariffs negatively affect economic growth, employment, and prices.
- **Macroeconomic Consequences (Furceri & Rose, 2019)**: Tariffs significantly influence output, productivity, unemployment, and trade balances.
- **Tariffs & Exchange Rates (Jeanne & Son, 2020)**: Exchange rates can partially offset tariff effects; significant variations exist across countries.
- **Tariffs & Trade Policy Uncertainty (Boer & Rieth, 2024)**: Stable free trade relations significantly benefit economic stability.

## 💾 Dataset Description

Data Source: World Bank's World Integrated Trade Solutions (WITS)

- Period: 2002–2021
- Entries: 4,666 rows with 36 variables
- Countries analyzed:
  - **Developed**: United States, Netherlands, Japan, Czech Republic, France, Germany, Australia, Canada, United Kingdom, Switzerland, Belgium, Ireland, Italy, Singapore, Poland
  - **Developing Countries**: China, India, Mexico, Russia, Saudi Arabia, UAE, Brazil, Taiwan, Thailand, Turkey, Vietnam, Malaysia, Hong Kong, South Korea

### 🔑 Key Variables:
- **Trade Flow**: Direction of trade (Exports/Imports)
- **Product Details**: HS six-digit product codes
- **Trade Values**: Monetary values in thousand USD
- **Tariff Measures**:
  - Applied Harmonized System (AHS) tariffs
  - Most Favored Nation (MFN) tariffs
  - Dutiable and Duty-Free Imports
  - Tariff Lines Shares (Dutiable/Duty-Free)
  - Specific Duty Imports

## 🛠️ Data Preparation Steps

- Checked for duplicates (0% found).
- Removed irrelevant variables (`AHS_MinRate`, `MFN_MinRate`) due to null values.
- Converted remaining null fields to numeric zeros.

## 📈 Exploratory Data Analysis (EDA)

### Developed Countries:
- US dominated exports due to a diverse economy.
- US also led imports followed by Germany; Czech Republic at lowest.
- Significant dip in global trade during the 2009 recession; recovery followed with minor disruptions during COVID-19 in 2019.

### Developing Countries:
- China and Hong Kong emerged as major exporters/importers.
- Economic liberalization notably enhanced trade volumes over time.
- Global recession in 2009 significantly impacted developing countries' exports.

## 📐 Empirical Methodology

Multiple linear regression models analyzed tariff impacts on exports/imports separately for developed and developing nations. Key models include:

| Model | Dependent Variable | Countries Analyzed | Adjusted R² |
|-------|--------------------|--------------------|------------------|
| 1     | Export Values      | Developed          | 0.8667           |
| Model 2 | Import Values    | Developed          | Adjusted R² = 0.8417 |
| Model 3 | Export Values    | Developing         | Adjusted R² = 0.8412 |
| Model 4 | Import Values    | Developing         | Adjusted R² = 0.8717 |

### ✅ Key Findings:

#### Developed Countries:
- Complex tariff structures positively correlated with higher trade volumes.
- MFN duties indicate demand for manufacturing inputs but may reduce competitiveness in certain sectors.
- Positive time trends reflect globalization-driven growth.

#### Developing Countries:
- High tariffs negatively affected export competitiveness by raising costs.
- MFN duties reflect dependency on imported materials but may hinder exports due to increased costs.
- Positive year trend reflects economic liberalization and integration into global value chains.

## 💡 General Insights:

Policymakers can leverage these findings to craft effective strategies:

- Promote stable trade agreements to mitigate tariff-related conflicts.
- Tailor tariffs strategically to bolster competitive industries.
- Invest in infrastructure improvements for efficient trade facilitation.
- Continuously monitor and adapt policies based on evolving global economic conditions.

## 📝 Conclusion & Recommendations:

Tariffs significantly shape global trade patterns. Strategic policy formulation is essential for sustainable economic growth:

### Recommendations:
1. **Enhance Trade Relations** through comprehensive agreements (e.g., EU single market).
2. **Leverage Competitive Advantages** by strategically adjusting tariffs (e.g., Japan's electronics sector).
3. Invest in efficient logistics infrastructure (e.g., Singapore's ports).
4. Continuously adapt policies based on evolving global conditions.

---

This README summarizes the econometric analysis conducted to understand the nuanced impacts of tariffs on global imports and exports over two decades. The insights provided aim to inform policymakers and researchers about effective strategies for managing international trade dynamics.
