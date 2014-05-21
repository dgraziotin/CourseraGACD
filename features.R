## This function loads the feature index from the "features.txt" file in the
## specified directory
##
## input: data.dir - directory containing the UCI HAR dataset
##        select   - a regex expression selecting the features of interest
##        ignore   - a regex expression to drop some of the selected features
##
## output: a data frame with the feature index in column 1 and a human 
##         readable description in column 2.

FeaturesIndex <- function( data.dir, select = ".", ignore = "~" ) {

    ## load the index of features

    features.list.filename <- file.path( data.dir, "features.txt" )

    fl <- read.table( features.list.filename, 
                      colClasses = c( "integer", "character" ) )

    ## find the features of interest

    regex <- paste("^(?=.*?\\b(",select,")\\b)((?!",ignore,").)*$",sep="")

    sub <- apply( fl, 1, function(x) grepl( regex, x[2], perl=T ) )
    fl.sub <- fl[sub,]

    ## convert the feature names into valid R column names

    fl.sub$V3 <- apply( fl.sub, 1, 
                        function(x) make.names( gsub("\\(\\)","",
                                gsub("([A-W])","-\\L\\1",x[2],perl=T)) ) )

    fl.sub$V2 <- NULL

    ## Add column names to the data frame

    colnames(fl.sub) <- c( "index", "feature.name" )

    return( fl.sub )
}
