## Put comments here that give an overall description of what your
## functions do

## This function creates a special matrix objec that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  	m<-NULL
        set<-function(y) {
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setSolve<-function(solve) m<<-solve
        getSolve<-function() m
        list(set=set, get=get, 
             setSolve=setSolve, 
             getSolve=getSolve)

}


## This function computes the inverse of the special matrix returned by makeCacheMatrix above. If the inverse has already been calculated , then the cachesolve should retrieve the inverse from cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 	m<-x$getSolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setSolve(m)
        m
}
