MyDF <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
dim(MyDF) 
str(MyDF)
head(MyDF)
require(dplyr)
library(lattice)
dplyr::glimpse(MyDF)
pdf("/Users/zhangxiaoya/CMEECourseWork/WEEK3/RCoursework/Result/Pred_Lattice.pdf",11.7,8.3)
densityplot(~log10(Predator.mass) | Type.of.feeding.interaction, data=MyDF)
pdf("/Users/zhangxiaoya/CMEECourseWork/WEEK3/RCoursework/Result/Prey_Lattice.pdf",11.7,8.3)
densityplot(~log10(Prey.mass) | Type.of.feeding.interaction, data=MyDF)
pdf("/Users/zhangxiaoya/CMEECourseWork/WEEK3/RCoursework/Result/PredPrey_Lattice.pdf",11.7,8.3)
densityplot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") 
graphics.off();

PredatorMean <- mean(log(MyDF$Predator.mass))
PreyMean <- mean(log(MyDF$Prey.mass))
PredatorPreyMean <-mean(log(MyDF$Prey.mass/MyDF$Predator.mass))
PredatorMedian <- median(log(MyDF$Predator.mass))
PreyMedian <- median(log(MyDF$Prey.mass))
PredatorPreyMedian <- median(log(MyDF$Prey.mass/MyDF$Predator.mass))

mean <- as.data.frame(c(PredatorMean,PreyMean,PredatorPreyMean))
median <- as.data.frame(c(PredatorMedian,PreyMedian,PredatorPreyMedian))
table <- data.frame(mean,median)
colnames(table) <-c("mean","median")

setwd("/Users/zhangxiaoya/CMEECoursework/WEEK3/RCoursework/Result/")
write.csv(table, "PP_Results.csv")


