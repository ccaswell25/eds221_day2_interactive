# Data wrangling and viz

library(tidyverse)
library(here)
library(janitor)

plants <- read_csv(here("data","power_plants.csv")) %>% 
 clean_names()

#how to create a subset of the data where we only want data with the state name being Alabama
alabama_plants <- plants %>%
  filter(state_name == "Alabama")
                   
#let's creat a plot
alabama_plot <- ggplot(data = alabama_plants, aes(x = install_mw, y = total_mw)) +
  geom_point()

#let's save this as a file to our figures folder in the directory
ggsave(filename = here("figures", "alabama_plants.jpg"), plot = alabama_plot)