#import data
kaggle_data <- read.csv("kaggle_survey_2021_responses.csv", stringsAsFactors = TRUE)
head(kaggle_data)
##list of column names
colnames(kaggle_data)

##clean data by removing first row
kaggle_data <- kaggle_data[-1,]
head(kaggle_data[["Q1"]])

## create a correlation matrix
summary(kaggle_data)
