#load Dataset
data(Theoph)
View(Theoph)
head(Theoph)

#Linear Model
model_theoph <- lm(Dose ~ Wt, data=Theoph)
print(model_theoph)
summary(model_theoph)

#Visualization
plot(Theoph$Wt, Theoph$Dose,
     col = "blue",
     main = "Weight vs Dose Regression",
     xlab = "Weight (kg)",
     ylab = "Dose (mg/kg)")

abline(model_theoph, col = "red")

#Prediction
new_weight <- data.frame(Wt = c(90, 95, 100))
predict(model_theoph, new_weight)

#-----------------------------#
#------- Findings-------------#
#-----------------------------#
#Regression model shows relationship between weight and dose
#Slope indicated how dose changes when weight increases
#Regression line helps estimate does for new weight values

#-----------------------------#
#--- Results of Prediction ---#
#-----------------------------#
#      1        2        3 
#3.037282 2.648249 2.259215 



