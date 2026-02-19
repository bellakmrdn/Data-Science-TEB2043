V1 <- c(2,3,1,5,4,6,8,7,9)
matrix1 <- matrix(V1, nrow=3, byrow=TRUE)
rownames(matrix1)<-c("row1","row2","row3")
colnames(matrix1)<-c("column1","column2","column3")
print(matrix1)

matrix2 <- t(matrix1)
rownames(matrix2)<-c("row1","row2","row3")
colnames(matrix2)<-c("column1","column2","column3")
print(matrix2)

addition <- matrix1 + matrix2
subtraction <- matrix1 - matrix2
multiply <- matrix1 * matrix2
division <- matrix1 / matrix2

cat("Addition\n")
print(addition)
cat("\nSubtraction\n")
print(subtraction)
cat("\nMultiplication\n")
print(multiply)
cat("\nDivision\n")
print(division)