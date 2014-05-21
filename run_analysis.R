RunAnalysis <- function( data.dir = ".", output.filename = "tidy.txt" ) {

    ## 0. Make sure needed libraries are loaded

    if ( !require( reshape2, quietly = TRUE ) ) {
        stop( "Could not load package 'reshape2'." )
    }

    ## 0.1 Load some convenience functions

    source("features.R")
    source("merge_data.R")

    ## 1. Merge traning data and test data into one data set

    data <- MergeData( data.dir )

    ## 2. Load the feature index and select a subset of features from the data

    fi <- FeaturesIndex( data.dir, select = "mean|std", ignore = "BodyBody" ) 

    data.sub <- data[, c( 1, 2, fi$index + 2 ) ]

    ## 3. Add descriptive column names

    colnames(data.sub) <- c( "subject", "activity", fi$feature.name )

    ## 4. Use descriptive activity labels in place of the numeric values

    ## 4.1 Read activity labels

    activity.labels.filename   <- file.path( data.dir, "activity_labels.txt" )

    activity.labels <- read.table( activity.labels.filename, 
                                   colClasses = c( "integer", "character" ) )

    ## 4.2 Substitue the descriptive activity labels in place of the 
    ##     numeric values

    data.sub$activity <- apply( data.sub, 1, 
                                 function(x) activity.labels[x[2],2] )

    ## 5. Create a tidy data set with average of each variable for 
    ##    each activity and each subject

    data.melt <- melt( data.sub, c("subject","activity") )

    data.tidy <- dcast( data.melt, ... ~ variable, mean )

    ## 5.1 Output the tidy data frame

    write.table( data.tidy, output.filename, row.names = F )

    ## 5.2 Return the tidy data frame for further use

    return( data.tidy )
}
