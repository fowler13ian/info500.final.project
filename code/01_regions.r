pacman::p_load(tidyverse, 
               dplyr, 
               labelled, 
               sjlabelled, 
               gtsummary, 
               ggplot2, 
               parameters, 
               kableExtra)

here::i_am('code/01_regions.r')

project.data2 <- readRDS(
  here::here("output/project_data2.rds")
)

#creating indicator variables

project.data2$north.america <- ifelse(project.data2$Country == "United States of America" | 
                                        project.data2$Country == "Canada" | 
                                        project.data2$Country == "Mexico", 
                                       1, 0)

project.data2$central.america <- ifelse(project.data2$Country == "Antigua and Barbuda" |
                                          project.data2$Country == "Bahamas" |
                                          project.data2$Country == "Barbados" |
                                          project.data2$Country == "Bermuda, UKOT" |
                                          project.data2$Country == "British Virgin Islands, UKOT" |
                                          project.data2$Country == "Cayman Islands, UKOT" |
                                          project.data2$Country == "Costa Rica" |
                                          project.data2$Country == "Cuba" |
                                          project.data2$Country == "Dominica" |
                                          project.data2$Country == "Dominican Republic" |
                                          project.data2$Country == "EL Salvador" |
                                          project.data2$Country == "Guadaloupe, FOC" |
                                          project.data2$Country == "Guatemala" |
                                          project.data2$Country == "Honduras" |
                                          project.data2$Country == "Jamaica" |
                                          project.data2$Country == "Martinique, FOC" |
                                          project.data2$Country == "Netherlands Antilles, Curaçao" |
                                          project.data2$Country == "Netherlands Antilles, Sint Maarten" |
                                          project.data2$Country == "Netherlands, Aruba" |
                                          project.data2$Country == "Netherlands, Curacao, OT" |
                                          project.data2$Country == "Panama" |
                                          project.data2$Country == "Puerto Rico" |
                                          project.data2$Country == "Saint Lucia" |
                                          project.data2$Country == "Saint Martin, FOC" |
                                          project.data2$Country == "Trinidad and Tobago",
                                         1, 0)

project.data2$south.america <- ifelse(project.data2$Country == "Argentina" |
                                        project.data2$Country == "Bolivia" |
                                        project.data2$Country == "Brazil" |
                                        project.data2$Country == "Chile" |
                                        project.data2$Country == "Columbia" |
                                        project.data2$Country == "Ecuador" |
                                        project.data2$Country == "Guyana" |
                                        project.data2$Country == "Nicaragua" |
                                        project.data2$Country == "Paraguay" |
                                        project.data2$Country == "Peru" |
                                        project.data2$Country == "Suriname" |
                                        project.data2$Country == "Uruguay" |
                                        project.data2$Country == "Venezuela", 
                                       1, 0)

project.data2$africa <- ifelse(project.data2$Country == "Algeria" |
                                 project.data2$Country == "Cap Verde" |
                                 project.data2$Country == "Cote d'Ivoire" |
                                 project.data2$Country == "Egypt" |
                                 project.data2$Country == "Kenya" |
                                 project.data2$Country == "Libia" |
                                 project.data2$Country == "Mauritius" |
                                 project.data2$Country == "Morocco" |
                                 project.data2$Country == "South Africa" |
                                 project.data2$Country == "Tunisia" |
                                 project.data2$Country == "Uganda",
                                1, 0)

project.data2$oceania <- ifelse(project.data2$Country == "Australia" |
                                  project.data2$Country == "Cook Island" |
                                  project.data2$Country == "Fiji" |
                                  project.data2$Country == "France, French Polynesia, FOC" |
                                  project.data2$Country == "New Caledonia, FOC" |
                                  project.data2$Country == "New Zealand" |
                                  project.data2$Country == "Samoa" |
                                  project.data2$Country == "Vanuatu",
                                 1, 0)

project.data2$europe <- ifelse(project.data2$Country == "Austria" |
                                 project.data2$Country == "Belgium" |
                                 project.data2$Country == "Bosnia and Hezegovina" |
                                 project.data2$Country == "Bulgaria" |
                                 project.data2$Country == "Croatia" |
                                 project.data2$Country == "Czech Republic" |
                                 project.data2$Country == "Denmark" |
                                 project.data2$Country == "Estonia" |
                                 project.data2$Country == "Finland" |
                                 project.data2$Country == "France" |
                                 project.data2$Country == "Germany" |
                                 project.data2$Country == "Greece" |
                                 project.data2$Country == "Guernsey, Crown Dependency" |
                                 project.data2$Country == "Hungary" |
                                 project.data2$Country == "Iceland" |
                                 project.data2$Country == "Ireland" |
                                 project.data2$Country == "Isle of Man, Crown Dependency" |
                                 project.data2$Country == "Italy" |
                                 project.data2$Country == "Jersey, Crown Dependency" |
                                 project.data2$Country == "Latvia" |
                                 project.data2$Country == "Lithuania" |
                                 project.data2$Country == "Luxembourg" |
                                 project.data2$Country == "Malta" |
                                 project.data2$Country == "Monaco" |
                                 project.data2$Country == "Montenegro" |
                                 project.data2$Country == "Netherlands" |
                                 project.data2$Country == "Norway" |
                                 project.data2$Country == "Poland" |
                                 project.data2$Country == "Portugal" |
                                 project.data2$Country == "Romania" |
                                 project.data2$Country == "Russia" |
                                 project.data2$Country == "Serbia" |
                                 project.data2$Country == "Slovakia" |
                                 project.data2$Country == "Slovenia" |
                                 project.data2$Country == "Spain" |
                                 project.data2$Country == "Sweden" |
                                 project.data2$Country == "Switzerland" |
                                 project.data2$Country == "Ukraine" |
                                 project.data2$Country == "United Kingdom",
                                1, 0)

project.data2$asia <- ifelse(project.data2$Country == "Bangladesh" |
                               project.data2$Country == "Brunei Darussalam" |
                               project.data2$Country == "Cambodia" |
                               project.data2$Country == "China" |
                               project.data2$Country == "Hong Kong Special Administrative Region" |
                               project.data2$Country == "India" |
                               project.data2$Country == "Indonesia" |
                               project.data2$Country == "Japan" |
                               project.data2$Country == "Laos" |
                               project.data2$Country == "Malaysia" |
                               project.data2$Country == "Mayanmar" |
                               project.data2$Country == "Nepal" |
                               project.data2$Country == "Palau" |
                               project.data2$Country == "Papua New Guinea" |
                               project.data2$Country == "Philippines" |
                               project.data2$Country == "Republic of Korea" |
                               project.data2$Country == "Singapore" |
                               project.data2$Country == "Sri Lanka" |
                               project.data2$Country == "Thailand" |
                               project.data2$Country == "Viet Nam" |
                               project.data2$Country == "Bahrain" |
                               project.data2$Country == "Cyprus" |
                               project.data2$Country == "Iran" |
                               project.data2$Country == "Iran, Islamic Republic" |
                               project.data2$Country == "Iraq" |
                               project.data2$Country == "Israel" |
                               project.data2$Country == "Jordan" |
                               project.data2$Country == "Kuwait" |
                               project.data2$Country == "Lebanon" |
                               project.data2$Country == "Oman" |
                               project.data2$Country == "Qatar" |
                               project.data2$Country == "Saudi Arabia" |
                               project.data2$Country == "Turkey" |
                               project.data2$Country == "United Arab Emirates" |
                               project.data2$Country == "West Bank and Gaza Strip" |
                               project.data2$Country == "Yemen",
                              1, 0)

#creating categorical variable

project.data2 <- mutate(project.data2, region = ifelse(north.america == 1, 1,
                                       ifelse(central.america == 1, 2,
                                              ifelse(south.america == 1, 3,
                                                     ifelse(europe == 1, 4,
                                                            ifelse(africa == 1, 5,
                                                                   ifelse(asia == 1, 6, 7)))))))

#relabeling variables

var_label(project.data2) <- list(
  Country = "Country",
  total.cases = "Total Cases",
  total.deaths = "Total Deaths",
  north.america = "North America",
  central.america = "Central America & the Caribbean",
  south.america = "South America",
  europe = "Europe",
  africa = "Africa",
  asia = "Asia",
  oceania = "Oceania",
  region = "Geographic Region"
)

project.data3 <- project.data2

saveRDS(
  project.data3,
  here::here("output/project_data3.rds")
)

print("indicators complete")