string_1 <- tolower(readline(prompt = "Enter string 1: "))
string_2 <- tolower(readline(prompt = "Enter string 2: "))

similar <- (string_1 == string_2)
cat("This program compare 2 strings. Both inputs are similar:",similar)
