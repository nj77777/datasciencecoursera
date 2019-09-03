## Put comments here that give an overall description of what your
## functions do

## This function sets and gets the vector and its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
  
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function calculates the inverse mean of the special "vector" created with the above function. 
## It first checks to see if the inverse has already been calculated. 
## It calculates the inverse of the data and sets the value of the mean in the cache via the setinverse function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solver(data, ...)
    x$setinverse(i)
    i 
  
}
