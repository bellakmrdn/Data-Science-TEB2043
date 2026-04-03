#Load packages and library
install.packages("e1071")
install.packages("caTools")
install.packages("class")
library(e1071)
library(caTools)
library(class)

#Load dataset ChickWeight
data(ChickWeight)
View(ChickWeight)
head(ChickWeight)

#Split data
set.seed(123)
split <- sample.split(ChickWeight$Diet, SplitRatio= 0.7)
train <- subset(ChickWeight, split==TRUE)
test <- subset(ChickWeight, split==FALSE)

#Scale Features
train_scale <- scale(train[, c("weight", "Time")])
test_scale <- scale(test[, c("weight", "Time")])

#K=1
knn1 <- knn(train = train_scale,
            test = test_scale,
            cl = train$Diet,
            k=1)

#K=3
knn3 <- knn(train = train_scale,
            test= test_scale,
            cl=train$Diet,
            k=3)

#K=5
knn5 <- knn(train = train_scale,
            test = test_scale,
            cl=train$Diet,
            k=5)

#K=7
knn7 <- knn(train = train_scale,
            test = test_scale,
            cl=train$Diet,
            k=7)

# Calculate error
error_k1 <- mean(knn1 != test$Diet)
error_k3 <- mean(knn3 != test$Diet)
error_k5 <- mean(knn5 != test$Diet)
error_k7 <- mean(knn7 != test$Diet)

# Calculate accuracy
accuracy_k1 <- 1 - error_k1
accuracy_k3 <- 1 - error_k3
accuracy_k5 <- 1 - error_k5
accuracy_k7 <- 1 - error_k7


# Create comparison table
comparison_table <- data.frame(
  K = c(1, 3, 5, 7),
  Misclassification_Error = c(error_k1, error_k3, error_k5, error_k7),
  Accuracy = c(accuracy_k1, accuracy_k3, accuracy_k5, accuracy_k7)
)


comparison_table

#Confusion matrix for best K: best k=5
table(test$Diet, knn5)

#-----------------------------------#
#--- Confusion Matrix Discussion ---#
#-----------------------------------#

#Model performs best in predicting Diet 1 with 41 correct classifications
#several observations from Diet 2, Diet 3, and Diet 4 were misclassified into other diet categories
#Means that ome diet groups have overlapping characteristics based on weight and time, making classification difficult.
