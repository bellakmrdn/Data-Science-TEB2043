scores <- c(33, 24, 54, 94, 16, 89, 
            60, 6, 77, 61, 13, 44, 26, 
            24, 73, 73, 90, 39, 90, 54)

pass <- scores > 49

for (i in 1:length(scores)) {
  cat("Student ", i, ": ", pass[i], "\n")
}
  
A <- sum(scores>=90 & scores<=100)
B <- sum(scores>=80 & scores<=89)
C <- sum(scores>=70 & scores<=79)
D <- sum(scores>=60 & scores<=69)
E <- sum(scores>=50 & scores<=59)
F_score <- sum(scores<=49)

cat(
  "Score\t","Grade\t", "Number of students\n",
  "90-100\t", "A\t", A, "\n",
  "80-89\t", "B\t", B, "\n",
  "70-79\t", "C\t", C, "\n",
  "60-69\t", "D\t", D, "\n",
  "50-59\t", "E\t", E, "\n",
  "<=49\t", "F\t", F_score, "\n"
  )