library(readxl)
library(ggplot2)
library(tidyr)
library(ggthemes)
library(reshape2)

SaciLipid <- as.data.frame(read_excel("C:/Users/Alec/Downloads/SacidocaldariusBatchGrowthCurves_ABC10-24.xlsx", sheet = "Sheet2"))
SaciGrowth <- as.data.frame(read_excel("C:/Users/Alec/Downloads/SacidocaldariusBatchGrowthCurves_ABC10-24.xlsx", sheet = "Sheet1"))
SaciMeltedLipid <- melt(SaciLipid, id=c("ShakingSpeed", "pH", "Temp"))
subsettedMelt <- subset( SaciMeltedLipid, (variable == "RI1") |(variable == "RI2") |(variable == "RI3") |(variable == "RI4") | (variable == "RI5"))

pHRIdata <- subset (subsettedMelt, ShakingSpeed == "200" & Temp == "70")
TempRIdata <- subset (subsettedMelt, pH == "3" & ShakingSpeed == "200")
ShakingRIData <- subset(subsettedMelt, Temp == "70" & pH =="3")


tempPlot <- ggplot(TempRIdata, aes(x = as.factor(Temp), y = value, fill = as.factor(Temp))) +
                    geom_boxplot()
print(tempPlot)

pHPlot <- ggplot(pHRIdata, aes(x = as.factor(pH), y = value, fill = as.factor(pH)) +
  geom_boxplot()
print(pHPlot)

ShakingPlot <- ggplot(ShakingRIData, aes(x = as.factor(ShakingSpeed), y = value, fill = as.factor(ShakingSpeed))) +
  geom_boxplot()
print(ShakingPlot)

