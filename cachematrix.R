## These pair of functions provides feature to cache results of computationally
## intensive solve() call
##

## makeCacheMatrix defines the interface to calculate and access inverse of a matrix
##
## Pair of $get and $set functions allow to access and change the matrix,
## while $inverse function does the job of calculating and returning cached data
##
## As $inverse function supports parameters forwarding to solve(x, ...) it 
## also recalculates inversion if parameters list has been changed since last call
##

makeCacheMatrix <- function(x = matrix())
{
    cached_solve <- NULL
    cached_solve_parameters <- list()

    set <- function(y)
    {
        x <<- y
        cached_solve <<- NULL
    }
    
    get <- function()
    {
        x
    }
        
    inverse <- function(...)
    {
        if (is.null(cached_solve) || !identical(list(...), cached_solve_parameters))
        {
            message("solving matrix")
            cached_solve <<- solve(x, ...)
            cached_solve_parameters <<- list(...)
        }

        cached_solve    
    }

    list(set = set, get = get, inverse = inverse)
}

##
## Returns a matrix that is the inverse of 'x'
##
## In fact this is a simple wrapper to call $inverse
## function generated by makeCacheMatrix()
## 

cacheSolve <- function(x, ...)
{
    x$inverse(...)
}

