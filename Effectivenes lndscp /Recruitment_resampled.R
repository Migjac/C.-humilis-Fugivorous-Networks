#Script to obtain the media fo recrutiment. We randomized 50 times the recruitment values [weight <- weights[j]] based in the given standard errors [runif(50,weight-error,weight+error)]

mart_matas_fruits<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/C.-humilis-Fugivorous-Networks/Fruit removal/mart_matas_fruits.csv",header=TRUE,check.names=FALSE,row.names=1)

deer_weight=0.012
wildb_weight=0
rabbit_weight=0.286
rat_weight=0.286
fox_weight=0.179
badger_weight=0.179

d_sd=0.001
w_sd=0
rb_sd=0.01
rt_sd=0.01
f_sd=0.04
b_sd=0.04

weights_sd<-c(0.001,0,0.01,0.01,0.04,0.04)
weights <- c(0.012,0,0.286,0.286,0.179,0.179)


bs_recrt_avrg <- data.frame("deer"=numeric(0),"wildboar"=numeric(0),"rabbit"=numeric(0),"rat"=numeric(0),"fox"=numeric(0),"badger"=numeric(0))
bs_recrt_50 <- list()
for (j in c(1:6)) {
  weight <- weights[j]
  error <- weights_sd[j]
  random_weights <- runif(50,weight-error,weight+error)
  cumulative_random_values <- numeric(0)
  for (i in 1:nrow(mart_matas_fruits)) {
    random_values <- random_weights*(mart_matas_fruits[i,j])
    average_value <- mean(random_values)
    bs_recrt_avrg[i,j] <- average_value
    cumulative_random_values <- c(cumulative_random_values,random_values)
  }
  print(paste0("for column ",j," number of rows is ",length(cumulative_random_values)))
  bs_recrt_50[[j]] <- cumulative_random_values
}

bs_recrt_50_df <- data.frame(matrix(unlist(bs_recrt_50),nrow=3500,byrow=F))
colnames(bs_recrt_50_df) <- c("deer","wildboard","rabbit","rat","fox","badger")
 
#Standard error
bs_recrt_se<- data.frame("deer_se"=numeric(0),"wildboar_se"=numeric(0),"rabbit_se"=numeric(0),"rat_se"=numeric(0),"fox_se"=numeric(0),"badger_se"=numeric(0))
for (j in c(1:6)) {
  weight <- weights[j]
  error <- weights_sd[j]
  random_weights <- runif(50,weight-error,weight+error)
  for (i in 1:nrow(mart_matas_fruits)) {
    random_values <- random_weights*(mart_matas_fruits[i,j])
    error_average_value <- sd(random_values)/sqrt(length(random_values))
    bs_recrt_se[i,j] <- error_average_value
  }
}
