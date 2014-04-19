## These functions work together to store caches of inverses of matrices
## so that no inversions need to be repeated

## The first function, makeCacheMatrix creates a list
## containing four functions:
## 1. sets the value of the matrix
## 2. gets the value of the matric
## 3. sets the value of the inverse using solve()
## 4. gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## This function, cacheSolve first checks if the inverse has already been calculated
## If so, it gets the inverse
## If not, it calculates the inverse using solve()
## and sets it for future use using setinv.

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(m)
        i
}
