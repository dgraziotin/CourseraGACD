mergeData <- function( data.dir ) {

    ## Load the training data

    train.input.file   <- file.path( data.dir, "train","X_train.txt" )
    train.output.file  <- file.path( data.dir, "train","y_train.txt" )
    train.subject.file <- file.path( data.dir, "train","subject_train.txt" )

    train.input   <- read.table( train.input.file, colClasses = "numeric" )
    train.output  <- read.table( train.output.file, colClasses = "integer" )
    train.subject <- read.table( train.subject.file, colClasses = "integer" )

    ## Merge training data

    train <- data.frame( train.subject, train.output, train.input )

    ## Load the test data

    test.input.file   <- file.path( data.dir, "test","X_test.txt" )
    test.output.file  <- file.path( data.dir, "test","y_test.txt" )
    test.subject.file <- file.path( data.dir, "test","subject_test.txt" )

    test.input   <- read.table( test.input.file, colClasses = "numeric" )
    test.output  <- read.table( test.output.file, colClasses = "integer" )
    test.subject <- read.table( test.subject.file, colClasses = "integer" )

    ## Merge testing data

    test <- data.frame( test.subject, test.output, test.input )

    ## Merge the training data with the test data

    data <- rbind( train, test )

    return( data )

}
