# R4DS (2e)

## Chapter 1: Data Visualization

## To have hands on practice on codes mentioned in book

## Created on 13 Sept 2024

library(pacman)
p_load(tidyverse, conflicted,
       palmerpenguins,
       ggthemes,
       ggthemr,
       DT
       )

conflicts_prefer(dplyr::filter)
conflicts_prefer(dplyr::lag)

ggthemr("fresh")
# OBJECTIVES ------

## Do penguins with longer flippers weigh more or
## less than penguins with shorter flippers?

# LOAD DATA -----
?penguins

datatable(penguins)

## There are 8 columns
glimpse(penguins)

## Includes measurements for penguin species, island in 
## Palmer Archipelago, size (flipper length, body mass, bill dimensions), and sex.


# VIZUALIZE -----

## note that there are 2 missing values hence there's 
## warning message
penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g,
             )) +
  geom_point(aes(col = species,
                 shape = species)) +
  geom_smooth(method = 'lm')  + # based on linear model
  labs(
    title = "Body mass and flipper length",
    caption = "Source: Palmer Penguins Dataset"
  ) +
  scale_color_colorblind()
