# R4DS (2e)

## Chapter 3: Data Transformation

## To have hands on practice on codes mentioned in book

## Created on 16 Sept 2024

library(pacman)
p_load(tidyverse, conflicted,
       nycflights13,
       ggthemes,
       ggthemr,
       DT,
       patchwork, # to patch figures
       here # to save plots to figures
)

conflicts_prefer(dplyr::filter)
conflicts_prefer(dplyr::lag)

ggthemr("fresh")

# OBJECTIVES -----
## To learn the key tools to transform a dataframe.
## Functions that operate on rows and columns
## pipe
## grouping functions


# LOAD DATA -----
## nycflights13 contains all 336.776 flights that departed from 
## NYC in 2013. The data is from US Bureau of Transportation Statistics

?flights

glimpse(flights) # 336.776 rows, 19 cols

## ROWS -----
flights %>% 
  filter(dep_delay > 120)

# flights that departed on 1 Jan
flights %>% 
  filter(month == 1 & day == 1)

# flights that departed in Jan or Feb
flights %>% 
  filter(month == 1 | month == 2)

flights %>% 
  filter(month %in% c(1, 2))

# sorting
flights %>% 
  arrange(year, month, day, dep_time)


flights %>% 
  arrange(desc(year))

# unique origin and destination pairs
flights %>% 
  distinct(origin, dest)

flights %>% 
  distinct(origin, dest, .keep_all = T)

# count
flights %>% 
  count(origin, dest, sort = T)

# EXERCISES ----
glimpse(flights)

## arr time is in minutes
flights %>% distinct(carrier)

## check airlines code: https://www.tvlon.com/resources/airlinecodes.htm

flights %>% 
  filter(arr_delay>=120) 

flights %>% 
  filter(dest %in% c("HOU", "IAH")) 

flights %>% 
  filter(carrier %in% c("UA", "AA", "DL")) 

flights %>% 
  filter(month %in% c(7,8,9))

flights %>% 
  filter(arr_delay >=120 | dep_delay <=0)

flights %>% 
  filter(dep_delay >= 60 & dep_delay - arr_delay > 30)


flights %>% 
  arrange(desc(dep_delay)) %>% 
  arrange(sched_dep_time)

flights %>% 
  mutate(speed = distance/(air_time/60),
         .before = year) %>% 
  arrange(desc(speed))


flights %>% 
  distinct(year, month, day)

flights %>% 
  arrange(desc(distance))

flights %>% 
  arrange(distance)


flights %>% 
  mutate(gain = dep_delay - arr_delay,
         speed = distance / air_time * 60,
         .before = 1, # .after
         .keep = 'used' # all, used, unused, none
         )

flights %>% 
  relocate(time_hour)
