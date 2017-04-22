
# CityTemp Data
CityTemp <- read.csv('../data/CityTemp.csv')

# There are 2 sets of dates in the sheet YYYY-MM-DD and MM/DD/YYYY. Applying any date 
# formating can be applied to only 1 format

# Defining YMD for YYYY-MM-DD format
CityTemp$date1 <-ymd(CityTemp$Date)

# Defining MDY for MM/DD/YY
CityTemp$date2<-mdy(CityTemp$Date)

#Extracting the year from the first set
CityTemp$year1 <-year(CityTemp$date1)

#Extracting the year from the second set
CityTemp$year2<- year(CityTemp$date2)

#Substituting the NA with 0 for year1 dataset
CityTemp$year2[is.na(CityTemp$year2)]<-0

#Substituting NA with 0 for year2
CityTemp$year1[is.na(CityTemp$year1)]<-0

#Combining the years for filtering the dataset
CityTemp$year.combined <- CityTemp$year1+CityTemp$year2

#Filtered out the dataset
CityTemp1900 <- subset(CityTemp,year.combined>1900)

#Renaming the columns
names(CityTemp1900)<-c("Date","MoAvgTemp","MoAvgTemp_Unc","City","Country","Latitude","Longitude","date1","date2","year1","year2","year_comb")

#Remove "NA"records
CityTemp1900exNA<-subset(CityTemp1900,MoAvgTemp!="NA")
