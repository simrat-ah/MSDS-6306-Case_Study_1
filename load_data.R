library(sqldf)
# Setting the working drectory 

#Setting the working directory as current directory
setwd('.')
#Displaying the current working directory
getwd()

# Saving data files URL's in variables.
gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
CountryURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

# Downloading GDP data file and Country Stats data csv files.
download.file(gdpURL, destfile = "./Raw_Data/gdpData.csv" )
download.file(CountryURL, destfile = "./Raw_Data/CountryData.csv")

# Reading getdata-2Fdata-2FGDP.csv into gdp data frame
gdp <- read.csv(".\\Raw_Data\\gdpData.csv")
#Reading getdata_data_EDSTATS_Country.csv into country data frame
country <- read.csv(".\\Raw_Data\\CountryData.csv")
