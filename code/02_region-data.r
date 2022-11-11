pacman::p_load(tidyverse, 
               dplyr, 
               labelled, 
               sjlabelled, 
               gtsummary, 
               ggplot2, 
               parameters, 
               kableExtra)

here::i_am('code/02_region-data.r')

project.data3 <- readRDS(
  here::here("output/project_data3.rds")
)

#reorganizing data

drop3 <- c("Country", "north.america", "central.america", "south.america", 
           "europe", "africa", "asia", "oceania")
project.data3 <- project.data3[,!(names(project.data3) %in% drop3)]

#adding summary variables

project.data3 <- project.data3 %>%
  group_by(region) %>%
  mutate(region.cases = sum(total.cases))

project.data3 <- project.data3 %>%
  group_by(region) %>%
  mutate(region.deaths = sum(total.deaths))

#keeping only summary variables

drop4 <- c("total.cases", "total.deaths")
project.data3 <- project.data3[,!(names(project.data3) %in% drop4)]

project.data3 <- project.data3[!duplicated(project.data3$region), ]

#relabeling variables

var_label(project.data3) <- list(
  region.cases = "Total Cases by Region",
  region.deaths = "Total Deaths by Region")

project.data4 <- project.data3

saveRDS(
  project.data4,
  here::here("output/project_data4.rds")
)

print("new data set complete")
