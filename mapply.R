mapply()
?mapply
#multivariate loop function which applies a function in parallel over a set of arguments

#mapply(fun,...,MoreArgs=NULL, SIMPLIFY=TRUE, USE.NAMES=TRUE)
#Where MoreArgs=NULL is a list of other arguments to apply to fun, such as mean=n, sd=m for rnorm()

a1<-list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
#this creates a list with 4 vectors beginning with 1 repeated 4 times, to 4 repeated only once
#mapply() can simplify this creation - granted it is already a simple entry but I'm sure this
#is just for the sake of the example...

a2<-mapply(rep,1:4,4:1)
setequal(a1,a2)
#setequal() both objects will return true, as this is doing the same thing
?rep
#fun rabbit hole on the rep() function
#rep(x,times=1,length.out=NA,each=1)
#if times consists of a single integer, the result is x repeated that many times
#if times is a vector of the same length as x (after replication by each), the result consists of 
#x[1] repeated times[1], x[2] repeated times[2], etc. 
#if length.out is specified, then x is repeated as many times as is necessary to create
#a vector of this length. If both are given, length.out takes priority.
c<-1:10
b<-sample(100,10)
rep(b,c)
#back to mapply

noise<-function(n,mean,sd){
  rnorm(n,mean,sd)
}
noise(5,1,2)
#so for whatever reason, the example given was to create function which is literally just
#using rnorm() as its function, nothing else. GREAT EXAMPLE, HELPFUL
noise(1:5,1:5,2)
rnorm(1:5,1:5,2)
#noise does nothing more than rnorm, silly.
#the goal in noise() or rnorm() using the sequences above was to produce 5 vectors of 
#random normal values, first would have 1 number with mean 1, second would be 2 numbers with mean 2
# and so on -- sd=2 for all desired vectors
#as you can see by the result, it does not actually do that, and looking at some examples
#I can't seem to figure out what exactly it was doing.
?rnorm
#n is the number of observations - if length(n)>1 then the length is taken to be the number required.
#so length(1:5)=5=n
#mean is a vector of means, so mean on the first is 1, second is 2 and so on. 

mapply(noise,1:5,1:5,2)
#know what you are looking for and when to use each of these $apply() functions



