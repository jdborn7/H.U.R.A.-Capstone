#Jade Born
#This code creates a graph to show the majors that are most
#popular by the branches. It goes along with the bar graph 
#that shows if majors are similar to prior careers. It is 
#a way of understanding if service branches does effect what 
#major is taken and if the University of Arizona offers majors
#that Veterans and active duty members want to take.

#call libraries
library(tidyverse)
library(wordcloud2)
library(ggwordcloud)
library(plotly)
library(ggplot2)


#read in survey data
survey_data = read.csv("C:/Users/JDBOR/OneDrive/Desktop/Stats labs/capstone/Final_data_choices.csv")

#clean survey data for easier graphing work
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

#create the scatter plot of the majors and service branchs and save 
#it to a variable
p <- ggplot(survey_data,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.2))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",
       x = "Service Branch", y = "Primary Major", fill = "Age Groups")+
  theme_fivethirtyeight()+
  theme(axis.title=element_text(), plot.title = element_text(hjust = 0.5))

#call the variable the plot was saved to and creates an interactive 
#version of the graph.
ggplotly(p)


#extra graphs seperated male, female and those who do not identify with those genders.
#this helps use look at even more centralized versions of the first graph
m <- filter(survey_data, gender == "M")
f <- filter(survey_data, gender == "F")
g <- filter(survey_data, gender != "M" | gender != "F")

p2 <- ggplot(m,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.2))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",
       x = "Service Branch", y = "Primary Major", fill = "Age Groups")+
  theme_fivethirtyeight()+
  theme(axis.title=element_text(), plot.title = element_text(hjust = 0.5))

ggplotly(p2)

p3 <- ggplot(f,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10, position=position_jitter(width=0, height=0.1))+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",
       x = "Service Branch", y = "Primary Major", fill = "Age Groups")+
  theme_fivethirtyeight()+
  theme(axis.title=element_text(), plot.title = element_text(hjust = 0.5))

ggplotly(p3)

p4 <- ggplot(g,aes(service_branch, primary_major, color = age))+
  geom_point(alpha = 0.3, size = 10)+
  labs(title = "What are the Primary Majors of Vets and Active Duty at the UofA?",
       x = "Service Branch", y = "Primary Major", fill = "Age Groups")+
  theme_fivethirtyeight()+
  theme(axis.title=element_text(), plot.title = element_text(hjust = 0.5))

ggplotly(p4)

