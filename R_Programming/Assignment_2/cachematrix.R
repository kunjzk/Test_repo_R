## Functions to compute and cache the inverse of a given matrix.

## Creates a list object containing the matrix as well as its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<-NULL
  }
  get <- function() x
  setinverse <- function() inv <<- solve(x)
  getinverse <- function() inv
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
}

## check if an inverse has been cached and return if true

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)){
            return(inv)
        }
        matrix <-x$get()
        inv <- solve(matrix)
        x$setinverse(inv)
        inv
}
