
#------------------Clean Up and merge data raw data files ----------------------

# Deleting X.1,X.4,X.5,X.6,X.7 and X.8 blank columns from gdp dataframe.
gdp <- subset(gdp,select =-c(X.1,X.4,X.5,X.6,X.7,X.8))

# Replacing following column name to give them more meaningful names

# Replacing the blank column name with 'CountryCode'
colnames(gdp)[1] <- 'CountryCode'
# Replacing the 2nd column name with 'Ranking'
colnames(gdp)[2] <- 'Ranking'
# Replacing Economy with Economy_name
colnames(gdp)[3] <- 'Economy_Name'
# Replacing US.dollars. with USD_in_Millions
colnames(gdp)[4] <- 'USD_in_Millions'

# Income.Group as Income_Group
colnames(country)[3] <- 'Income_Group'

#  Merged data frames 'gdp' and 'country' on columan 'CountryCode'   [ key (by) = CountryCode ]

# 1 -> Merged data frame of above 2 data frames, key (by) = CountryCode 
mergedata1 <- merge(x=gdp, y=country, by = "CountryCode", all = TRUE, incomparables = TRUE )

# Removing records having 'NA' or spaces from columns CountryCode and Ranking 
mergedata1 <- mergedata1[!(is.na(mergedata1$CountryCode)| mergedata1$CountryCode=="" | is.na(mergedata1$Ranking) | mergedata1$Ranking==""),]
cat("\n")
cat("   Data was merged based on the country shortcode and total of ", as.vector(dim(mergedata1))[1] ,"IDs were matched \n")
# no_Income_Group <- sqldf("select CountryCode,Ranking,Economy_Name,USD_in_Millions,Income_Group from mergedata1 where Income_Group is NULL")

# To find if there are any countries with no Income Group associated to them.
cat("   Following Country(s) does not have any Income Groups associated with them  \n\n")


#a <-as.vector(mergedata1[is.na(mergedata1$Income_Group),])
#as.vector(a[1,])

sqldf("select CountryCode,Ranking,Economy_Name,USD_in_Millions,Income_Group from mergedata1 where Income_Group is NULL")


# Removing records having 'NA' or spaces from column Income Group
mergedata1 <- mergedata1[!(is.na(mergedata1$Income_Group)| mergedata1$Income_Group==""),]
cat("   After cleaning the data with missing values in Country Code, Ranking, Economy Name, GDP(in USD) and Income Group , -> ", as.vector(dim(mergedata1))[1] ,"IDs were matched \n")

#convert Ranking and US.dollars. from factor to numeric
mergedata1$Ranking <- as.numeric(gsub(",", "", mergedata1$Ranking))
mergedata1$USD_in_Millions <- as.numeric(gsub(",", "", mergedata1$USD_in_Millions))

# dimensions of the cleaned data (mergedata1)
dim(mergedata1)
cat("\n")
cat("   Data was merged based on the country shortcode and total of ", as.vector(dim(mergedata1))[1] ,"IDs were matched \n")
