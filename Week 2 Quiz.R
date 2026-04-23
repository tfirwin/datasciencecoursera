# Week 2 Quiz

#1
pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_values <- c()               
  for (i in id) {
    filepath <- paste0(directory, "/", sprintf("%03d.csv", i))
    data <- read.csv(filepath)     
    all_values <- c(all_values, data[[pollutant]])
  }
  mean(all_values, na.rm = TRUE)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)

# 2
complete <- function(directory, id = 1:332) {
  ids <- c()
  nobs <- c()
  for (i in id) {
    filepath <- paste0(directory, "/", sprintf("%03d.csv", i))
    data <- read.csv(filepath)
    nobs <- c(nobs, sum(complete.cases(data)))
    ids <- c(ids, i)
  }
  data.frame(id = ids, nobs = nobs)
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)

# 3
corr <- function(directory, threshold = 0) {
  correlations <- c()
  for (i in 1:332) {
    filepath <- paste0(directory, "/", sprintf("%03d.csv", i))
    data <- read.csv(filepath)
    nobs <- sum(complete.cases(data))
    if (nobs > threshold) {
      good <- data[complete.cases(data), ]
      correlations <- c(correlations, cor(good$sulfate, good$nitrate))
    }
  }
  correlations
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
length(cr)  

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))