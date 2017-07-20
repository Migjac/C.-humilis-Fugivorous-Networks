#Martinazo
mart_enun<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_eff_nun.csv",header=TRUE,check.names=FALSE,row.names=1)

#Matasgordas
matas_enun<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/matas_eff_nun.csv",header=TRUE,check.names=FALSE,row.names=1)

#Martinazo Bipartite network
par(mfrow = c(2,1))
plotweb(mart_enun, col.low=c(gray(seq(0.1,1,length=22))), col.high=c("white","white","gray30","gray30","black","darkgray"),method="normal", text.rot=90,low.lablength=10, high.lablength=8)

#Matasgordas Bipartite Network
plotweb(matas_enun, col.low=c(gray(seq(0.1,1,length=34))), col.high=c("white","white","gray30","gray30","black","black","darkgray"), method="normal", text.rot=90,low.lablength=10, high.lablength=8)

#networklevel

#Martinazo
networklevel(mart_enun, index = c("connectance","web asymmetry","cluster coefficient","nestedness","weighted nestedness"))

#Matasgordas
networklevel(matas_enun,index = c("connectance","web asymmetry","cluster coefficient","nestedness","weighted nestedness"))

#Modularity
mod_mart_enun<-computeModules(mart_enun)
mod_matas_enun<-computeModules(matas_enun)



mod_mart_enun@likelihood
mod_matas_enun@likelihood

linklevel(mart_enun)
linklevel(matas_enun)

mart_im<-read.csv("boostrap_mart.csv")
str(mart_im)


boxplot(mart_im$count~mart_im$combination,data=mart_im, main="interaction motifs", 
        xlab="Interaction motifs", ylab="frequency")
