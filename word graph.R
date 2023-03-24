library(tidyverse)
library(wordcloud2)

choices = read.csv("C:/Users/JDBOR/OneDrive/Desktop/Stats labs/capstone/2023 Higher Education Survey_March 19, 2023_choices - Sheet1.csv")

df = data.frame(colleges = choices$Q4)

feq = df %>%
         count(colleges)

wordcloud2(feq)

