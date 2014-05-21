mergeData <- function( data.dir ) {

    ## Load the training data

    input.file   <- file.path( data.dir, "train","X_train.txt" )
    output.file  <- file.path( data.dir, "train","y_train.txt" )
    subject.file <- file.path( data.dir, "train","subject_train.txt" )

    train <- data.frame( read.table( subject.file, colClasses = "integer" ),
                         read.table( output.file,  colClasses = "integer" ),
                         read.table( input.file,   colClasses = "numeric" ) )

    ## Load the test data

    input.file   <- file.path( data.dir, "test","X_test.txt" )
    output.file  <- file.path( data.dir, "test","y_test.txt" )
    subject.file <- file.path( data.dir, "test","subject_test.txt" )

    test <- data.frame( read.table( subject.file, colClasses = "integer" ),
                        read.table( output.file,  colClasses = "integer" ),
                        read.table( input.file,   colClasses = "numeric" ) )


    ## Merge the training data with the test data

    data <- rbind( train, test )

    return( data )

}
