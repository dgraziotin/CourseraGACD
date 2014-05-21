## A function for loading the specified data set from the specified directory
##
## input: data.dir - directory containing the UCI HAR dataset
##        data.set - the data set to load ("train" or "test" )
##
## output: a data frame with the subject id in column one, the activity id in
##         in column 2 and the features in the remaining columns
##

LoadData <- function( data.dir, data.set ) {

    ## Create the file names for the data

    input.file   <- file.path( data.dir, data.set,
                               paste("X_",data.set,".txt", sep="" ) )
    output.file  <- file.path( data.dir, data.set,
                               paste("y_",data.set,".txt", sep="" ) )
    subject.file <- file.path( data.dir, data.set,
                               paste("subject_",data.set,".txt", sep="" ) )

    ## load data into a single data frame

    data <- data.frame( read.table( subject.file, colClasses = "integer" ),
                        read.table( output.file,  colClasses = "integer" ),
                        read.table( input.file,   colClasses = "numeric" ) )

    return( data )

}
