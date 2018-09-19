#mat files analyses
#namanpaul
#2018-09-05

#installing/loading required packages
#install.packages("R.matlab")
#install.packages("Boruta")
#install.packages("caret")
#library(caret)
#library(Boruta)
library(R.matlab)
library(readr)
library(ff)
library(ffbase)
library(dplyr)


#read file structure based on the manual
path <- system.file("mat-files", package="R.matlab")
#pathname <- file.path(path, "file2_r = 2.285, DC = 1.0, DD = 1.0, AC = 0.0, AD = 0.0, RC = 0.0, RD = 0.0.mat")
#data_mat <- readMat(pathname)
#print(data_mat)

#converting the list into a df
#head of state
state_data_1 <- as.data.frame(data_mat$state)

#removing the V1 from the var list
state_data <- state_data %>%
  select(-V1)


#head of discParam
head(data_mat$discrParam)



#attempting to store the list of files in a temp var
#home machine
#temp_var <- list.files(path = "/usr/local/lib/R/site-library/R.matlab/mat-files/",
#                       pattern = "*.mat")

#thinkpad
temp_var <- list.files(path = "/home/naman/R/x86_64-pc-linux-gnu-library/3.4/R.matlab/mat-files",
                       pattern = "*.mat")

#reading each of the files into a separate df
pathname10 <- file.path(path, temp_var[7]) 

data10 <- readMat(pathname10)

#converting the list into a df
state_data_10 <- as.data.frame(data10$state)


#11
#reading each of the files into a separate df
pathname11 <- file.path(path, temp_var[8]) 

data11 <- readMat(pathname11)

#converting the list into a df
state_data_11 <- as.data.frame(data11$state)


#12
pathname12 <- file.path(path, temp_var[9]) 

data12 <- readMat(pathname12)

#converting the list into a df
state_data_12 <- as.data.frame(data12$state)


#13
pathname13 <- file.path(path, temp_var[10]) 

data13 <- readMat(pathname13)

#converting the list into a df
state_data_13 <- as.data.frame(data13$state)

#14
pathname14 <- file.path(path, temp_var[11]) 

data14 <- readMat(pathname14)

#converting the list into a df
state_data_14 <- as.data.frame(data14$state)

#15
pathname15 <- file.path(path, temp_var[12]) 

data15 <- readMat(pathname15)

#converting the list into a df
state_data_15 <- as.data.frame(data15$state)

#16
pathname16 <- file.path(path, temp_var[13]) 

data16 <- readMat(pathname16)

#converting the list into a df
state_data_16 <- as.data.frame(data16$state)

#17
pathname17 <- file.path(path, temp_var[14]) 

data17 <- readMat(pathname17)

#converting the list into a df
state_data_17 <- as.data.frame(data17$state)

#18
pathname18 <- file.path(path, temp_var[15]) 

data18 <- readMat(pathname18)

#converting the list into a df
state_data_18 <- as.data.frame(data18$state)

#19
pathname19 <- file.path(path, temp_var[16]) 

data19 <- readMat(pathname19)

#converting the list into a df
state_data_19 <- as.data.frame(data19$state)

#1
pathname1 <- file.path(path, temp_var[18]) 

data1 <- readMat(pathname1)

#converting the list into a df
state_data_1 <- as.data.frame(data1$state)

#20
pathname20 <- file.path(path, temp_var[19]) 

data20 <- readMat(pathname20)

#converting the list into a df
state_data_20 <- as.data.frame(data20$state)

#21
pathname21 <- file.path(path, temp_var[20]) 

data21 <- readMat(pathname21)

#converting the list into a df
state_data_21 <- as.data.frame(data21$state)

#2
pathname2 <- file.path(path, temp_var[22]) 

data2 <- readMat(pathname2)

#converting the list into a df
state_data_2 <- as.data.frame(data2$state)

#3
pathname3 <- file.path(path, temp_var[23]) 

data3 <- readMat(pathname3)

#converting the list into a df
state_data_3 <- as.data.frame(data3$state)

#4
pathname4 <- file.path(path, temp_var[24]) 

data4 <- readMat(pathname4)

#converting the list into a df
state_data_4 <- as.data.frame(data4$state)

#5
pathname5 <- file.path(path, temp_var[25]) 

data5 <- readMat(pathname5)

#converting the list into a df
state_data_5 <- as.data.frame(data5$state)

#6
pathname6 <- file.path(path, temp_var[26]) 

data6 <- readMat(pathname6)

#converting the list into a df
state_data_6 <- as.data.frame(data6$state)

#7
pathname7 <- file.path(path, temp_var[27]) 

data7 <- readMat(pathname7)

#converting the list into a df
state_data_7 <- as.data.frame(data7$state)

#8
pathname8 <- file.path(path, temp_var[28]) 

data8 <- readMat(pathname8)

#converting the list into a df
state_data_8 <- as.data.frame(data8$state)

#9
pathname9 <- file.path(path, temp_var[29]) 

data9 <- readMat(pathname9)

#converting the list into a df
state_data_9 <- as.data.frame(data9$state)







#lapply to preserve only required vars
library(dplyr)
restore_vars <- function(x) { 
  x <- x %>%       
    select(V1, V6, V7) %>%
    rename(time = V1,
           mean_val = V6,
           std_dev_val = V7)
}           

#pipe a list of data frames to the function:
#list of df names 


restore_vars(state_data_1)


dfnames <- as.list(Filter(function(x) class(get(x))=='data.frame', ls(env=globalenv())))



  result <- list(state_data_1, state_data_10) %>%
  
dfnames <- list(dfnames)

  lapply(state_data_1, restore_vars)
  