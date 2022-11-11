pacman::p_load(tidyverse, 
               dplyr, 
               labelled, 
               sjlabelled, 
               gtsummary, 
               ggplot2, 
               parameters, 
               kableExtra,
               tmap)

here::i_am('code/05_map1.r')

project.data4 <- readRDS(
  here::here("output/project_data4.rds")
)

project.data4["1", ] <- project.data4["1", ] + project.data4["5", ]
project.data4[rownames(project.data4) != "5", ]
project.data4$region[project.data4$region.cases > 20000] <- 1

world.map2 <- get(load(
  here::here("output/world_map2.RData")
))



#Spatial Join

map_data <- world.map2 %>%
            left_join(project.data4, by = 'region') %>%
            select('region', 'region.cases', 'region.deaths', 'geometry')

map1 <- tm_shape(map_data) +
          tm_fill('region.cases',
                  style = 'fixed',
                  breaks = c(0, 2000, 7000, 11000, 15000, 60000),
                  title = 'Number of Cases per Region') + 
          tm_borders() +
          tm_layout(legend.position = c('left', 'center'),
                    legend.title.size = 0.8,
                    main.title = 'H1N1 Cases by Geographic Region')

tmap_save(
  map1,
  here::here("output/map1.png")
)

print("map 1 complete")
