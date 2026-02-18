name <- toupper(readline(prompt = "Enter your name: "))
phone_num <- readline(prompt = "Enter your phone number: ")


first3 <- substr(phone_num, 1, 3)
last4 <- substr(phone_num, nchar(phone_num)-3, nchar(phone_num))

masked <- paste0(first3, "-XXXXX ", last4)
cat("Hi,", name, ". A verification code has been sent to", masked, "\n")

