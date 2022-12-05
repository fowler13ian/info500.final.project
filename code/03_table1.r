library(tidyverse)
library(dplyr)
library(labelled)
library(sjlabelled)
library(gtsummary)
library(ggplot2)
library(parameters)
library(kableExtra)

here::i_am('code/03_table1.r')

project.data4 <- readRDS(
  here::here("output/project_data4.rds")
)

table_data <- project.data4[order(project.data4$region, decreasing = FALSE),]

table1 <- kable(table_data, caption = "Table 1: Region Case & Death Data", col.names = c("Geographic Region", 
                                                                          "Total Cases by Region",
                                                                          "Total Deaths by Region")) %>%
          kable_styling(bootstrap_options = "striped", full_width = T)

saveRDS(
  table1,
  here::here("output/table1.rds")
)

print("table 1 complete")
