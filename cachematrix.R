## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  k <- NULL
  set <- function(y) {
    x <<- y
    k <<- NULL
  }
get <- function() x
setinverse <- function(inverse) k <<- inverse
getinverse <- function() k
list(set = set,
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  k <- x$getinverse()
  if(!is.null(k)) {
    message("getting cached data")
    return(k)
  }
  data <- x$get()
  k <- solve(data, ...)
  x$setinverse(k)
  k
        ## Return a matrix that is the inverse of 'x'
}
