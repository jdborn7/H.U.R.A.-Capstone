# Load ggplot2
library(ggplot2)
# Create data
data <- data.frame(
  name=c("Getting the Opportunity\nto Be In a New Career","Obtain Skills Necessary\nfor a certain Job","Learn Something New","Life Skills","Self Fulfillment", "More Career\nOpportunities", "Higher Pay", "Broader World View", "Meeting New People", "Reintegrate Into\nCivilian Life") ,  
  value=c(48, 36, 29, 26, 19, 17, 12, 12, 10, 7)
)
colors <- c("#ea5545", "#f46a9b", "#ef9b20", "#edbf33", "gold", "#ede15b", "#bdcf32", "#87bc45", "#27aeef", "#b33dc6")
# Barplot
ggplot(data, aes(x = reorder(name, value), y = value)) + geom_bar(stat = "identity", fill = colors) +
  coord_flip() + xlab("Theme") + ylab("\nPercentage of Responses that Expressed this Theme") +ggtitle("How Do Veterans/Active Duty Service Members\nFeel They Will Be Benefitted By A Higher Education?") + theme(axis.title.x = (element_text(size=13)), axis.title.y = element_blank(), plot.title = element_text(face="bold", hjust = 0.5, size=18))












