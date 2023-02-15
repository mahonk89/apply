    #week 3 quiz 
rm()

initialdir<-getwd()

library(datasets)
data(iris)

  #find the mean of Sepal.Length for the species virginica
head(iris)
species<-iris$Species
splspec<-split(iris,species)
splspec
sapply(splspec,function(x) mean(x[,"Sepal.Length"],na.rm=T))
  # for question 1, answer is 6.588 rounded up to 7

  #which R code returns a vector of the means of the variables (sepal,petal)(length/width)
apply(iris[,1:4],2,mean)
  #answer above

library(datasets)
data(mtcars)
head(mtcars)

  #How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
lapply(mtcars,mean) #NO - this just applies mean to all of the columns and returns a list
#we would likely want a sapply() using split by cyr
sapply(split(mtcars$mpg,mtcars$cyl),mean) #this works
  split(mtcars$mpg,mtcars$cyl) #testing result of splitting 2 subsets. This works because it splits
  #the vector of mtcars$mpg into groupings by cylinder. It also works because the cyl column is a
  #vector of repeating integers, creating a factor of levels
with(mtcars,tapply(mpg,cyl,mean)) #this works
  #with(data,expr,...) is a function that will evaluate 'expr' in a local environment constructed
  #from 'data'. The env has the caller's env as its parent. This is useful for simplifying calls to 
  #modeling functions. Note that the assisngments within expr take place in the constructed environment
  #and not in the user's workspace.
    #so basically with(mtcars,tapply(mpg,cyl,mean)) is setting mtcars as the environment, and using tapply
    #within it, where mpg is the vector to which the function mean is applied, by the index cyl, where cyl
    #is a factor vector split into levels by number of cylinders.
  #essentially, apply mean to mpg, group by cyl within mtcars.
tapply(mtcars$cyl,mtcars$mpg,mean) #NO - this is doing the opposite of the last. This is essentially
#doing take the mean of cyl, group by mpg within mtcars
sapply(mtcars,cyl,mean) #does not work because cyl is not a function which is always the second 
#argument within sapply()
tapply(mtcars$mpg,mtcars$cyl,mean) #YES - this works, it is the opposite of the last tapply function
#take mean of mpg, group by cyl
apply(mtcars,2,mean) #NO - this is essentially colMeans
  colMeans(mtcars) #as shown by this
mean(mtcars$mpg,mtcars$cyl) #this does not work 
split(mtcars,mtcars$cyl) #this does not work


  #What is the absolute difference between mean(HP) of 4 cyl and mean(HP) of 8 cyl?

hpavg<-tapply(mtcars$hp,mtcars$cyl,mean)
abs(hpavg["4"]-hpavg["8"]) #// 126.5779 
hpavg["4"]
hpavg["8"]

split(mtcars,mtcars$cyl)

  #if you run
debug(ls)
ls()



