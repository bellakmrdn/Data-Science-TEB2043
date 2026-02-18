students <- list(
  Robert = list(Chemistry = 59, Physics = 59),
  Hemsworth = list(Chemistry = 89, Physics = 71),
  Scarlett = list(Chemistry = 86, Physics = 83),
  Evans = list(Chemistry = 65, Physics = 68),
  Pratt = list(Chemistry = 52, Physics = 65),
  Larson = list(Chemistry = 60, Physics = 57),
  Holland = list(Chemistry = 67, Physics = 62),
  Paul = list(Chemistry = 40, Physics = 92),
  Simu = list(Chemistry = 77, Physics = 92),
  Renner = list(Chemistry = 90, Physics = 59)
)

# Extract Chemistry and Physics scores as named vectors
chem_scores <- sapply(students, function(x) x$Chemistry)
phys_scores <- sapply(students, function(x) x$Physics)

# Count failed students
fail_chem <- sum(chem_scores <= 49)
fail_phys <- sum(phys_scores <= 49)

# Highest scores
max_chem <- max(chem_scores)
max_phys <- max(phys_scores)

students_max_chem <- names(chem_scores[chem_scores == max_chem])
students_max_phys <- names(phys_scores[phys_scores == max_phys])

# Print results
cat(
  "\n",
  "Number of students failing Chemistry:", fail_chem, "\n",
  "Number of students failing Physics:", fail_phys, "\n",
  "Highest Chemistry score:", max_chem, "by", paste(students_max_chem, collapse=" & "), "\n",
  "Highest Physics score:", max_phys, "by", paste(students_max_phys, collapse=" & "),"\n"
)

#collapse = combine multiple items (if more than 1)
#sapply = apply f(x) to each item in list, write automatically instead of loop
#function (x) = used inside sapply
#x$ = "give me element from this list"
#names = built-in function; gets & sets the names of a list/vector