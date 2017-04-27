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


library(reshape2)
setNames(melt(mart_mat), c('plant', 'deer', 'values'))
#  rows vars values
mart_melt<-melt(mart_e,id)

mart_melt

####Analyzing the interaction motifs with different characteristics of the plants

inter_mot<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/C.-humilis-Fugivorous-Networks/Interaction Motifs/red_miguel.csv",header=TRUE,check.names=FALSE,row.names=1)
mod_intmot<-glm(inter_mot$nn~inter_mot$Motifs)
anova(mod_intmot)
summary(mod_intmot)
boxplot(inter_mot$dens,inter_mot$Motifs)


