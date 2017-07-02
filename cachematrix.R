## Testing:
## 1. source("cachematrix.R")
## 2. cachedMatrix <- makeCacheMatrix(matrix(rnorm(9), nrow = 3, ncol = 3))
## 3. cacheSolve(cachedMatrix)
## 4. cacheSolve(cachedMatrix) # seconds run should yield message "getting cached data..."

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    get <- function() x
    setmatrix <- function(mtx) m <<- mtx
    getmatrix <- function() m
    list(get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    if(!is.null(m)) {
        message("getting cached data...")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setmatrix(m)
    m
}
