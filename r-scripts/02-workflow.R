# R4DS (2e)

## Chapter 2: Workflow

## To have hands on practice on codes mentioned in book

## Created on 16 Sept 2024

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

# FUNCTIONS -----
seq(from = 1, to = 10)

primes <- c(2, 3, 5, 7, 11, 13)













