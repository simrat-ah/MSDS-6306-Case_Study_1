
#--- Q2 
#    Sort the data frame in ascending order by GDP (so United States is last).
#    Find the 13th country (descending order)

mergedata1 <- mergedata1[order(mergedata1$USD_in_Millions, decreasing = FALSE, na.last=NA),]
# After data cleanup and sorting on USD_in_Millions (countries GDP in millions), 
# here is the snapshot of the selective cleaned data.
# Top 10 records of the cleaned data in decreasing order of their GDP and Rank
# Their Country code, Rank, Name, GDP In Millions and their Income Group (in decreasing order of their GDP and Rank)
headofmergedata1 <- head(mergedata1[,c("CountryCode","Ranking","Economy_Name","USD_in_Millions","Income_Group")],10)
print(headofmergedata1)
cat("\n")
# Bottom 10 records with their Country code, Rank, Name, GDP In Millions and their Income Group 
# File is sorted in the decreasing order of their GDP and ranking thats why highest GPS and Rank is at the bottom.
tailofmergedata1 <- tail(mergedata1[,c("CountryCode","Ranking","Economy_Name","USD_in_Millions","Income_Group")],10)
print(tailofmergedata1)
cat("\n")
# Writing output to a CSV file
write.csv(mergedata1, file = ".\\Clean_data\\mergedata1.csv")

#--How many total Ranking Countries ?
cat ("   Total number of Ranking countries  are -> ", nrow(mergedata1),"\n")

#--Which Country is the 13th Country from top decreasing order
cat("   13th Country in the cleaned data file with decreasing order in GDP and Ranking is -> ",as.vector(mergedata1$Economy_Name[13])," \n") 
cat("\n")

#--- Q3 
#    Average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups
# Sub setting highIncomeOECD group from mergedata1 
highIncomeOECD <- subset(mergedata1,mergedata1$Income_Group=="High income: OECD")

# Storing Mean of highIncomeOECD$Ranking
highIncomeOECDRanking <-mean(highIncomeOECD$Ranking)

# Sub setting highIncomeNonOECD group from mergedata1
highIncomeNonOECD <- subset(mergedata1,mergedata1$Income_Group=="High income: nonOECD")

# Storing Mean of highIncomeNonOECD$Ranking
highIncomeNonOECDRanking<-mean(highIncomeNonOECD$Ranking)
cat("   Average GDP rankings for the High income:    OECD group = ",highIncomeOECDRanking,"\n")
cat("   Average GDP rankings for the High income: nonOECD group = ",highIncomeNonOECDRanking,"\n\n")

#--- Q4
#    Plot the GDP for all of the countries. Used ggplot2 to color plot by Income Group.
#    There was one record with Income_Groups column has "NA" in it 
#    below syntax is to remove the "NA" and create groupwise bar chart  [different color represent different group]

ggplot(mergedata1,aes(x=Income_Group, y=USD_in_Millions,group_by(mergedata1$Income_Groups)))+ geom_bar(aes(fill=mergedata1$Income_Group), stat = "identity") + scale_fill_brewer(palette="Set2") + theme( axis.text.x=element_text(angle=90)) +scale_y_continuous(labels = comma)

#--- Q5
#   Summary statistics of GDP by Income Group
#   Subsetting the Income Groups to generate summary statistics of each Group
low_income <- subset(mergedata1,mergedata1$Income_Group=="Low income")
lower_middle_income <- subset(mergedata1,mergedata1$Income_Group=="Lower middle income")
upper_middle_income <- subset(mergedata1,mergedata1$Income_Group=="Upper middle income")

# Aggregated summary statistics of all the five Income Groups.
cat("   Aggregate Group by GDP in USD millions \n")
aggregate(mergedata1$USD_in_Millions, by=list(mergedata1$Income_Group),FUN=sum)

highIncomeOECD_Summary <- summary(highIncomeOECD$USD_in_Millions, digits = 10)
highIncomeNonOECD_summary <- summary(highIncomeNonOECD$USD_in_Millions, digits = 10)
low_income_Summary <- summary(low_income$USD_in_Millions, digits = 10)
lower_middle_income_Summary <- summary(lower_middle_income$USD_in_Millions, digits = 10)
upper_middle_income_Summary <-summary(upper_middle_income$USD_in_Millions, digits = 10)

# Summary statistics for highIncomeOECD income group.
cat("Summary statistics for High Income OECD group\n\n","   Lowest GDP in Millions (USD) in high income OECD groups is  ->",as.vector(highIncomeOECD_Summary)[1]," M\n","   Mean GDP in Millions (USD) in high income OECD groups is    ->",as.vector(highIncomeOECD_Summary)[4]," M\n","   Median GDP in Millions (USD) in high income OECD groups is  ->",as.vector(highIncomeOECD_Summary)[3]," M\n","   Highest GDP in Millions (USD) in high income OECD groups is ->",as.vector(highIncomeOECD_Summary)[6],"M\n")

# Summary statistics for highIncomeNonOECD income group.
cat("Summary statistics for High Income Non OECD group\n\n","   Lowest GDP in Millions (USD) in high income Non OECD groups is  ->",as.vector(highIncomeNonOECD_summary)[1]," M\n","   Mean GDP in Millions (USD) in high income Non OECD groups is    ->",as.vector(highIncomeNonOECD_summary)[4]," M\n","   Median GDP in Millions (USD) in high income Non OECD groups is  ->",as.vector(highIncomeNonOECD_summary)[3]," M\n","   Highest GDP in Millions (USD) in high income Non OECD groups is ->",as.vector(highIncomeNonOECD_summary)[6]," M\n")

# Summary statistics for low income group.
cat("Summary statistics for Low Income group \n\n","   Lowest GDP in Millions (USD) in low income groups is  ->",as.vector(low_income_Summary)[1]," M\n","   Mean GDP in Millions (USD) in low income groups is    ->",as.vector(low_income_Summary)[4]," M\n","   Median GDP in Millions (USD) in low income groups is  ->",as.vector(low_income_Summary)[3]," M\n","   Highest GDP in Millions (USD) in low income groups is ->",as.vector(low_income_Summary)[6]," M\n")

# Summary statistics for lower middle income group.
cat("Summary statistics for Lower Middle Income group \n\n","   Lowest GDP in Millions (USD) in lower middle income groups is  ->",as.vector(lower_middle_income_Summary)[1]," M\n","   Mean GDP in Millions (USD) in lower middle income groups is    ->",as.vector(lower_middle_income_Summary)[4]," M\n","   Median GDP in Millions (USD) in lower middle income groups is  ->",as.vector(lower_middle_income_Summary)[3]," M\n","   Highest GDP in Millions (USD) in lower middle income groups is ->",as.vector(lower_middle_income_Summary)[6]," M\n")

# Summary statistics for upper middle income group.
cat("Summary statistics for Upper Middle Income group\n\n","   Lowest GDP in Millions (USD) in upper middle income groups is  ->",as.vector(upper_middle_income_Summary)[1]," M\n","   Mean GDP in Millions (USD) in upper middle income groups is    ->",as.vector(upper_middle_income_Summary)[4]," M\n","   Median GDP in Millions (USD) in upper middle income groups is  ->",as.vector(upper_middle_income_Summary)[3]," M\n","   Highest GDP in Millions (USD) in upper middle income groups is ->",as.vector(upper_middle_income_Summary)[6]," M\n")

#--- Q6. 
# a] Cut GDP ranking into 5 separate quantile groups. Table versus Income.Group.

gdpQuantile <- quantile(mergedata1$Ranking, probs = seq(0,1,0.2),na.rm=TRUE)
cutgdpQuantile <- cut(mergedata1$Ranking, breaks = gdpQuantile)
mergedata1$RankingGroup <- cutgdpQuantile

merge_RankingGroup <- table(mergedata1$Income_Group, mergedata1$RankingGroup )
merge_RankingGroup


# b] Find Countries that are in Lower middle income but among the first 38 nations with highest GDP
# Number under column name = TRUE are the number of countries which are in Lower middle income group

table(mergedata1$Income_Group, mergedata1$Income_Group=="Lower middle income" & mergedata1$Ranking <39)

count_lower__middle_income_group_countries<-table(mergedata1$Income_Group, mergedata1$Income_Group=="Lower middle income" & mergedata1$Ranking <39)
cat("    Total number of countries in Lower middle income group are -> ", count_lower__middle_income_group_countries[5,2],"\n","   Following are the countries which are in the lower middle income group but among the 38 nations with highest GDP : \n\n")
lower_middle_income_group_countries  <-sqldf("select CountryCode,Ranking,Economy_Name,USD_in_Millions,Income_Group from mergedata1 where Income_Group=='Lower middle income' and  Ranking <39")

print(lower_middle_income_group_countries)