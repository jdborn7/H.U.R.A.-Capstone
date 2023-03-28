#Test run to see if how I set up my data works in R 


# Installing Packages -----------------------------------------------------

library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
install.packages('hrbrthemes')
library(hrbrthemes)
install.packages('plotly')
library(plotly)
library("RColorBrewer")

# data import -------------------------------------------------------------

survey_data <- read.csv('./data/higher_ed_survey.csv')

# Cleaning up data --------------------------------------------------------

survey_data <- survey_data[,-22]
survey_data <- survey_data[,-23]
survey_data <- survey_data[,-23]
survey_data <- survey_data[,-23]

colnames(survey_data) = c('start_date',
                            'end_date',
                            'military_status',
                            'service_branch',
                            'school_status',
                            'college_response',
                            'primary_major',
                            'secondary_major',
                            'career_related',
                            'post_grad_plans',
                            'attendence_response',
                            'reason_for_choice',
                            'effects_of_college',
                            'challenge_response',
                            'challenge_affect',
                            'challenge_explained',
                            'success_response',
                            'success_affect',
                            'success_explained',
                            'age',
                            'gender',
                            'ethnicity')

survey_data <- survey_data[survey_data$military_status != 'No', ]
glimpse(survey_data)

# graphs ------------------------------------------------------------------

# scatterplot comparing school status vs age and color coded by branch
survey_data |>
  ggplot(aes(x=school_status,
             y=age,
             color = service_branch,
             shape = service_branch)) + 
  geom_point(alpha =0.8,
             position = position_jitter(width = .2, height = .2))

# interactive heatmap

survey_data <- survey_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

# classic ggplot, with text in aes
p <-ggplot(survey_data,
         aes(age, 
             college_response, 
             fill= service_branch, 
             text=text)) + 
  geom_tile(position = position_jitter(width = .2, height = .2)) +
  theme_ipsum()

ggplotly(p, tooltip="text")

