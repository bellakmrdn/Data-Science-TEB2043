array1 <- array(1:24, dim=c(2,4,3))
cat("Array 1\n")
print(array1)

array2 <- array(25:54, dim=c(3,2,5))
cat("\nArray 2\n")
print(array2)

cat("The second row of the second matrix of the array:",array1[2,,2])
cat("The element in the 3rd row and 3rd column of the 1st matrix:", array2[3,2,1])
