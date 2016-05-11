## cacheSolve calculates and then returns the inverse of a matrix
##
## makeCache returns the inverse of a matrix,
##        first checking to see if it has it in cache,
##        otherwise calculating it 

##########################################
## makeCacheMatrix
## returns the inverse of a given matrix, looking in cache first
## @params
##    1 - x -matrix
## @returns
##    1 - matrix
makeCacheMatrix <- function(x = matrix()) {
  cached_matrix <- NULL
  ## set the matrix
  set <- function(y){
    x <<-y
    cached_matrix <<- NULL
  }
  get <- function() x                                       ## get the matrix
  setinverse <- function(inverse) cached_matrix <<- inverse ## set the inverted matrix
  getinverse <- function() cached_matrix                    ## get the inverted martix
  list(get = get, set = set, setinverse = setinverse, getinverse = getinverse)
}


##########################################
## cacheSolve
## returns the inverse of a given matrix
## @params
##    x (matrix)
## @returns
##    (matrix)
cacheSolve <- function(x, ...) {
  cached_matrix <- x$getinverse()
  ## check to see if the inverse has already been calculated
  if(!is.null(cached_matrix)){
    message("getting cached data")
    return(cached_matrix)
  } 
  ## cached_matrix did not exist so have to calculate the inverse
  inverted_matrix <- solve(x$get(), ...) ## magic happens here, not sure how but apparently 'solve' inverts a matrix
  ## now set the inverse on x so it can be cached
  x$setinverse(inverted_matrix)
  ## finally return the inverted matrix
  return(inverted_matrix)
}
