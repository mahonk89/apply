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

