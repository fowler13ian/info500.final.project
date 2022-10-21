library(tidyverse)
library(dplyr)
library(labelled)
library(sjlabelled)
library(gtsummary)
library(ggplot2)
library(parameters)
library(kableExtra)

here::i_am('code/04_fig1.r')

project.data4 <- readRDS(
  here::here("output/project_data4.rds")
)

project.data4$region <- as.factor(project.data4$region)
fig1 <- ggplot(data=project.data4, aes(x=region, y=region.cases, fill = region.deaths)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_text(aes(label = region.cases), vjust = 0.01, color = "black") 

saveRDS(
  fig1,
  here::here("output/fig1.png")
)

print("figure 1 complete")
