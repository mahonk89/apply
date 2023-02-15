initialdir<-getwd()
apply()

#apply(x,margin,function,...)
#an array is a vector that has dimensions attached to it, so a matrix is a 2 dimensional array.
#margin is an integer vector that indicates which margin should be retained

x<-matrix(rnorm(200),20,10)
apply(x,2,mean)
#x is a matrix with 200 random values with 20 rows and 10 columns.
#this apply function will apply the mean to the columns (margin=2 implies 1 is row, 2 is column)

#one way to think of this is applying the mean or sum (or whatever function) and keeping it at the bottom.
#akin to having a total row at the bottom of a table

#rowSums, rowMeans, colSums, colMeans are all optimized to do the same thing apply can, apparently it 
#looks like these functions are designed via apply().

?quantile
apply(x,1,quantile,probs=c(.25,.75))

a<-array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

#a is an array with 3 dimensions, basically 10 sets of 2x2 matrices. rnorm is input that way to provide the
#exact number of required values to fill out the array.
#the apply function in this example is applying the mean into the first and second dimensions. In other words 
#it will average the top left element across all 10 matrices, the top right, bottom left and right values.
#We would be left with a 2x2 matrix with 4 average values where each is based on 10 results.

apply(a,c(1,3),mean)
#this takes the average of each row of each of the matrices, combining the columns into a single mean value
#so we are left with a 2x10 matrix where the rows are the rows of the original array, but now mean.
#and the columns are the rows of the following matrices in the array.
#it may be a little confusing at first
#but the margin in apply is c(1,3) which maintains the first and third dimensions, applying the mean 
#across the columns.
#c(1,2) as the margin will maintain the first and second dimensions and apply the mean across the matrices

rowMeans(a,dims=2) #this is the same result as apply(a,c(1,2),mean)
