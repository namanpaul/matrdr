#mat files analyses
#namanpaul
#2018-09-05

#installing/loading required packages
#install.packages("R.matlab")
#install.packages("Boruta")
#install.packages("caret")
library(caret)
library(Boruta)
library(R.matlab)
library(readr)
library(ff)
library(ffbase)
library(dplyr)


#read file structure based on the manual
path <- system.file("mat-files", package="R.matlab")
pathname <- file.path(path, "file1.mat")
data_mat <- readMat(pathname)
print(data_mat)

#converting the list into a df
#head of state
state_data <- as.data.frame(data_mat$state)

#removing the V1 from the var list
state_data <- state_data %>%
  select(-V1)


#head of discParam
head(data_mat$discrParam)



