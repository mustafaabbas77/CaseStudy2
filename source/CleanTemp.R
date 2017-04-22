# Raw Data
raw <- read.csv('../data/TEMP.csv')

# There are 2 sets of dates in the sheet YYYY-MM-DD and MM/DD/YYYY. Applying any date 
#formating can be applied to only 1 format

# Defining YMD for YYYY-MM-DD format
raw$date1 <-ymd(raw$Date)

#Defining MDY for MM/DD/YY
raw$date2<-mdy(raw$Date)

#Extracting the year from the first set
raw$year1 <-year(raw$date1)

#Extracting the year from the second set
raw$year2<- year(raw$date2)

#Substituting the NA with 0 for year1 dataset
raw$year2[is.na(raw$year2)]<-0

#Substituting NA with 0 for year2
raw$year1[is.na(raw$year1)]<-0

#Combining the years for filtering the dataset
raw$year.combined <- raw$year1+raw$year2

#Filtered out the dataset
degree <- subset(raw,year.combined>1900)

#Renaming the columns
names(degree)<-c("Date","MoAvgTemp","MoAvgTemp_Unc","Country","date1","date2","year1","year2","year_comb")

#Remove "NA"records
degreeexNA<-subset(degree,MoAvgTemp!="NA")

