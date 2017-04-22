#Scatter plot of circumference vs. age
ggplot(Orange,aes(x=circumference,y=age,color=Tree,shape=Tree))+geom_point()
