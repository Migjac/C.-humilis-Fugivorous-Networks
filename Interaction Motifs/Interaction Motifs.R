#Interaction motifs

#Obtaining Median of non-zero interactions. 
mart_matas_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_matas_eff.csv",header=TRUE,check.names=FALSE,row.names=1)


martmat_eNA<-mart_matas_e
martmat_eNA[martmat_eNA==0]<-NA
martmat_eNA

##Median excluding NAs(e.g. 0). "The median for proportional frugivory efficiency (0.104)". All datas above this value will mean strong interaction and all below weak interaction
median(as.matrix(martmat_eNA),na.rm=TRUE)

mart_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_eff.csv",header=TRUE,check.names=FALSE,row.names=1)