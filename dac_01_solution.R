setwd("C:\\04. HAN\\DAC")

# Ons eenvoudige voorbeeld ...

rm(list=ls())
decision <- c("n","y","y","y","y","n","y","n","n","y","n","y") # "Vector"
head     <- c("s","r","s","s","s","r","s","s","s","s","s","r")
body     <- c("r","r","s","s","s","s","s","r","r","s","r","r")
color    <- c("w","g","w","w","w","g","w","w","w","w","w","w")

(ourData <- as.data.frame(cbind(decision,head,body,color)))    # Vectoren aan elkaar plakken
str(ourData)

ourData$decision <- as.factor(ourData$decision)
ourData$head     <- as.factor(ourData$head)
ourData$body     <- as.factor(ourData$body)
ourData$color    <- as.factor(ourData$color)

# install.packages("C50") ## Hoeft maar een keer ...
library(C50)

model <- C5.0(ourData[-1],ourData$decision)
summary(model)

model
plot(model)

# Frazen's example

rm(list=ls())

library(foreign)
fd <- read.dta("frazen_12.dta",convert.factors=TRUE)

# install.packages("rpart")
library(rpart)
fm <- rpart(servicelevel ~ dominick+foodgroc+landmarket+mango+cpower+pet,data=fd)

fm; summary(fm)

# install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(fm, digits=2)

# Frazen (II)

rm(list=ls())
fd2 <- read.dta("frazen2_12.dta",convert.factors=TRUE)
fm2 <- rpart(servicelevel ~ dominick+foodgroc+landmarket+mango+cpower+pet,data=fd2)
rpart.plot(fm2, digits=2)


