library(R.matlab)
library(readr)
library(ff)
library(ffbase)
library(dplyr)
library(shiny)


#read files from directory into different dataframes
temp <- list.files(path = "/usr/local/lib/R/site-library/R.matlab/mat-files/",
                                              pattern = '^file.*\\.mat$')
#temp <- list.files(path = "/home/naman/R/x86_64-pc-linux-gnu-library/3.4/R.matlab/mat-files",
#                   pattern = '^file.*\\.mat$')

temp_incoming <- list()

data1 <- lapply(temp, readMat)
state_data <- data.frame()

#setwd("/home/naman/R/x86_64-pc-linux-gnu-library/3.4/R.matlab/mat-files")
setwd("/usr/local/lib/R/site-library/R.matlab/mat-files/")
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
list_of_dfs_generated <- names(which(unlist(eapply(.GlobalEnv,is.data.frame))))

list_of_dfs_generated <- as.list(list_of_dfs_generated)

#function to perform on the dfs
extract_clean <- function(x)
{ x <- select(x, V1, V6, V7) 
  #x <- rename(x, time_gen = V1, mean_computed = V6, sd_computed = V7)
}

#df[] <- lapply(df, tolower)

df1[] <- lapply(df1, extract_clean)



