#Mean and median of the trunk circumference for different size of the trees.
summaryBy(circumference~Tree,data = Orange,FUN = list(mean,median))
