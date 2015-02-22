## This code was written by Chitra Shukla to test the inverse caching concept 

chitraMatrix <- function(x = matrix()) {
        i <- NULL ## Creating a blank matrix to store Inverse
        set <- function(y) {
                x <<- y  ## Assign new matrix
                i <<- NULL
        }
        get <- function() x
        ##Inverse calculation
        setsolve <- function(solve) i <<- solve 
        
        #Cache value
        getsolve <- function() i 
        
        ##Store the values in a list and return the list
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## Caching function
cacheSolve <- function(x, ...) {
        i <- x$getsolve() #Check if matrix x is cached
        if(!is.null(i)) {
                message("getting cached data") # get the cached value
                return(i)
        }
        data <- x$get() #Calculating inverse
        i <- solve(data, ...) 
        x$setsolve(i) #Caching Inverse data
        i
}

