library(dplyr)
library(xlsx)

titanic <- read.csv("C:/Users/hiday/Documents/DS_TEB2043/LAB 7/titanic.csv")
  
View(titanic)

#Identify missing values
sum(is.na(titanic))
which(is.na(titanic))
print(sapply(titanic, function(x) sum(is.na(x))))

#Cleaning the dataset
titanic_cleaned <- na.omit(titanic)

#Compare dimension before and after cleaning
dim(titanic)
dim(titanic_cleaned)

#Identify column names
colnames(titanic_cleaned)

#Surviv(al by gender
female_survival <- titanic_cleaned %>% filter(Sex=="female") %>% summarise(rate = mean(Survived) * 100)
male_survival <- titanic_cleaned %>% filter(Sex=="male") %>% summarise(rate=mean(Survived)*100)
female_survival
male_survival

#Survival by passenger class
class_survival <- titanic_cleaned%>%group_by(Pclass)%>%summarise(rate=mean(Survived)*100)
class_survival

#Survival by embark location
embark_survival <- titanic_cleaned %>% group_by(Embarked)%>%summarise(rate=mean(Survived)*100)
embark_survival

#High fare passengers
high_fare <- filter(titanic_cleaned, Fare >100)
high_fare

#Female passengers with high fare
female_highfare <- filter(titanic_cleaned, Sex =="female" & Fare>100)
female_highfare

#Sort fare descending
fare_sorted <- arrange(titanic_cleaned, desc(Fare))
head(fare_sorted)

#Average age
mean(titanic_cleaned$Age)

#Export results
write.csv(class_survival, "class_survival_report.csv)
