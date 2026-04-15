# Data Science: R Programming
# Week 1 Quiz

# read file
hw1 <- read.csv("R Programming/Week 1/hw1_data.csv")

# what are the column names
names(hw1)

# extract first two rows
hw1[1:2, ]

# how many Rows
nrow(hw1)

# extract last two rows of data frame
hw1[152:153, ]

# extract the value for Ozone for row 47
hw1$Ozone[47]

# how many NA values in Ozone variable
is.na(hw1$Ozone)
sum(is.na(hw1$Ozone))

# what is the mean of the values in Ozone excluding NA values
mean(hw1$Ozone, na.rm = TRUE)

# Extract the subset of rows of the data frame where Ozone values are > 31 
# and Temp values are above 90. What is the mean of Solar.R in this subset?
subset <- hw1[hw1$Ozone > 31 & hw1$Temp > 90, ]
mean(subset$Solar.R, na.rm = TRUE)

# What is the mean of Temp when Month is equal to 6?
subset_month <- hw1[hw1$Month == 6, ]
mean(subset_month$Temp, na.rm = TRUE)
# or in one line
mean(hw1[hw1$Month == 6, "Temp"], na.rm = TRUE)

# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(hw1[hw1$Month == 5, "Ozone"], na.rm = TRUE)







