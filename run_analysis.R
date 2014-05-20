run_analysis <- function( dataDir ) {

    ## 0. Load some convenience functions

    source("features.R")
    source("mergeData.R")

    ## 1. Merge traning data and test data into one data set

    data <- mergeData( dataDir )

    ## 2. Load the feature index and select a subset of features from the data

    fi <- featuresIndex( dataDir, select = "mean|std", ignore = "BodyBody" ) 

    data.sub <- data[, c( 1, 2, fi$index + 2 ) ]

    ## 3. Add descriptive column names

    colnames(data.sub) <- c( "subject", "activity", fi$feature.name )

    ## Read activity labels

    activity.labels.filename   <- file.path( dataDir, "activity_labels.txt" )

    activity.labels <- read.table( activity.labels.filename, 
                                   colClasses = c( "integer", "character" ) )

    ## 4. Use descriptive activity labels in place of the numeric values

     data.sub$activity <- apply( data.sub, 1, 
                                 function(x) activity.labels[x[2],2] )

    ## 5. Create a tidy data set with average of each variable for 
    ##    each activity and each subject

    ## Make an ordered list of the unique combinations of subject and activity

    trials <- unique( data.sub[, c( 'subject', 'activity' ) ] )

    trials <- trials[order(trials$subject),]

    ## Create the tiny data frame

    tidy.data <- data.sub[1:nrow(trials),]

    for ( t in seq_len( nrow( trials ) ) ) {
        trial <- data.sub[data.sub$subject == trials[t,1] &
                          data.sub$activity == trials[t,2], ]

        trial.means <- colMeans( trial[,3:ncol(trial)] )

        tidy.data[t,1] <- trials[t,1]
        tidy.data[t,2] <- trials[t,2]
        tidy.data[t,3:ncol(trial)] <- trial.means
    }

    return( tidy.data )
}
