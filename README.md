CourseraGACD
------------

Coursera Getting and Cleaning Data Course Project

##Purpose

The purpose of this project is to demonstrate the conversion of raw data
into a tidy data set.

The raw data comes from the 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the
University of California Irvine Machine Learning Repository (UCI-MLR).

##Instruction List

The script for performing the conversion is `run_analysis.R`.  This file should be loaded into the users R environment.

The main entry point into the script is the function `RunAnalysis`. As 
**input** it takes the 
name of the directory in which the data is stored. (Default is the current 
working directory.) As **output** it creates a file containing the tidy data. 
(Default filename is `tidy.txt`.)

`RunAnalysis` performs the following steps:

1. Calls `loadData` to load the training data and test data into separate 
   data frames and then merges them into a single data frame.
2. Calls `FeaturesIndex` to load the features index and select the desired
   subset of features.  (See the [Code Book](CodeBook.md) for more details 
   on how the subset is selected.)
   After selecting the desired features the data from step 1 is
   subsetted to include only data related to those features.
3. Adds descriptive names to each of the remaining columns to make the
   data easier to understand.
4. Replaces activity levels by descriptive names to make them easier
   to understand.
5. Creates a smaller data set representative of the complete data set by
   taking the mean value of the remaining features for each combination of
   the identifying variables. (See the [Code Book](CodeBook.md) for details 
   on the 
   identifying variables.) After this tidy data set has been constructed, it is
   written to disk as a text file.

Further documentation on each routine can be found in the individual files.

##File List

filename |  purpose
:----------|:---------
run_analysis.R | Main R script.
load_data.R | An R script to load data from the subdirectories
features.R | An R script to load the feature index and select the ones desired
CodeBook.md | The Code Book describing the data, especially the tidy data.
README.md | The file.
LICENSE | A software license giving the user the freedom to use the code.
tidy.txt | Example output file.
