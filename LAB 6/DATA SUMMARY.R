#Activity1
student.data <- data.frame(
  name = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas"),
  score = c(12.5,9.0,16.5,12.0, 9.0, 8.0,19.0),
  attempts = c(1,3,2,3,2,1,2)
)
print(student.data)

#Activity2 : Continue from Activity1
student.data$qualify <- c("yes", "no", "yes", "no", "no","no", "yes")
print(student.data)

#Activity3 : Continue from Activity2
student.newdata <- data.frame(
  name = c("Emily"),
  score = c(14.5),
  attempts = c(1),
  qualify = c("yes")
)
student.finaldata <- rbind(student.data, student.newdata)
print(student.finaldata)

#Activity4 : Continue from Activity3
#Converting qualify into factor to count how many yes and no
student.finaldata$qualify <- as.factor(student.finaldata$qualify)
str(student.finaldata)
print(summary(student.finaldata))
print(dim(student.finaldata))
print(nrow(student.finaldata))
print(ncol(student.finaldata))


