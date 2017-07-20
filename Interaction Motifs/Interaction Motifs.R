#Interaction motifs

#Obtaining Median of non-zero interactions. 
mart_matas_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_matas_eff.csv",header=TRUE,check.names=FALSE,row.names=1)


martmat_eNA<-mart_matas_e
martmat_eNA[martmat_eNA==0]<-NA
martmat_eNA

##Median excluding NAs(e.g. 0). "The median for proportional frugivory efficiency (0.104)". All datas above this value will mean strong interaction and all below weak interaction
median(as.matrix(martmat_eNA),na.rm=TRUE)

mart_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_eff.csv",header=TRUE,check.names=FALSE,row.names=1)

#Martinazo
mart_mat<-read.csv("~/Desktop/red_miguel.csv",header=TRUE,check.names=FALSE,row.names=1)

#Matasgordas
matas_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/matas_eff.csv",header=TRUE,check.names=FALSE,row.names=1)




matas<-read.csv("/Users/apple/desktop/Palmito/Postdoc-Interaction Networks/Matrixs/Matas.csv")
matasNa<-matas
matasNa[matasNa==0]<-NA
matasNa
str(matas)
summary(matas)

matNA<-median(as.matrix(matasNa), na.rm=TRUE)
matNA



median(as.matrix(matasNa),na.rm=TRUE)

#Deer interative matrix
B<-10000
n<-nrow(matasNa)
deer.samples<-matrix(sample(matasNa$deer, size=B*n, replace=TRUE), B, n)
deer.samples

deer.mean = with(matasNa, mean(matasNa$deer,na.rm = TRUE))
deer.mean

deer.statistics <- apply(deer.samples, 1,median,na.rm = TRUE)
deer.statistics
require(ggplot2)
ggplot(data.frame(meanTime = deer.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

deer.se<-sd(deer.statistics)
deer.se
barplot(deer.statistics)
summary(deer.statistics)


me<-ceiling(10 * 2 * deer.se)/10
round(deer.mean,2) + c(-1, 1) * me

#Wildboar interative matrix
B<-10000
n<-nrow(matasNa)
wildboar.samples<-matrix(sample(matasNa$wildboar, size=B*n, replace=TRUE), B, n)
wildboar.samples
matasNa$wildboar
wildboar.mean = with(matasNa, mean(matasNa$wildboar,na.rm = TRUE))
wildboar.mean



wildboar.statistics <- apply(wildboar.samples, 1, median, na.rm = TRUE)
wildboar.statistics
require(ggplot2)
ggplot(data.frame(meanTime = wildboar.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

wildboar.se<-sd(wildboar.statistics,na.rm = TRUE)
wildboar.se
barplot(wildboar.statistics)
summary(wildboar.statistics)

me<-ceiling(10 * 2 * wildboar.se)/10
round(wildboar.mean,2) + c(-1, 1) * me

#Rabbit interative matrix
B<-10000
n<-nrow(matasNa)
rabbit.samples<-matrix(sample(matasNa$rabbit, size=B*n, replace=TRUE), B, n)
rabbit.samples
rabbit.mean = with(matasNa, mean(matasNa$rabbit,na.rm = TRUE))
rabbit.mean

rabbit.statistics <- apply(rabbit.samples, 1,median,na.rm = TRUE)
rabbit.statistics
require(ggplot2)
ggplot(data.frame(meanTime = rabbit.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

rabbit.se<-sd(rabbit.statistics)
rabbit.se
barplot(rabbit.statistics)
summary(rabbit.statistics)


me<-ceiling(10 * 2 * rabbit.se)/10
round(rabbit.mean,2) + c(-1, 1) * me

#Rat interative matrix
B<-10000
n<-nrow(matasNa)
rat.samples<-matrix(sample(matasNa$rat, size=B*n, replace=TRUE), B, n)
rat.samples
rat.mean = with(matasNa, mean(matasNa$rat,na.rm = TRUE))
rat.mean

rat.statistics <- apply(rat.samples, 1,median,na.rm = TRUE)
rat.statistics
require(ggplot2)
ggplot(data.frame(meanTime = rat.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

rat.se<-sd(rat.statistics)
rat.se
barplot(rat.statistics)
summary(rat.statistics)


me<-ceiling(10 * 2 * rat.se)/10
round(rat.mean,2) + c(-1, 1) * me

#Badger interative matrix
B<-10000
n<-nrow(matasNa)
badger.samples<-matrix(sample(matasNa$badger, size=B*n, replace=TRUE), B, n)
badger.samples
badger.mean = with(matasNa, mean(matasNa$badger,na.rm = TRUE))
badger.mean

badger.statistics <- apply(badger.samples, 1,median,na.rm = TRUE)
badger.statistics
require(ggplot2)
ggplot(data.frame(meanTime = badger.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

badger.se<-sd(badger.statistics,na.rm = TRUE)
badger.se
barplot(badger.statistics)
summary(badger.statistics)


me<-ceiling(10 * 2 * badger.se)/10
round(badger.mean,2) + c(-1, 1) * me

#Fox interative matrix

as.factor(matasNa$fox)
B<-10000
n<-nrow(matasNa)
fox.samples<-matrix(sample(matasNa$fox, size=B*n, replace=TRUE), B, n)
fox.samples
fox.mean = with(matasNa, mean(matasNa$fox,na.rm = TRUE))
fox.mean


fox.statistics <- apply(fox.samples, 1,median,na.rm = TRUE)
fox.statistics
require(ggplot2)
ggplot(data.frame(meanTime = fox.statistics),aes(x=meanTime)) +
  geom_histogram(binwidth=0.5,aes(y=..density..)) +
  geom_density(color="red")

fox.se<-sd(fox.statistics,na.rm = TRUE)
fox.se
barplot(fox.statistics)
summary(fox.statistics)


me<-ceiling(10 * 2 * fox.se)/10
round(fox.mean,2) + c(-1, 1) * me



boxplot(matas_im$count~matas_im$combination,data=matas_im, main="interaction motifs", 
        xlab="Interaction motifs", ylab="frequency")

#Without absents
matas_abs<-subset(matas_im, combination != "ant-absent_mut-absent", select=c(combination,count, freq))
boxplot(matas_abs$count~matas_abs$combination,data=matas_abs, main="interaction motifs", 
        xlab="Interaction motifs", ylab="frequency")