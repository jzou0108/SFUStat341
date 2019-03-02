#loading data from package
library(car)
data("Davis")

#Adding transformed variables to a data frame
BMI = with(Davis, weight/(height/100)^2)
BMI = Davis$weight/((Davis$height/100)^2)
Davis = transform(Davis, BMI = weight/((height/100)^2))

library(dplyr)
Davis %>%
  mutate(heightm = height/100) %>%
  mutate(BMI = weight/(height/100)^2) -> Davis

BMIcat = cut(Davis$BMI, breaks = c(15.8, 18.5, 25,30,36.8))
Davis = transform(Davis, BMIcat = cut(Davis$BMI, breaks = c(15.8, 18.5, 25,30,36.8)))

BMIlabel = recode(BMIcat, '(15.8,18.5]' = 'underweight', '(18.5,25]' = 'normal', '(25,30]' = 'overweight', '(30,36.8]' = 'obese')
Davis = transform(Davis, BMIlabel = recode(BMIcat, '(15.8,18.5]' = 'underweight', '(18.5,25]' = 'normal', '(25,30]' = 'overweight', '(30,36.8]' = 'obese')
)
