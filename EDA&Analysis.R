library(data.table)
library(ggplot2)
library(broom)
library(tidyverse)
library(plm)
library(haven)
library(tseries)
library(AER)

developed_countries = c("United States","Netherlands", "Japan","Czech Republic","France","Germany","Australia","Russia","Canada","Australia","United Kingdom","Switzerland","Belgium","Ireland","Italy","Singapore","Poland")
developing_countries =c("India","China","Mexico","Russia","Saudi Arabia","United Arab Emirates","Brazil","Taiwan","Thailand","Turkey","Vietnam","Malaysia","Hong Kong","South Korea")
df <- data_new[data_new$Partner_Name %in% developed_countries, ]
df2<- data_new[data_new$Partner_Name %in% developing_countries, ]


df$`AHS_Dutiable_Imports_(US$_Thousand)`[is.na(df$`AHS_Dutiable_Imports_(USD_Thousand)`)] <- 0
df$`Import_(USD_Thousand)`[is.na(df$`Import_(USD_Thousand)`)] <- 0

df2$`AHS_Dutiable_Imports_(US$_Thousand)`[is.na(df2$`AHS_Dutiable_Imports_(USD_Thousand)`)] <- 0
df2$`Import_(USD_Thousand)`[is.na(df2$`Import_(USD_Thousand)`)] <- 0

#log transformation

df$log_import_thousand_y = log(df$`Import_(USD_Thousand)`)
df$log_AHS_Dutiable_imports_X = log(df$`AHS_Dutiable_Imports_(USD_Thousand)`)

df2$log_import_USD_Y = log(df2$`Import_(USD_Thousand)`)
df2$log_AHS_Dutiable_Imports_X_USD = log(df2$`AHS_Dutiable_Imports_(USD_Thousand)`)


model3 <- lm(df$`Export_(USD_Thousand)` ~ df$`AHS_SpecificDuty_Imports(USD_Thousand)` +
               `MFN_Dutiable_Imports_(USD_Thousand)` +
               `AHS_Total_Tariff_Lines` +
               `MFN_Duty_Free_Imports_(USD_Thousand)` +
               `AHS_Dutiable_Imports_(USD_Thousand)` +
               `MFN_SpecificDuty_Imports_(USD_Thousand)` +
               `AHS_Dutiable_Tariff_Lines_Share` +
               `MFN_Dutiable_Tariff_Lines_Share` +
               `AHS_Duty_Free_Tariff_Lines_Share` +
               `AHS_Duty_Free_Imports_(USD_Thousand)` +
               `AHS_Simple_Average`+ df$Year, data = df)

summary(model3)

# Checking for OLS assumptions 

# Check for linearity
plot(model3$fitted.values, model3$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values")

# Check for normality of residuals
hist(model3$residuals, main = "Histogram of Residuals")

# Q-Q plot for normality
qqnorm(model3$residuals)
qqline(model3$residuals)

# Check for homoscedasticity
plot(model3$fitted.values, sqrt(abs(model3$residuals)),
     xlab = "Fitted Values",
     ylab = "Sqrt(|Residuals|)",
     main = "Scale-Location Plot")

# Durbin-Watson test for autocorrelation
library(car)
durbinWatsonTest(model3)

# Plot residuals against time

if ("Year" %in% names(df)) {
  plot(df$Year, model3$residuals,
       xlab = "Year",
       ylab = "Residuals",
       main = "Residuals vs Time")
}

# Modelling for Y as Import and X as independent for developing Countries 

model_import1 <- lm(df$`Import_(USD_Thousand)` ~ df$`AHS_SpecificDuty_Imports(USD_Thousand)` + 
                      `MFN_Dutiable_Imports_(USD_Thousand)` + AHS_Total_Tariff_Lines + 
                      `MFN_Duty_Free_Imports_(USD_Thousand)` + `AHS_Dutiable_Imports_(USD_Thousand)` + 
                      `MFN_SpecificDuty_Imports_(USD_Thousand)` + AHS_Dutiable_Tariff_Lines_Share + 
                      MFN_Dutiable_Tariff_Lines_Share + AHS_Duty_Free_Tariff_Lines_Share + 
                      AHS_Simple_Average + df$Year, data = df )

summary(model_import1)

#Checking for OLS assumptions

plot(model_import1$fitted.values, model_import1$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values")

# Check for normality of residuals
hist(model_import1$residuals, main = "Histogram of Residuals")

# Q-Q plot for normality
qqnorm(model_import1$residuals)
qqline(model_import1$residuals)

# Check for homoscedasticity
plot(model_import1$fitted.values, sqrt(abs(model_import1$residuals)),
     xlab = "Fitted Values",
     ylab = "Sqrt(|Residuals|)",
     main = "Scale-Location Plot")

# Durbin-Watson test for autocorrelation
library(car)
durbinWatsonTest(model_import1)

# Plot residuals against time

if ("Year" %in% names(df)) {
  plot(df$Year, model_import1$residuals,
       xlab = "Year",
       ylab = "Residuals",
       main = "Residuals vs Time")
}




model_developing_1 <- lm(df2$`Export_(USD_Thousand)` ~ df2$`AHS_SpecificDuty_Imports(USD_Thousand)` +
                          `MFN_Dutiable_Imports_(USD_Thousand)` +
                          `AHS_Total_Tariff_Lines` +
                          `AHS_Dutiable_Imports_(USD_Thousand)` +
                          `MFN_SpecificDuty_Imports_(USD_Thousand)` +
                          `AHS_Dutiable_Tariff_Lines_Share` +
                          `MFN_Dutiable_Tariff_Lines_Share` +
                          `AHS_Duty_Free_Tariff_Lines_Share` +
                          `AHS_Duty_Free_Imports_(USD_Thousand)` +
                          `AHS_Simple_Average`+ df2$Year, data = df2)

summary(model_developing_1)

plot(model_developing_1$fitted.values, model_developing_1$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values")

# Check for normality of residuals
hist(model_developing_1$residuals, main = "Histogram of Residuals")

# Q-Q plot for normality
qqnorm(model_developing_1$residuals)
qqline(model_developing_1$residuals)

# Check for homoscedasticity
plot(model_developing_1$fitted.values, sqrt(abs(model_developing_1$residuals)),
     xlab = "Fitted Values",
     ylab = "Sqrt(|Residuals|)",
     main = "Scale-Location Plot")

# Durbin-Watson test for autocorrelation
# Durbin-Watson test for autocorrelation
library(car)
durbinWatsonTest(model_developing_1)

# Plot residuals against time
if ("Year" %in% names(df2)) {
  plot(df2$Year, model_developing_1$residuals,
       xlab = "Year",
       ylab = "Residuals",
       main = "Residuals vs Time")
}

model_import_developing_1 <- lm(df2$`Import_(USD_Thousand)` ~ df2$`AHS_SpecificDuty_Imports(USD_Thousand)` +
                                 `MFN_Dutiable_Imports_(USD_Thousand)` +
                                 `AHS_Total_Tariff_Lines` +
                                 `AHS_Dutiable_Imports_(USD_Thousand)` +
                                 `MFN_SpecificDuty_Imports_(USD_Thousand)` +
                                 `AHS_Dutiable_Tariff_Lines_Share` +
                                 `MFN_Dutiable_Tariff_Lines_Share` +
                                 `AHS_Duty_Free_Tariff_Lines_Share` +
                                 `AHS_Duty_Free_Imports_(USD_Thousand)` +
                                 `AHS_Simple_Average`+ df2$Year, data = df2)

summary(model_import_developing_1)

# Checking for OLS assumptions
plot(model_import_developing_1$fitted.values, model_import_developing_1$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values")

# Check for normality of residuals
hist(model_import_developing_1$residuals, main = "Histogram of Residuals")

# Q-Q plot for normality
qqnorm(model_import_developing_1$residuals)
qqline(model_import_developing_1$residuals)

# Check for homoscedasticity
plot(model_import_developing_1$fitted.values, sqrt(abs(model_import_developing_1$residuals)),
     xlab = "Fitted Values",
     ylab = "Sqrt(|Residuals|)",
     main = "Scale-Location Plot")

# Durbin-Watson test for autocorrelation
library(car)
durbinWatsonTest(model_import_developing_1)

# Plot residuals against time
if ("Year" %in% names(df2)) {
  plot(df2$Year, model_import_developing_1$residuals,
       xlab = "Year",
       ylab = "Residuals",
       main = "Residuals vs Time")
}
