#Megan Straffon


#Q12 code
# Load libraries
library(ggplot2)
library(wordcloud2)
# Create data
data1 <- data.frame(
        name=c('VA benefits\n complications','Adjusting to\n student life','Feeling isolated\n on campus','Unpleasant staff interaction','Relating to\n other students','Prejudice against military','Financial challenges','COVIDs impact &\n online classes','Finding a job','Transfer credits\n not counted') ,
        value=c(24,18,16,11,11,8,8,5,5,5))
colors <- c("#EA5545", "#F46A9B", "#EF9B20", "#EDBF33", "#EDE15B", "#BDCF32", "#87BC45", "#27AEEF", "#B33DC6", "gold")
# Barplot
ggplot(data1, aes(x = reorder(name, value), y = value)) + geom_bar(stat = "identity", fill = colors) +
       coord_flip() + xlab("Theme") + ylab("\nPercentage of Responses that Expressed this Theme") +ggtitle("What Challenging Experiences\n Have Active-Duty Members\n or Veterans Faced?") + theme(axis.title.x = (element_text(size=13)), axis.title.y = element_blank(), plot.title = element_text(face="bold", hjust = 0.5, size=18))


#Q14 code

# Create data
data2 <- data.frame(
        name=c('Cannot take desired\n number of classes','Dislike major','Classes dropped','Avoid campus','Confusion with\n VA support','Struggles from\n COVID learning','Cannot be full time','Cannot take\n campus jobs','Started as\n Freshman','Chose major based\n on community') ,
        value=c(39,31,31,23,15,15,15,8,8,8))
# Barplot
ggplot(data2, aes(x = reorder(name, value), y = value)) + geom_bar(stat = "identity", fill = colors) +
       coord_flip() + xlab("Theme") + ylab("\nPercentage of Responses that Expressed this Theme") +ggtitle("How Struggles Impact\n Educational Choices") + theme(axis.title.x = (element_text(size=13)), axis.title.y = element_blank(), plot.title = element_text(face="bold", hjust = 0.5, size=18))
# Wordcloud
wordcloud2(data2,size=.3, gridSize = 10)

#Q15 code

# Create data
data3 <- data.frame(
        name=c('Academic success','Career success','Transfer of skills','Mentor support','VETS center support','Finding happiness','Academic fulfillment','Personal Growth','VA benefits','Meeting new people') ,
        value=c(35,18,18,15,15,12,9,9,9,6))
# Barplot
ggplot(data3, aes(x = reorder(name, value), y = value)) + geom_bar(stat = "identity", fill = colors) +
       coord_flip() + xlab("Theme") + ylab("\nPercentage of Responses that Expressed this Theme") +ggtitle("What Successes Have Active-Duty\n Members and Veterans Had?") + theme(axis.title.x = (element_text(size=13)), axis.title.y = element_blank(), plot.title = element_text(face="bold", hjust = 0.5, size=18))


#Q17 code


# Create data
data4 <- data.frame(
        name=c('Determine\n academic path','Continue degree','Cherish support','Push themselves\n academically','Afford university') ,
        value=c(38,38,31,25,13))
colors <- c("#EA5545", "#F46A9B", "#EF9B20", "#87BC45", "#27AEEF")
# Barplot
ggplot(data4, aes(x = reorder(name, value), y = value)) + geom_bar(stat = "identity", fill = colors) +
       coord_flip() + xlab("Theme") + ylab("\nPercentage of Responses that Expressed this Theme") +ggtitle("How Have Successes\n Impacted Educational Choices") + theme(axis.title.x = (element_text(size=13)), axis.title.y = element_blank(), plot.title = element_text(face="bold", hjust = 0.5, size=18))
#wordcloud
wordcloud2(data4,size=.3, gridSize = 10)
