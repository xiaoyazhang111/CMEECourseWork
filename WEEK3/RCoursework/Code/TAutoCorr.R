setwd("/Users/zhangxiaoya/CMEECoursework/WEEK3/RCoursework/Code")
load("/Users/zhangxiaoya/CMEECoursework/WEEK3/RCoursework/Code/KeyWestAnnualMeanTemperature.Rdata")

x <- data.frame(ats[1])
y <- data.frame(ats[2])

spearman <- cor(x,y,method="spearman")
pearson <- cor(x,y,method="pearson")
kendall <- cor(x,y,method="kendall")

print(spearman)
print(pearson)
print(kendall)