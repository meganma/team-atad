#import data
kaggle_data <- read.csv("kaggle_survey_2021_responses.csv", stringsAsFactors = TRUE)
head(kaggle_data)
##list of column names
colnames(kaggle_data)

##clean data by removing first row
kaggle_data <- kaggle_data[-1,]

## all job titles
head(kaggle_data[["Q5"]])
levels(kaggle_data[["Q5"]])
jobtitles <- c("Business Analyst","Data Analyst","Data Engineer", "Data Scientist", "Machine Learning Engineer","Research Scientist", "Software Engineer", "Statistician")
nrow(kaggle_data)

#extract all the rows from kaggle_data with these job titles.
#extract all the rows from kaggle_data with the cols we are interested in
head(as.character(kaggle_data[,"Q5"]) == jobtitles)

index <- (as.character(kaggle_data[,"Q5"])) %in% jobtitles
new_data <- kaggle_data[index,]
nrow(new_data)

focused_df <- cbind(new_data$Q5, new_data$Q4, new_data$Q6, new_data$Q8) 
head(focused_df)


#plot job title frequencies
plot(new_data[["Q5"]], col = 1:8)

#degree exploration
new_data[["Q4"]] <- droplevels(new_data[["Q4"]])
levels(new_data[["Q4"]]) <- c("Bachelor's", "Doctoral", "No Response", "Master's", "No education", "Professional Doctorate", "Some college/university")

cor(focused_df)
#moderate correlation between Q5 and Q6

