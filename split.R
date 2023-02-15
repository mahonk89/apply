?split
#split takes a vector or other objects and splits it into groups determined by a 
#factor or a list of factors.
#split(x,f,drop=F,...)
#x is a vector, list or data frame
#f is a factor (or coerced to one) or a list of factors
#drop indicates whether empty factors levels should be dropped

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10,labels=c("wood","brick","ore"))
tapply(x,f,mean)

#when we did tapply to x using f, it returned the mean of each of the 3 distributions in x
#basically because it was setup to do that specifically. In the same light, if I have a vector
#that I know can be split into equal parts given some background, split can be used to get what
#we are looking for

split(x,f)

#where tapply() took the mean for each grouping, split just returns the groupings.
head(airquality)

s<-split(airquality,airquality$Month)
s
#This splits the data frame to separate objects based on the subset of month. We didn't need to do
#much more than that as the subset of the column month created a vector of days of which was
#coerced into levels/factors and used within split. 
s$`6`

#taking this further, you can then subset the split object using $`#` to return the portion
#which only contains that month. 

lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
#once the airquality data set is split by months, we can then use lapply() to get the mean of each
#column of each split group. This again is where the anonymous function comes in handy where we can 
#create our own function using by subsetting a data frame x by a string of the desired columns
#which we see as x[,c("Ozone","Solar.R","Wind")] - so the anony function applies column means to
#each of those columns and returns the means for each grouping. Pretty neat!

#Since there are NA values in the set of data, we can use the argument na.rm=T within the 
#colMeans() function to remove the NA values when calculating the mean.

lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=T))
#each result is returned as a list as is expected with lapply. We can use sapply() on the split
#list to simplify the result into an easy to read data set, since each grouping has 3 elements
#which are the means of each ozone, solar.r and wind.

sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=T))
#nice and neat

##Splitting on more than one level
x<-rnorm(10) #random set of 10 numbers
f1<-gl(2,5) #factor vector, 2 levels with 5 repetitions
f2<-gl(5,2) #factor vector, 5 levels with 2 repetitions
f12<-interaction(f1,f2) #computes a factor which represents the interaction of the given factors
#it will return 1.1, 1.1, 1.2, 1.2, 1.3,... and so on. It will essentially combine 2 vectors
#in order one by one by the separation "."
#it is not a matrix multiplication of sorts where each element will ultimately be paired 
#together with an element of the other. 
#from f1, 2 will never be paired with 1 or 2 from f2.
str(split(x,list(f1,f2)))

#as you can see, there are empty levels
str(split(x,list(f1,f2),drop=T))
#split has an argument that you can add, drop=TRUE where it will only return the levels
#that have observations within them.
