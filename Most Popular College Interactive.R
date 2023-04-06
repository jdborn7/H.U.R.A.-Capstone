#Jade Born
#This code was created to produce a wordcloud of the most
#popular colleges for the Veterans and Active Duty members
#attending the Unversity of Arizona. It is intended to be
#used as a introductory graph to the information that we 
# used to answer our research questions.


#call in libraries
library(tidyverse)
library(wordcloud2)
library(plotly)
library(ggplot2)

#read in the survey data
survey_data = read.csv("C:/Users/JDBOR/OneDrive/Desktop/Stats labs/capstone/Final_data_choices.csv")

#translate just the colleges answer into a dataframe
df = data.frame(colleges = survey_data$Q4)

#takes that dataframe and adds a frequency column to allow for the amount of people in that college
#to be counted
feq = df %>%
         count(colleges)

#produces a word cloud on a grid sized 5
wordcloud2(feq,size=1, color = "random-dark", gridSize = 5)


