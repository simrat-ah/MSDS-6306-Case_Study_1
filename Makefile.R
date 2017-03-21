## MSDS 6306 Doing Data Science
## Case Study 1
## Case study about GDP of the country their ranking and the income group hey fall in.
## This make fils is the mother file to call other sources to execute the complete analysis done on this case study.

# Packages required 

#install.packages("dplyr")
#install.packages("reshape2")
#install.packages("ggplot2")
# install.packages("RCurl")
#require(plyr)
#require(scales)
#install.packages("sqldf")
#install.packages("tcltk")

# Including the above packages
require(ggplot2)
require(RCurl)
require(plyr)
require(scales)
library(RCurl)
library(dplyr)
library(reshape2)
library(plyr)
require(knitr)
library(sqldf)
library(tcltk)

# Following blank columns were removed from gdpData data file : X.1,X.4,X.5,X.6,X.7 and X.8 
# Following columns were renamed in gdp data file:
# column 'X' was renamed to Countrycode
# Column 'Gross.domestic.product2012' was renamed to Ranking
# Column 'X.2' was renamed to Economy_name
# Column 'X.3' was renamed to USD_in_Millions

# Following column was renamed in CountryData data file:
# Column 'Income.Group' was renamed to Income_group

# gdpData and CountryData files were merged into one file called mergedata1 and 
# following columns were used from  the merged file ( mergedata1) for further data analysis
# CountryCode
# Ranking
# Economy_Name
# USD_in_Millions
# Income_group


# load_data.R will retrieve the Raw data files from the internet and upload them in the projects Data folder.
source("load_data.R")

#clean_and_merge_data.R will do the cleanup and merge the 2 data files. 
source("clean_and_merge_data.R")

#data_analysis.R will do the rest of the analysis on the merged file and generate answers to project questions.
source("data_analysis.R")

