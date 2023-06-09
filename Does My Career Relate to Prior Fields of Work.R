#Jade Born
#This graph is to showcase the whether or not 
#the major that the Veteran or Active Duty Member
#is affected by what their career is/was in their
#time in the military. It is a look at factors that
#could answer our 3rd Research question

#call libraries
library(tidyverse)
library(plotly)
library(ggplot2)
library(ggthemes)

#read in the survey data
survey_data = read.csv("C:/Users/JDBOR/OneDrive/Desktop/Stats labs/capstone/Final_data_choices.csv")

#clean up the survey data to make it easier to graph
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


#create a horizontal bar graph by service branch to see the responses made
#by the survey participents.
ggplot(survey_data)+
  geom_bar(mapping = aes(y = career_related, fill = career_related), 
           show.legend = FALSE)+
  facet_wrap("service_branch")+
  labs(title = "Do Vets and Active Duty Members choose Majors similar to their 
       military career?", y = "Response", x = "# of Responses")+
  scale_x_continuous(n.breaks=4, limits = c(0,12))+
  theme_fivethirtyeight()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_brewer(palette = "Pastel1")

