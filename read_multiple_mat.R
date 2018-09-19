library(R.matlab)
library(readr)
library(ff)
library(ffbase)
library(dplyr)
library(shiny)


#read files from directory into different dataframes
temp <- list.files(path = "/home/naman/R/x86_64-pc-linux-gnu-library/3.4/R.matlab/mat-files",
                   pattern = '^file.*\\.mat$')

temp_incoming <- list()

data1 <- lapply(temp, readMat)
state_data <- data.frame()

setwd("/home/naman/R/x86_64-pc-linux-gnu-library/3.4/R.matlab/mat-files")
for(i in 1:length(temp))
{
  temp_incoming[[i]] <- readMat(temp[i])
}

#assign var names in loop
for(i in 1:21)
{
  state_data <- as.data.frame(temp_incoming[[i]]$state)
  assign(paste('df', i, sep = ''), state_data)
}


#manipulation required with the dfs to restore only the required vars
list_of_dfs_generated <- list



#function to perform on the dfs
extract_clean <- function(x)
{
  df_new <- df %>%
    select(V1, V6, V7) %>%
    rename(time_gen = V1,
           mean_computed = V6,
           sd_computed - V7)
}