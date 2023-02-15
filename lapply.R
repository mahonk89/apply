initialdir<-getwd()

x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)

x<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)
rnorm(10)

x<-1:4
lapply(x,runif)
lapply(x,runif,min=0,max=10)
#The runif() function, along with many others including rnorm() have multiple arguments but most have default
#values set. Defaults for rnorm(n,mean=0,sd=1) and defaults for runif(n,min=0,max=1).
#in lapply(), we can add additional arguments after the function to adjust defaults such as above, changing the
#min and max values of the randomly generated uniform values. I'm sure an error would occur if you placed an
#argument in lapply for runif() that is not an argument in runif()
lapply(x,runif,mean=5)
#this input returns an error as expected. However, mean is a default value in rnorm() and should work.
lapply(x,rnorm,mean=5)
#setting the mean argument does indeed work.

y<-list(a=matrix(1:4,2,2),b=matrix(5:10,3,2))
lapply(y,function(g1) g1[,1])
#the example wanted to show us how to pull the first column  from both (all) matrices in the list. He goes on to
#say there is no explicit function for this - my first guess was to do lapply(y,[,1]) but this returned an error
#it is going down the correct path though! ([,] is subsetting, not a technically a function)
#you can create a function within lapply to run in that same line as above. arg2 in lapply is essential

#anonymous function
g<-function(g1){
  return(g1[,1])
}
g(b) #invalid as y is a list of matrices, this function will not work. 
a=matrix(1:4,2,2)
b=matrix(5:10,3,2)
#I created the function g to show how useful lapply can already be. I have to separately input the matrices
#into g() and rerun to get outputs. lapply is performing the function output with less words and more simplicity.

#sapply()
#will try to simplify the result.
#if the result is a list where every element is length 1, then a vector is returned
#if the result is a list where every element is a vector of same length, then a matrix is returned
#if it can't figure it out, a list is returned.
x<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean) #will return a list of 4 mean values where each object is length 1
sapply(x,mean) #will return a vector of 4 mean values since each object is length 1

