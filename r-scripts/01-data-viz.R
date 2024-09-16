# R4DS (2e)

## Chapter 1: Data Visualization

## To have hands on practice on codes mentioned in book

## Created on 13 Sept 2024

library(pacman)
p_load(tidyverse, conflicted,
       palmerpenguins,
       ggthemes,
       ggthemr,
       DT,
       patchwork, # to patch figures
       here # to save plots to figures
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

## There are 8 columns, 344 rows
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
    caption = "Source: palmerpenguin package"
  ) +
  scale_color_colorblind()


## Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
## That is, make a scatterplot with bill_depth_mm on the y-axis 
## and bill_length_mm on the x-axis. 
## Describe the relationship between these two variables.

glimpse(penguins)

penguins %>% 
  ggplot(aes(
    x = bill_length_mm,
    y = bill_depth_mm
  )) +
  geom_point(aes(col = species, 
                 shape = species
                 ),
             na.rm = T) +
  geom_smooth(method = 'lm') +
  labs(title = "Bill Depth vs Bill Length",
       subtitle = "As bill length increases, bill depth decreases",
       caption = "Source: palmerpenguin package") +
  scale_color_colorblind()


## Visulize body mass vs flipper length
## Map at geom level
penguins %>% 
  ggplot(
    aes(x = flipper_length_mm,
        y = body_mass_g)
  ) +
  geom_point(aes(col = bill_depth_mm)) +
  geom_smooth()

ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm, 
    y = body_mass_g, 
    color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# compare with this -> they are the same
## defining at global and local level
ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(
      x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(
      x = flipper_length_mm, y = body_mass_g)
  )


## categorical vs numerical -----

### count plot -----
penguins %>% 
  ggplot(aes(x = species)) +
  geom_bar()

### reordering by frequency ----
penguins %>% 
  ggplot(aes(x = fct_infreq(species))) +
  geom_bar()

# fill changes the shape filled
penguins %>% 
  ggplot(aes(x = fct_infreq(species))) +
  geom_bar(fill = 'grey50') +
  labs(title = "Count of penguins for each species",
       caption = "Source: palmerpenguins package")

# col only changes the outline
penguins %>% 
  ggplot(aes(x = fct_infreq(species))) +
  geom_bar(col = 'purple')

### histogram -----
penguins %>% 
  ggplot(aes(
    x = body_mass_g
  )) +
  geom_histogram(binwidth = 200) +
  labs(
    title = "Histogram for body_mass",
    subtitle = "bin width of 200 was used for histogram",
    caption = "Source: palmerpenguins package"
  )

### density plot -----
penguins %>% 
  ggplot(
    aes(x = body_mass_g)
  ) +
  geom_density() +
  labs(
    title = "Density plot for body_mass",
    subtitle = "Can see shape of distribution with a density plot too.",
    caption = "Source: palmerpenguins package"
  )


### diamonds dataset -----
glimpse(diamonds)
summary(diamonds)

diamonds %>% 
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 10)

diamonds %>% 
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.7)

diamonds %>% 
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.07)

diamonds %>% 
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.2) +
  scale_x_continuous(n.breaks = 10) +
  labs(title = "Distribution of carats in diamonds",
       subtitle = "Using binwidth = 0.2. Most of the diamonds have carat size of about 0.3-0.7")

### boxplot -----
penguins %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  labs(title = "Boxplot showing distribution of body mass for each species",
       caption = "Source: palmerpenguins package")


### density plot
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             fill = species,
             color = species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density plot showing distribution of body mass for each species",
       caption = "Source: palmerpenguins packge")


### stacked bar plots -----
penguins %>% 
  ggplot(aes(x = island, fill = species)) +
  geom_bar() +
  labs(title = "Stacked bar plot tells us the frequency count of species per island",
       caption = "Source: palmerpenguins package")


### relative count
penguins %>% 
  ggplot(aes(x = island, fill = species)) +
  geom_bar(position = 'fill') +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Relative count of penguins on each island",,
       subtitle = "Gentoo penguins all live on Biscoe. Chinstrap all live on Dream island.",
       caption = "Source: palmerpenguins package") 

### scatterplots -----
glimpse(penguins)
penguins %>% 
  ggplot(aes(flipper_length_mm, body_mass_g)) +
  geom_point() +
  labs(title = "Visualizing relationship between flipper length and body mass",
       caption = "Source: palmerpenguins package")


### three or more variables ----
penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g)) +
  geom_point(aes(col = species)) +
  labs(title = "Relationship between body mass and flipper length, colored by penguin species",
       subtitle = "Gentoo penguins have larger body mass and longer flipper length",
       caption = "Source: palmerpenguins package")

## faceting
penguins %>% 
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g)) +
  geom_point(aes(col = species)) +
  facet_wrap(~island) +
  labs(title = "Relationship between body mass and flipper length, colored by penguin species",
       caption = "Source: palmerpenguins package")


## mpg dataset -----
?mpg
glimpse(mpg)

## categorical variables:
## manufacturer, model, year, cyl, trans, drv, fl, class

## numerical variables:
## displ, cty, hwy

mpg %>% count(manufacturer)
mpg %>% count(model)

### scatterplot: hwy vs dipl ----
p1 <- 
  mpg %>% 
  ggplot(aes(x = displ,
             y = hwy)) +
  geom_point(aes(size = cty))

p2 <- 
  mpg %>% 
  ggplot(aes(x = displ,
             y = hwy)) +
  geom_point(aes(col = cty))

p1+p2


## penguins ----
penguins %>% 
  ggplot(aes(x = bill_depth_mm,
             y = bill_length_mm)) +
  geom_point(aes(col = species))

penguins %>% 
  ggplot(aes(x = bill_depth_mm,
             y = bill_length_mm)) +
  geom_point(aes(col = species)) +
  facet_wrap(~species)


ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species", shape = "Species")

# SAVING PLOTS -----

fig_folder <- 
  here("figures",
       "chap-01")

fig_folder

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

ggsave(filename = here(fig_folder, "penguin-plot.png"))
