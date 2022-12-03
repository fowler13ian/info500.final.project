pacman::p_load(tidyverse, 
               dplyr, 
               labelled, 
               sjlabelled, 
               gtsummary, 
               ggplot2, 
               parameters, 
               kableExtra)

#loading data

here::i_am('code/00_clean-data.r')

project.data <- read.csv(
  here::here('raw_data/archive/data.csv')
)

saveRDS(
  project.data,
  here::here("output/project_data1.rds")
)

#cleaning data

project.data1 <- readRDS(
  here::here("output/project_data1.rds")
)

drop <- c("Link", "Date")
project.data2 <- project.data1[,!(names(project.data1) %in% drop)]

project.data2$Country[project.data2$Country == "UK"] <- "United Kingdom"
project.data2$Country[project.data2$Country == "United Kingdom, Isle of Man, Crown Dependency"] <- 
                                       "Isle of Man, Crown Dependency"
project.data2$Country[project.data2$Country == "United Kingdom, Jersey, Crown Dependency"] <- 
                                       "Jersey, Crown Dependency"

#adding summary variables

project.data2 <- project.data2 %>%
  group_by(Country) %>%
  mutate(total.cases = max(Cumulative.no..of.cases))

project.data2 <- project.data2 %>%
  group_by(Country) %>%
  mutate(total.deaths = max(Cumulative.no..of.deaths))

drop2 <- c("Cumulative.no..of.cases", "Cumulative.no..of.deaths")
project.data2 <- project.data2[,!(names(project.data2) %in% drop2)]

#removing duplicates

project.data2 <- project.data2[!duplicated(project.data2$Country), ]

saveRDS(
  project.data2,
  here::here("output/project_data2.rds")
)

print("data cleaning complete")
