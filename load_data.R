# Reading getdata-2Fdata-2FGDP.csv into gdp data frame
gdp <- read.csv("C:\\Users\\sahluwalia\\Desktop\\Simrat\\1-SAP-Proj-Mngt-Data-Sc\\Data-Science\\SMU-Docs\\2.Mahesh-MSDS-6306-Doing-Data-Science\\Case-Study-1\\getdata-2Fdata-2FGDP.csv",sep = ",",header = TRUE,skip = 3,blank.lines.skip = TRUE )

#Reading getdata_data_EDSTATS_Country.csv into country data frame
country <- read.csv("C:\\Users\\sahluwalia\\Desktop\\Simrat\\1-SAP-Proj-Mngt-Data-Sc\\Data-Science\\SMU-Docs\\2.Mahesh-MSDS-6306-Doing-Data-Science\\Case-Study-1\\getdata_data_EDSTATS_Country.csv",sep = ",",header = TRUE,blank.lines.skip = TRUE)
