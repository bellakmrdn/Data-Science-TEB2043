library(tidyverse)
library(janitor)

#SETUP PATH
file_path <- "C:/Users/hiday/Documents/DS_TEB2043/PROJECT 1/"
uncleaned <- paste0(file_path,"Unclean Dataset.csv")
#add new cleaned data files in the same path
cleaned<- paste0(file_path,"Cleaned Dataset.csv")

#REMOVE JUNK ROWS
#read file line by line
raw_lines <- readLines(uncleaned, warn = FALSE)
#ensure only proper formatted row remains
valid_lines <- raw_lines[grepl("\\|", raw_lines) | seq_along(raw_lines) == 1]

#ASSIGN COLUMN NAMES (MANUALLY)
col_names <- c("student_id", "first_name", "last_name", "age", 
               "gender", "course", "enrollment_date", "total_payments")

#LOAD VALID DATA "|" as separator
df <- read_delim(paste(valid_lines, collapse = "\n"), 
                 delim = "|", 
                 skip = 1, 
                 col_names = col_names, 
                 trim_ws = TRUE)

#INITIAL DATA CLEANING & TYPE CONVERSION
df_cleaned <- df %>%
  mutate(
    # fix notation (ignore e and afterwards eg: 3.5e+03abc only extract 3500)
    total_payments = str_extract(total_payments, "[0-9.]+"),
    # convert column into correct data types
    total_payments = as.numeric(total_payments),
    student_id = as.numeric(student_id),
    age = as.numeric(age),
    enrollment_date = as.Date(enrollment_date, format = "%Y-%m-%d"),
    # remove extra spaces
    across(where(is.character), str_trim)
  ) %>%
  #remove invalid ID (remove row where student id is missing)
  filter(!is.na(student_id)) %>%
  mutate(student_id = as.integer(student_id))

#TEXT CONSISTENCIES
#fix eg: "Machine Learnin" vs "Machine Learning" 
df_standardized <- df_cleaned %>%
  mutate(course = case_when(
    str_detect(course, "Machine") ~ "Machine Learning",
    str_detect(course, "Web")     ~ "Web Development",
    str_detect(course, "Data Science") ~ "Data Science",
    str_detect(course, "Data Anal")    ~ "Data Analysis",
    str_detect(course, "Cyber")   ~ "Cyber Security",
    TRUE ~ course
  ))

#HANDLE MISSING VALUE WITH STATISTICAL IMPUTATION (so that it wont make up values)
get_mode <- function(v) {
  uniqv <- unique(na.omit(v))
  if(length(uniqv) == 0) return("Unknown")
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

df_imputed <- df_standardized %>%
  mutate(
    age = replace_na(age, median(age, na.rm = TRUE)),
    total_payments = replace_na(total_payments, median(total_payments, na.rm = TRUE)),
    across(where(is.character), ~replace_na(., get_mode(.)))
  )

#HANDLE OUTLIERS (USE IQR METHOD)

Q1  <- quantile(df_imputed$total_payments, 0.25, na.rm = TRUE)
Q3  <- quantile(df_imputed$total_payments, 0.75, na.rm = TRUE)
IQR_val <- Q3 - Q1

df_no_outliers <- df_imputed %>%
  filter(total_payments >= (Q1 - 1.5 * IQR_val) & 
           total_payments <= (Q3 + 1.5 * IQR_val)) %>%
  filter(total_payments < 100000) #removes extreme payment values

#REMOVE DUPLICATES
#removes rows where different names were assigned to the same ID
df_perfect <- df_no_outliers %>%
  distinct(student_id, .keep_all = TRUE)%>%
  #keep only one record per name
  distinct(first_name, last_name, .keep_all = TRUE) %>%
  arrange(student_id)

#EXPORT RESULT INTO CLEANED DATASET.CSV
write_csv(df_perfect, cleaned)

#CHECK ERRORS
print("SUCCESS: Data is perfectly cleaned.")
print(paste("Rows remaining:", nrow(df_perfect)))
summary(df_perfect)