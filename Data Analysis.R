# Basic Data Analysis
# Summary Statistics

setwd("D:/Fiverr Related Work/DA")   # this sets the working directory

mydata <- read.csv("diabetes.csv")   # open file from current working directory

View(mydata)

# HELP
?functonName

# Summary Statistics of all variables in dataset
summary(mydata)
cor(mydata)

# Summary Statistics for selected variables
# option 1
summary(mydata[c("Pregnancies", "Outcome")])
cor(mydata[c("Pregnancies", "Outcome")])
cor(mydata[c("Pregnancies", "Age", "Outcome")])

# option 2 using subsets
mydata.subset1 <-subset(mydata, select = c("Pregnancies", "Outcome"))
summary(mydata.subset1)
cor(mydata.subset1)

# using subsets of rows of data
mydata.subset2 <-subset(mydata, Age > 35)
cor(mydata.subset2[c("Pregnancies", "Outcome")])

mydata.subset3 <-subset(mydata, Age > 35, select = c("Pregnancies", "Outcome"))
summary(mydata.subset2)
cor(mydata.subset2)


# More Summary Stats
## Categorical Variables
library(mosaic)   # for tally function
tally(~Outcome, data=mydata, margins=TRUE)   # count
tally(~Outcome, data=mydata, margins=TRUE, format = "perc")
tally(~Outcome, data=mydata, margins=TRUE, format = "prop")



# Contingenct Table
tally(~Pregnancies+Outcome, data=mydata, margins=TRUE)   # count


# Conditional Table
tally(~Outcome|Pregnancies>=5, data=mydata, margins=TRUE, format = "prop")   # count


# Continuous Variables
mean(Age)
mean(~Age)
mean(~Age, data=mydata, na.rm=TRUE)    #na.rm means remove missing cells


favstats(~Age, data=mydata)
favstats(~BMI, data=mydata)


## Apply this to several variables
mydata.sub3 <- subset(mydata, select = c("Age", "BMI", "Outcome"))
dfapply(mydata.sub3,favstats)

# for all variables
dfapply(mydata,favstats)