## test_matrix_cache.R

my_data <- c(5,0,0,5)
my_matrix <- matrix(my_data,2,2)

my_matrix
## should hold the following
## [,1] [,2]
## [1,]    5    0
## [2,]    0    5

solve(my_matrix)
## should display following - this is to test that solve works
## [,1] [,2]
## [1,]  0.2  0.0
## [2,]  0.0  0.2

## set up the list object to hold the matrix, inverse etc
cached_matrix <- makeCacheMatrix(my_matrix)

## inspect cached_matrix, see if it has been sucessfully set
cached_matrix$get()
## [,1] [,2]
## [1,]    5    0
## [2,]    0    5

# now solve the matrix the first time, should just show the inverted cache
cacheSolve(cached_matrix)
## [,1] [,2]
## [1,]  0.2  0.0
## [2,]  0.0  0.2

## inspect cached_matrix, should hold the inverted matrix
cached_matrix$getinverse()
## [,1] [,2]
## [1,]  0.2  0.0
## [2,]  0.0  0.2

# now solve the matrix the second time, should show the inverted cache and a message 
cacheSolve(cached_matrix)
## getting cached data
## [,1] [,2]
## [1,]  0.2  0.0
## [2,]  0.0  0.2
