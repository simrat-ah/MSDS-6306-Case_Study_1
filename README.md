# MSDS 6306 - Doing Data Science

#### Case_Study_1

#### Case study about GDP of the countries, their ranking and the income group they fall in.


# Case Study 1

### GDP (Gross Domestic Product)
**GDP** is the combination of three individual terms Gross, Domestic and Product commonly know as Gross Domestic Product (GDP)
Individually these three terms are summarized as:

**GROSS**: The depreciation in the capital assets of the country, occurred during the year is inclusive. 

**DOMESTIC**: Domestic implies, produced within the geographical boundaries. 

**PRODUCT**: The final goods and services. Final implies that intermediate goods are not taken into account. 

In other words , in a given period of time GDP is the total monetary value of the final goods and services which are produced within the geographical boundaries of any country.

**Data files used for the analysis were downloaded from:**

  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

##### *Raw data has been kept in a folder called "Raw_Data"*

##### *Clean data has been kept in a folder called "Clean_Data"*

###  The purpose of this study is to clean, merge and analyze these data files to answer following questions:

+ Merge the data based on the country short code and find how many of the IDs match?

+ Sort the merged file  in ascending order by GDP  so that United States comes at the last  and to find the 13th country from this merged file , since the file is sorted in ascending order by GDP value (USD) , 13th country will be considered from the top of the sorted data file .

+ The average GDP rankings for the countries which comes under  "High income: OECD" and "High income: nonOECD" groups.

+ Display the distribution of GDP value for all the countries by income group using tools such as ggplot.

+ Provide summary statistics of GDP by income groups.

+ Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 

+ How many countries are Lower middle income but among the 38 nations with highestGDP?

### In order to do find answers for above questions, complete data analysis was done.

##### The project was divided 3 parts and three separate '.R' files were created for : 

+ Data downloading from internet and loading into respective data frames.

+ Merging the data files and the cleanu process was done to get correct results.

+ Complete data anaysis to produce the required results.

**Mother Makefile.R has been created to source the above multiple files and the project can be executed from the single makefile.**

A  markdown file has been created which generates the complete analysis of the project along with the answers to all the asked questions.






