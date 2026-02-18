weight <- as.numeric(readline(prompt = "Enter your weight(kg): "))
height_cm <- as.numeric(readline(prompt = "Enter your height(cm): "))
height_m <- height_cm /100
BMI <- weight /(height_m^2)


underweight <- BMI<=18.4
normal <- (BMI>=18.5 && BMI<=24.9)
overweight <- (BMI>=25.0 && BMI <=39.9)
obese <- BMI>=40.0

  
cat(
  "\n",
  "Underweight :", underweight, "\n",
  "Normal :", normal, "\n",
  "Overweight :", overweight, "\n",
  "Obese :", obese, "\n"
)
