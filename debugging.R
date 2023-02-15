#Debugging

#message: a generic notification/diagnostic message produced by the message() function, execution
#of the function continues.

#warning: an indication that something is wrong but not necessarily fatal, execution continues
#produced by warning() function.

#Error: indication that a fatal problem has occurred, execution stops. Produced by stop() function

#condition: a generic concept for indicating that something unexpected can occur
#programmers can create their own conditions
#all of the above are conditions

    #How do you know that something is wrong with your function!?
#What was your input? - not what you THINK you input, but what did you?
#How was the function called?
#What were you expecting? Output, messages or other results?
  #what did you get?
#how does what you get differ from what you were expecting?
#were your expectations correct in the first place?
#can you reproduce the problem?

#ARE YOU USING THE CORRECT FUNCTION FOR THE PROBLEM?

    ##Basic tools and using them

traceback()
#prints out the function call stack after an error occurs; does nothing if there is no error
#tells you how many function calls you were in and where the error occurred. Many functions 
#may call multiple functions and helps you find at what point the error happened.
debug()
n #use this on the empty console line, it stands for "next" to run the next line until you find
#where the error occurred.
#anytime you execute that function, it will suspend execution of that function on the first line
#and you can step through the function line by line - stepping through the function one expression
#at a time, allowing you to better pinpoint the location the error occurred.
browser()
#this can be placed WITHIN a function at any line, and when this is run, the function will suspend.
#and enter into debug mode.
#if you know lines 1-50 are good, it will stop at that point and then debug() running line by line
trace()
#allows you to insert debugging code into a function at specific places
#useful to help debug other people's work.
recover()
#allows you to modify the error behavior so that you can browse the function call stack.
#recover is an 'error handler function' where this will stop the function at that spot but
#NOT hand the console control back to you. Essentially when an error occurs, all processes halt
#and you can work in the console again. recover() takes that away and shows you the call stack
#through browser

print()
#one recommendation was to add print() into the function at certain points to see what the results
#are for objects that are not the final result.
#I was actually doing this alot when writing functions for week 2. It was very helpful in finding out
#what was actually being done when creating a dataframe that I was to later use for subsetting to find
#the actual result I was looking for.

#instructor is telling me that he worked in R for 6 years and never used these debug tools
#and that another instructor actually hated using them. 

options(error=recover)
#will always be active as long as the R session is open. Won't be active once R is closed.
#once an error occurs, a new action will happen. I'm going to run the example provided
#since it simply is calling to a file that does not exist. I will do it prior to setting
#options(error=recover)

    #NOTE to google "R error handling" for more information on setting as recover, etc.

read.csv("nosuchfile")

#returns the same error, plus 3 options to select frame number.
#making a selection will let you view the environment in that process to further look for
#any errors.

