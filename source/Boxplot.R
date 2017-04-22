#adding diameter to the dataset
Orange$diameter<-Orange$circumference/pi
maxTree1<-max(subset(Orange,Tree==1)$diameter,na.rm=TRUE)
maxTree2<-max(subset(Orange,Tree==2)$diameter,na.rm=TRUE)
maxTree3<-max(subset(Orange,Tree==3)$diameter,na.rm=TRUE)
maxTree4<-max(subset(Orange,Tree==4)$diameter,na.rm=TRUE)
maxTree5<-max(subset(Orange,Tree==5)$diameter,na.rm=TRUE)

TreeDiam<-c(maxTree1,maxTree2,maxTree3,maxTree4,maxTree5)
DiamRank<-rank(TreeDiam)
TreeSize<-c(1,2,3,4,5)
Treediam_df<-data.frame(TreeDiam,DiamRank,TreeSize)
Orange_rank<-merge(Orange,Treediam_df,by.x="Tree",by.y="TreeSize")
Orange_rank<-Orange_rank[order(Orange_rank$DiamRank),]
#Circumference boxplots by Tree
ggplot(Orange_rank,aes(x=factor(Tree),y=circumference))+geom_boxplot()

