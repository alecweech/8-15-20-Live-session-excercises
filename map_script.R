#Group project 08-15-20, plot covid data by country
#Greg White, Jen Leopold, Sam Shoud, Alec Weech
#aaw3ff@virginia.edu

#set up only the libraries we need
library(tidyverse) #used
library(rjson) #used
library(plotly) #used


#note I set the working directory here so that the next line finds the CSV
#this is not strictly necassarry, but it saves time vs the GUI
#setwd('~/rprojects/bootcamp/livesession')
covid <- read_csv('owid-covid-data.csv')

#filter outr data for a particular date and transform data with log
covid_filter <- subset(covid, date=='2020/05/08' & location != 'world')
covid_log <- mutate(covid_filter, log_cases_per_million = log(total_cases_per_million))

#preference for lines of borders
l <- list(color = toRGB('grey'), width=.5)

#map preferences
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

# make a world map
globe <- plot_geo(covid_log)

#tell it to plot our data and use blue (I like blue)
globe <- globe %>% add_trace(
  z = ~log_cases_per_million, color = ~log_cases_per_million, colors = 'Blues',
  text = ~location, locations = ~iso_code, marker = list(line = l)
)

#display the thing
globe
