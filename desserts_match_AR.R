# Michelle comment
# I don't like your comment
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

# Erika example:

library(tidyverse)
library(here)
library(janitor)

iconic <- read_csv(here("iconic_desserts.csv")) # file to compare favorites to
fave <- read_csv(here("favorite_desserts.csv")) %>%
  clean_names() # file with no match
fave_test <- read_csv(here("favorite_desserts_test.csv")) %>%
  clean_names() # file with a match


# Test with no matches
matches <- c()

for (i in seq_along(fave$favorite_dessert)) {
  for (j in seq_along(iconic$dessert)) {
    if (fave$favorite_dessert[i] == iconic$dessert[j]) {
      matches <- append(matches, fave$favorite_dessert[i])
    }
  }
}

if (length(matches) == 0) {
  message("No matches.")
}

if (length(matches) != 0) {
  print(matches_test)
}

# should output No matches.

# Test with a match
matches_test <- c()


for (i in seq_along(fave_test$favorite_dessert)) {
  for (j in seq_along(iconic$dessert)) {
    if (fave_test$favorite_dessert[i] == iconic$dessert[j]) {
      matches_test <- append(matches_test, fave_test$favorite_dessert[i])
    }
  }
}


if (length(matches_test) == 0) {
  message("No matches.")
}

if (length(matches_test) != 0) {
  print(matches_test)
}

# Should output "Shave ice" or whatever match is in your file