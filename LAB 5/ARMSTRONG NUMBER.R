num <- as.integer(readline(prompt = "Input an integer: "))
num_digits <- nchar(as.character(num)) #number of digits
sum <- 0 

for ( i in 1:num_digits){
  digit <- as.integer(substr(as.character(num),i,i))
  sum <- sum + (digit^num_digits)
}

if (sum == num){
  cat("Check whether an n digits numbers is Armstrong or not: ")
  cat("\n-------------------------------------------------------\n")
  cat(num," is an Armstrong number.")
}else{
  cat("Check whether an n digits numbers is Armstrong or not: ")
  cat("\n-------------------------------------------------------\n")
  cat(num," is not an Armstrong number.")
}

