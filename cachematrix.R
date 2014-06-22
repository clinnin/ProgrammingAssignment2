
## Creates a series of functions that can be called to cache
## the inverse (s) of a provided, inversible matrix (x)

makeCacheMatrix <- function(x = matrix()) {
  
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(savedsolve) s <<- savedsolve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
  


## Determines if the inverse has been calculated.
## If it has, returns the cached inverse. Otherwise, calculates it.

cacheSolve <- function(x, ...) {
  
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)a
  s
}