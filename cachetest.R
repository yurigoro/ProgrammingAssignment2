##
## Usage example
##

source("cachematrix.R")

m <- makeCacheMatrix(matrix(1:4, 2, 2))
cacheSolve(m)
cacheSolve(m)
cacheSolve(m, tol = 0.01)
cacheSolve(m, tol = 0.01)

##
## Output:
##
## solving matrix
##
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
##
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## 
## solving matrix
## 
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## 
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

