##priority
##character
##numeric
##logical

#the outcome of the following:
c(1, FALSE)   #1 0
c("a",1)     #"a" "1"
c(list(1),"a") 
c(TRUE,1)    #1 1

#Control flow
rtruncNormal <- function(thresh = 2, maxit=1000) {
  x<-NULL
  for(i in 1:maxit) {
    xnew <- rnorm(n=1)
    if(xnew>thresh) {
      break
    }
    x <- c(x,xnew)
  }
  x
}
set.seed(1234)
rtruncNormal()

#Dates
as.Date(xx, "%Y-%m-%d")

#Character strings
#extracts the first letter and saves it in a vector l1
#extracts the second letter and saves it in a vector l2
l1 = substr(gg, 1, 1)
l2 = substr(gg, 2, 2)