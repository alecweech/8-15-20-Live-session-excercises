#Group project 08-15-20, plot covid cases  per capita over time
#Greg White, Jen Leopold, Sam Shoud, Alec Weech
#aaw3ff@virginia.edu

#setup libraries
library(tidyverse)
library(ggplot2)
library(plotly)

#setwd for Alec's local machine
#setwd('~/rprojects/bootcamp/livesession')

covid <- read_csv('owid-covid-data.csv')

#extract data for our 5 countries (| means or)
covid_filter <- subset(covid, location == 'United States' | location=='United Kingdom' | location=='World' | location =='China' | location=='South Korea')

#perform log scaling
covid_log <- mutate(covid_filter, log_cases_per_million = log(total_cases_per_million))

#make a plot
plt <- plot_ly(covid_log, x = ~date, y= ~log_cases_per_million, color=~location)

#show said plot
plt
