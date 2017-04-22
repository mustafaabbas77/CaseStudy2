#create US subset for only years >=1990
UStemp<-subset(degree,degree$Country=="United States" & degree$year_comb>=1990)

#add a Fahrenheit column
UStemp$fahr<-UStemp$MoAvgTemp*1.8+32
#avg temp by year with plot
UStemp_year<-ddply(UStemp,"year_comb", summarise,AvgFarhTempYr=mean(fahr))
ggplot(UStemp_year,aes(x=year_comb,y=AvgFarhTempYr))+geom_line()


#Number of records

t <-length(UStemp_year$AvgFarhTempYr)


#Question 3 c

#Defining the data frame to store the records
mat <- data.frame(24,24)

#Loop to do the difference of years
for ( i in 1:t){
  landtemp_diff <- round(UStemp_year[i+1,2]- UStemp_year[i,2],digits = 3)
  
  year_diff <- paste(cbind(as.character(UStemp_year[i+1,1]),as.character(UStemp_year[i,1])),collapse='-')
  
  mat[i,] <-  c(year_diff,landtemp_diff)
}

#Renaming the coloumns
names(mat) <- c('year_diff','temp_diff')

#Printing the results
mat

#Substituting NA with 0 for last record
mat$temp_diff[is.na(mat$temp_diff)] <-0

#Finding the max diff

max_diff <- subset(mat,mat$temp_diff ==max(mat$temp_diff))

max_diff

