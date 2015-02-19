## These two functions return the inverse of a matrix and store it in cache. They speed up computations
## by getting inverse from cache if it alreadu exist there. They prevent redundant calculations in case 
## of multiple iterations requiring calculation of an inverse matrix.


## The first function below creates a list containing a functions to:
##		set the value of the matrix
##		get the value of the matrix
##		set the value of the inverse matrix
##		get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {

	m<-NULL
	
	set<-function(y){
		x<<-y
		m<<-NULL
	  }
  
	get<-function() x
  
	setmatrix<-function(solve_inv) m<<-solve_inv
  
	getmatrix<-function() m
  
	list(set=set, get=get,
		setmatrix=setmatrix,
		getmatrix=getmatrix)
}


## This function returns the inverse of the special "matrix" returned by makeCacheMatrix function
## above. If it does not exist in cache it computes it, if it does, it is getting it from cache.

cacheSolve <- function(x, ...) {

    m<-x$getmatrix()
  
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get
    m<-solve(matrix, ...)
    x$setmatrix(m)
 m
}
