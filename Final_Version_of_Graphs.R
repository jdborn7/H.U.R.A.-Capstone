#Test run to see if how I set up my data works in R 


# Installing Packages -----------------------------------------------------

library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(plotly)
library(RColorBrewer)
library(circlize)


# data import -------------------------------------------------------------

survey_data <- read.csv('./data/final_data_choices.csv')

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


# separating the data into branches ---------------------------------------

air_force_data <- survey_data[which(survey_data$service_branch == "Air Force"),]
army_data <- survey_data[which(survey_data$service_branch == "Army"),]
marine_corps_data <- survey_data[which(survey_data$service_branch == "Marine Corps"),]
navy_data <- survey_data[which(survey_data$service_branch == "Navy"),]

# graphs ------------------------------------------------------------------

# scatterplot comparing school status vs age and color coded by branch
survey_data |>
  ggplot(aes(x=school_status,
             y=age,
             color = service_branch,
             shape = service_branch)) + 
  geom_point(alpha = 0.5, 
             size = 10, 
             position=position_jitter(width=0.2, height=0.2)) +
  labs(y= "Age", x = "School Status") +
  labs(title = "Respondents School Status vs Age ") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(color = "Service Branch", shape = "Service Branch")
# chord diagram

chord_data <- data.frame(survey_data$service_branch, 
                         survey_data$school_status,
                         survey_data$college_response,
                         survey_data$primary_major,
                         survey_data$post_grad_plans)
chordDiagram(chord_data,
             transparency = 0.5)

# interactive heatmap
survey_data <- survey_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

interactive_graph <-ggplot(survey_data,
         aes(age, 
             college_response, 
             fill= service_branch, 
             text=text)) + 
  geom_point(alpha = 0.7,
             size = 5,
             position = position_jitter(width = 0.2, height = 0.2)) +
  labs(y= "College Major is in", x= "Age")+
  labs(title = "Heatmap of Respondents Age, Major, College, and Post Grad Plans") +
  labs(fill = "Service Branch") +
  theme(plot.title = element_text(hjust = 0.5))
  theme_ipsum()

ggplotly(interactive_graph, tooltip="text")

# test run of multiple heatmaps -------------------------------------------

# air force heat map
air_force_data <- air_force_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

interactive_graph <-ggplot(air_force_data,
                           aes(age, 
                               college_response, 
                               fill= school_status, 
                               text=text)) + 
  geom_tile(position = position_jitter(width = .2, height = .2)) +
  theme_ipsum()

ggplotly(interactive_graph, tooltip="text")

# army heat map

army_data <- army_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

interactive_graph <-ggplot(army_data,
                           aes(age, 
                               college_response, 
                               fill= school_status, 
                               text=text)) + 
  geom_tile(position = position_jitter(width = .2, height = .2)) +
  theme_ipsum()

ggplotly(interactive_graph, tooltip="text")

# marine corp heat map

marine_corps_data <- marine_corps_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

interactive_graph <-ggplot(marine_corps_data,
                           aes(age, 
                               college_response, 
                               fill= school_status, 
                               text=text)) + 
  geom_tile(position = position_jitter(width = .2, height = .2)) +
  theme_ipsum()

ggplotly(interactive_graph, tooltip="text")

# navy heat map

navy_data <- navy_data %>%
  mutate(text = paste0("Primary Major: ", primary_major, "\n", "Post Grad Plans: ", post_grad_plans, "\n"))

interactive_graph <-ggplot(navy_data,
                           aes(age, 
                               college_response, 
                               fill= school_status, 
                               text=text)) + 
  geom_tile(position = position_jitter(width = .2, height = .2)) +
  theme_ipsum()

ggplotly(interactive_graph, tooltip="text")

