age <- c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)
factor_age <- factor(age)
table(factor_age)
age_count <- as.data.frame(table(factor_age))
colnames(age_count) <- c("Staff Age", "Total number of staff")
print(age_count)

age_range <- cut(age, breaks = c(50,52,54,56,58,60), include.lowest=TRUE, right=TRUE)
table(age_range)
age_range <- cut(age,
                 breaks = c(50,52,54,56,58,60),
                 labels = c("50-52","52-54","54-56","56-58","58-60"),
                 include.lowest=TRUE)

range_count <- as.data.frame(table(age_range))
colnames(range_count) <- c("Age Range", "Total number of staff")
print(range_count)
