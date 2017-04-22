#Create a dataset with the max and min temps for each country
maxTemp<-ddply(degreeexNA,"Country", summarise,maxMoTemp=max(MoAvgTemp))
minTemp<-ddply(degreeexNA,"Country", summarise,minMoTemp=min(MoAvgTemp))

#Combine the max and min temps to calculate a difference
degree2<-merge(maxTemp,minTemp,by.x="Country",by.y="Country")
degree2$tempDiff<-degree2$maxMoTemp-degree2$minMoTemp

#Order and rank the countries in decreasing order of max temp diff
degree2_rank<-degree2[order(degree2$tempDiff,decreasing=TRUE),]

degree2_rank$tempRank<-seq(1,241,1)

#limit the data to only the top twenty
degree_topTwenty<-subset(degree2_rank,tempRank<21)

#Reorder the data on tempRank to make the graph prettier
Countryorder<-degree_topTwenty$Country[order(degree_topTwenty$tempRank,decreasing=TRUE)]
degree_topTwenty$Country<-factor(degree_topTwenty$Country,level=Countryorder)

#Graph the results
graphi <- ggplot(degree_topTwenty,aes(x=tempDiff,y=Country))+geom_segment(aes(yend=Country),xend=0)+geom_point()+theme_bw()+theme(panel.grid.major.y=element_blank())
graphi
