
#Create a dataset with the max and min temps for each City
maxTemp<-ddply(CityTemp1900exNA,"City", summarise,maxMoTemp=max(MoAvgTemp))
minTemp<-ddply(CityTemp1900exNA,"City", summarise,minMoTemp=min(MoAvgTemp))

#Combine the max and min temps to calculate a difference
CityTemp1900_2<-merge(maxTemp,minTemp,by.x="City",by.y="City")
CityTemp1900_2$tempDiff<-CityTemp1900_2$maxMoTemp-CityTemp1900_2$minMoTemp

#Order and rank the cities in decreasing order of max temp diff
CityTemp1900_rank<-CityTemp1900_2[order(CityTemp1900_2$tempDiff,decreasing=TRUE),]

CityTemp1900_rank$tempRank<-seq(1,99,1)

#limit the data to only the top twenty
CityTemp1900_top20<-subset(CityTemp1900_rank,tempRank<21)

#Reorder the data on tempRank to make the graph prettier
Cityorder<-CityTemp1900_top20$City[order(CityTemp1900_top20$tempRank,decreasing=TRUE)]
CityTemp1900_top20$City<-factor(CityTemp1900_top20$City,level=Cityorder)

#Graph the results
graphii <- ggplot(CityTemp1900_top20,aes(x=tempDiff,y=City))+geom_segment(aes(yend=City),xend=0)+geom_point()+theme_bw()+theme(panel.grid.major.y=element_blank())
graphii
