## This function loads the feature index from the "features.txt" file in the
## specified directory
##
## The default is to load all features. With the select and ignore options one
## choose a subset of features to load. Both select and ignore expect a regex
## expression.

featuresIndex <- function( data.dir, select = ".", ignore = "~" ) {

    ## load the index of features

    featuresListFilename <- file.path( data.dir, "features.txt" )

    fl <- read.table( featuresListFilename, 
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
