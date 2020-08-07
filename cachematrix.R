## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Function that creates a special matrix to deal with
## the cache problem
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x 
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get, setsolve = setsolve,
         getsolve = getsolve)

}


## Write a short comment describing this function
## Function that checks if there is a value for the
## inverse matrix in the cache, if so it returns it,
## else it will calculate a new inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    m <- x$getsolve()
    if (!is.null(m)) {
        message("getting matrix from cache")
        return(m)
    }
    data <- x$get() 
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
