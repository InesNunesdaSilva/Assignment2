# The first function (makeCacheMatrix), creates a special "matrix",
# which in reality is a list containing a function to:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of the matrix
# 4. get the value of the inverse of the matrix

# The following function (cacheSolve), calculates the inverse of the special "matrix"
# created with the function described above (makeCacheMatrix).
# However, first, it checks to see if the inverse has already been calculated.
# If so, it gets the inverse from the cache and skips the computation.
# Otherwise, it calculates the inverse of the matrix and sets the value of the inverse
# in the cache.



# Setting the value of the matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function (y){
    x<<-y
    m<<-NULL
  }

# Getting the value of the matrix
get <- function() x

# Setting the value of the inverse of the matrix
setinverse <- function(inverse) 
m <<- inverse

# Getting the value of the inverse of the matrix
getinverse <- function() 
m

# Returning a list in which each element is a function
list( set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



# Calculating the inverse of the matrix created with makeCacheMatrix
cacheSolve <- function(x, ...) {

# Getting the cached value
  m <- x$getinverse ()

# If there is a cached value (inverse), the message "getting cached data" appears
# and the value is returned
  if(!is.null(m)){
    message ("getting cached data")
    return (m)
}

# Otherwise the inverse is calculated and stored in the cache
    data <- x$get()
    m <- solve(data,...)
    x$setinverse(m)

# Returning the inverse matrix of 'x'
    m       
}
