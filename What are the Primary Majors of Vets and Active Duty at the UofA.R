library(tidyverse)
library(wordcloud2)
library(ggwordcloud)
library(plotly)
library(ggplot2)

survey_data = read.csv("C:/Users/JDBOR/OneDrive/Desktop/Stats labs/capstone/2023 Higher Education Survey_March 19, 2023_choices - Sheet1.csv")


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

ggplot(survey_data,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.2))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",x = "Service Branch", y = "Primary Major")

m <- filter(survey_data, gender == "M")
f <- filter(survey_data, gender == "F")
g <- filter(survey_data, gender == "G" | gender == "N")

ggplot(m,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.2))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",x = "Service Branch", y = "Primary Major")

ggplot(f,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.1))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",x = "Service Branch", y = "Primary Major")

ggplot(g,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10)+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",x = "Service Branch", y = "Primary Major")


