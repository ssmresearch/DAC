# Een iets uitgebreider voorbeeld

rm(list=ls())

wine <- read.csv("https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/whitewines.csv")

str(wine)

(n <- nrow(wine) )                   # bepaal aantal observeringen
set.seed(789)
train_steekproef <- sample(n,0.80*n) # trek een steekproef van 80%
str(train_steekproef)                # laat de structuur van de vector zien

wine_train <- wine[train_steekproef,]
wine_test  <- wine[-train_steekproef,]

library(rpart)

m <- rpart(quality ~ .,data=wine_train)

m
summary(m)

# install.packages("rpart.plot")
library(rpart.plot)

rpart.plot(m, digits=2,fallen.leaves=TRUE)

p <- predict(m,wine_test)

summary(p)

cor(p,wine_test$quality)

# Simple Scatterplot
plot(wine_test$quality, p, main="Scatterplot",xlab="Quality", ylab="Predicted")