setwd("/Users/zhangxiaoya/CMEECoursework/WEEK3/RCoursework/Code")
d = read.csv("trees.csv", header = TRUE)


TreeHeight <- function(degrees, distance){
  radians <- degrees * pi / 180
  height <- distance * tan(radians)
  print(paste("Tree height is:", height))
  
  return (height)
}

height = TreeHeight(d$Angle.degrees, d$Distance.m)
d$Tree.Height.m = height

setwd("/Users/zhangxiaoya/RCoursework/Result")
write.csv(d, "TreeHts.csv")
