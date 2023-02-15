?tapply
#tapply(x,index,fun=NULL,...,simplify=T) is used to apply a function over subsets of a vector. 
#x is a vector
#index is a factor (variable)(?factor) or a list of factors (coerced into factors)
##must be the same length as the x vector
#fun is the function to be applied
#... other arguments passed to function
#simplify the result

?gl
x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10,labels=c("wood","brick","ore"))
f
tapply(x,f,mean)

#tapply() allows us to take the mean of each "group" or set of random numbers by "assigning"
#them to a level determined by gl(). gl(3,10) will create 3 levels (1,2,3) and replicate each
#by the number in the second argument. 

#by design, this is meant to work. x is a vector created by combining 30 random values from 3
#functions containing 10 values each. So, by design x has 10 from 1 category, 10 from the
#second, and 10 from the third. Hence using gl(3,10) works perfectly to allow us to make 3
#distinct levels with length 10. 
#when planning to use this, it would be wise to ensure all data contains vectors of the 
#same length. Otherwise, find another substitution for gl(), or tapply() in general

