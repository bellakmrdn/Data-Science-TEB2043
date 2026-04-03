#Load dataset
data(ToothGrowth)
View(TootGrowth)
head(ToothGrowth)

#Correlation Analysis
tooth_num <- ToothGrowth[, c("len", "dose")]
cor(tooth_num)

#Pearson correlation test
cor.test(ToothGrowth$len, ToothGrowth$dose, method="pearson")

#Heatmap
library(ggcorrplot)
corr <- cor(tooth_num)
ggcorrplot(corr)

#-----------------------------#
#------- Observation ---------#
#-----------------------------#
#Tooth length and dose show positive correlation
#When dosage increases, tooth length also increases
#Higher vitamin dose contributes to greater tooth growth
