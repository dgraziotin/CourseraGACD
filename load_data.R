LoadData <- function( data.dir, data.set ) {

    ## Create the file names for the data

    input.file   <- file.path( data.dir, data.set,
                               paste("X_",data.set,".txt", sep="" ) )
    output.file  <- file.path( data.dir, data.set,
                               paste("y_",data.set,".txt", sep="" ) )
    subject.file <- file.path( data.dir, data.set,
                               paste("subject_",data.set,".txt", sep="" ) )

    data <- data.frame( read.table( subject.file, colClasses = "integer" ),
                        read.table( output.file,  colClasses = "integer" ),
                        read.table( input.file,   colClasses = "numeric" ) )

    return( data )

}
