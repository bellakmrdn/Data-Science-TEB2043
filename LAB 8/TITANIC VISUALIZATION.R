#Titanic dataset with visualization

library(dplyr)

titanic <- read.csv("C:/Users/hiday/Documents/DS_TEB2043/LAB 7/titanic.csv")
titanic_cleaned <- na.omit(titanic)

survival_gender <- table(titanic_cleaned$Sex, titanic_cleaned$Survived)

#BarChart
barplot(survival_gender, 
        beside = TRUE, 
        col=c("pink", "lightblue"),
        main = "Survival by Gender",
        xlab = "Gender",
        ylab = "Number of Passengers")

legend("topright", 
       legend = c("Did Not Survive", "Survived"),
       fill = c("pink", "lightblue"))

#PieChart
class_count <- table(titanic_cleaned$Pclass)
pie(class_count,
    main = "Passenger Class Distribution",
    col = rainbow(length(class_count)))

