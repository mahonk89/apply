#scrap

v1<-sample(10,10,replace = T)
v2<-sample(5:15,10,replace=T)
mean(v1,v2)




#testing accuracy of week 3 question 2 answer
cm<-function(x){
  meanvect<-numeric()
  l<-ncol(x)-1
  for(i in 1:l){
    meanvect<-c(meanvect,mean(x[,i]))
  }
  meanvect
}
cm(iris)
ncol(iris)
