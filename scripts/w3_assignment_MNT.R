
# Loading and Filtering Data ----------------------------------------------

#Load your library if you don't already have it installed

library(tidyverse)

#loading data from another site or you might already have this data in your data folder
download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")

#bringing the data into R and assigning/labeling it as "surveys"
surveys <- readr::read_csv("data/portal_data_joined.csv")

##Using dplyr, filter data to hindfoot_length > 10, and months between May and October.

filter(surveys,hindfoot_length >10, month == 5:10)


##Then use a %>% and select the following columns: weight, hindfoot_length, month, species_id
surveys2 <- filter(surveys) %>% 
  select(weight, hindfoot_length, month, species_id)

##Check how many NAs are in the dataframe
sum(is.na(surveys2$weight))
##This checks the amount of NA's within a specific column. Here we are telling R to look at the column "weight" within the filtered surveys2 data frame.There are 2503 NA's in the weight column of this filtered data


##This creates a table so we can see how many observations there are per species.

table(surveys2$species_id)

#DM had the most with 10596 observations
#CS,CT,CU,CV,SC, and ST had the least with 1 observation each.



# Plotting ----------------------------------------------------------------

##This makes a basic histogram plot, "$" subsets just the weight column for this plot.
hist(surveys2$weight)

##Adjusting the labels so that the plot is easier to read. Here I've changed the x-axis label and the title only. 
hist(surveys2$weight,xlab="Weight", main="Histogram of Weight")

