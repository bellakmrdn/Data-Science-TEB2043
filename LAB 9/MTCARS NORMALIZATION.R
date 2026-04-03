#Load dataset
data(mtcars)
View(mtcars)

#log transformation
mydata <- mtcars$mpg
scaled_log <- log(mydata)
summary(scaled_log)

#Standard scaling
scaled_std <- as.data.frame(scale(mydata))
summary(scaled_std)

#Min-Max Scaling
library(caret)
minmax <- preProcess(as.data.frame(mydata), method = c("range"))
scaled_minmax <- predict(minmax, as.data.frame(mydata))
summary(scaled_minmax)

#Comparing raw VS normalized
summary(mydata)
summary(scaled_log)
summary(scaled_std)
summary(scaled_minmax)

#Histogram comparison before and after
hist(mydata, main = "Original MPG")
hist(scaled_log, main = "Log MPG")

#-----------------------------#
#------- Findings-------------#
#-----------------------------#
#Raw data: original mpg values remain in actual unit
#Log Transformation: Compresses large values and reduces skewness
#Standard scaling: Mean becomes approx 0 and std deviation becomes 0
#Min-max scaling: values coverted between 0-1


