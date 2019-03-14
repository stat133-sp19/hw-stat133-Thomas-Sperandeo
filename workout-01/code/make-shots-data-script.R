#Title: Make Shots Data Script
#Description: This script file was created for the purpose of importing our individual player data sets from our data folder, manipulating the data frames created and exporting their summaries as .txt files.  
#Input: iguodala, curry, thompson, durant, green
#Output: summary_iguodala, summary_curry, summary_durant, summary_green, shots_data


##Importing data tables into our script file
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

##Adding player name columns to each data frame
iguodala$name <- "andre iguodala"
curry$name <- "stephen curry"
durant$name <- "kevin durant"
green$name <- "draymond green"
thompson$name <- "klay thompson"

##Changing values of n to shot-missed and y to shot_madefrom shot-made-flag
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_missed"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_made"

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_missed"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_made"

durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_missed"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_made"

green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_missed"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_made"

thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_missed"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_made"


##Adding minute column
iguodala$minute <- (iguodala$period*12) - iguodala$minutes_remaining
curry$minute <- (curry$period*12) - curry$minutes_remaining
durant$minute <- (durant$period*12) - durant$minutes_remaining
green$minute <- (green$period*12) - green$minutes_remaining
thompson$minute <- (thompson$period*12) - thompson$minutes_remaining

##Using sink()  to send the summary() output of each imported data frame into individuals text ???les
sink("../output/andre-iguodala-summary.txt")
summary_iguodala <- summary(iguodala)
summary_iguodala
sink()

sink("../output/stephen-curry-summary.txt")
summary_curry <- summary(curry)
summary_curry
sink()

sink("../output/kevin-durant-summary.txt")
summary_durant <- summary(durant)
summary_durant
sink()

sink("../output/draymond-green-summary.txt")
summary_green <- summary(green)
summary_green
sink()

sink("../output/klay-thompson-summary.txt")
summary_thompson <- summary(thompson)
summary_thompson
sink()

#Using rbind() to create one single data frame and sinking summary
shots_data <- rbind(iguodala, curry, durant, green, thompson)
shots_data

write.csv(shots_data, "../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
summary(shots_data)
sink()

