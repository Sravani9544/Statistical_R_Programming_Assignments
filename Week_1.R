###################################################################
# Comments
# R - case sensitive
#######################Components of RStudio#########################
# Console : interactive scripting with R
#RScript : allows you send the current line of code or text to 
##console. much easier to edit and save for future use
#Environment: different object in workspace
#History: List of commands executed

#getwd() and setwd()




##################################################################
################################Basic Calculator##################

10 + 16

20-10

5*8

5^7

21/7
#matrix multiplication %*%

####################################################################
####################################################################

#############################Storing Values#########################
####################################################################
# <- assignment operator

#complete expression but it doesn't print value
x <-2 

x

print(x)


# not limited to storing just one values within a variable
# symbol : is used to sequences

x <- 11:30

x

x <- seq(from =10, to=20, by =2)

x

x <- seq(20,30,5)

x

#c() is used to combine data

x <- c(12,9,5)

x

x[2]

#Numbers within square brackets not part of object but merely part
# of printed output

x <- 6
y <- 10
z <- x * y

x
y
z


####################################################################
####################################################################

########################### R Objects###############################

# 5 basic data types of R
# character, numeric, integer, complex,logical

# character - "name", "data"
# numeric (real number with decimal) - 3.6, 1
# integer (whole number without fraction) - 7L (L - store as integer)
# complex (real number along with imaginary numbers) - 8 + 10i 
#logical - TRUE/FALSE

ch <- "statistics"

nu <- 8.9

int <- 8L

com <- 18 + 2i

logi <- FALSE

ch
nu
int
com
Re(com)
Im(com)
logi

class(ch)
class(nu)
class(int)
class(com)
class(logi)

#5 basic data structure of R
# vector, list, matrix, data frame, factors

#Difference between vector and list
# Vector : can contain multiple objects of same class
# List   : can contain multiple objects from different classes

#simple vector operations

x <- 9:12

x*7

x + 8

x

#adding two vectors
x <- c(0,1,2)
y <- c(1,2,4)
x+y

#multiplying two vectors
x <- c(0,1,2)
y <- c(1,2,4)
x*y

#dividing two vectors
x <- c(0,1,2)
y <- c(1,2,4)
y/x

# Inf - Infinity
# NaN - not a number

#raising elements to power
x <- c(0,1,2)
y <- c(1,2,4)
x^y

x <- c(TRUE,FALSE,TRUE)
x

x <- c("analytics","statistics")
x

length(x)

str(x)

#adding elements to vector

y <- c(x,"programming") 
y

z <- c("programming",x)
z

################################matrix############################

x <- 2:10
y <- 12:20
x
y

cbind(x,y)

rbind(x,y)

matrix1 <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=TRUE)
#default value of byrow is FALSE

matrix1

matrix1[,2]
matrix1[1,]
matrix1[1,2]

###################################List############################

x <- list("stats",60,TRUE)
x

x <- list("stats",1:5,TRUE)
x

x[[1]]
#to retrieve contents of list use double square bracket
x[[2]]

#extract nested elements of a list
x[[2]][[3]]

##################################Data Frame#######################

#special type of list but has equal number of elements

data <- data.frame(id = 21:30, x = letters[1:10], y = 11:20)
data
####################################################################
x