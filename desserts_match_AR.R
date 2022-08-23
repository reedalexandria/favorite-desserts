library(tidyverse)
library(here)

favorite_desserts <- read_csv(here("favorite_desserts.csv"))
iconic_desserts <- read_csv(here("iconic_desserts.csv"))

combined <- full_join(favorite_desserts, iconic_desserts, by = c("Favorite_dessert" = "dessert"))

match <- iconic_desserts |>
  mutate(matching = case_when(
    dessert == "Brookie" ~ "Michelle match",
    dessert == "Chocolate Cake" ~ "Alex match",
    dessert == "Crepes" ~ "Julien match",
    TRUE ~ "No match"
  ))

filter(dessert %in% str_detect(favorite_desserts[2,3], c("Brookie","Chocolate cake", "Crepe"))