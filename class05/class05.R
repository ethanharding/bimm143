#'---
#' title: "Class 05 Data Visualization"
#' author: "Ethan Harding (PID A15468670)"
#' ---


#Lets start with a scatterplot
#install ggplot by typing "install.packages("ggplot2")" into the R console
#Before we use ggplot, we need to load it with "library(ggplot2)"
#Speed = miles/hour and Dist = stopping distance in feet

library(ggplot2)

#Every ggplot has a data + aes + geoms
ggplot(cars) + aes(x=speed, y=dist) + geom_point() + 
  geom_smooth()

#Change to a linear model
p <- ggplot(cars) + aes(x=speed, y=dist) + geom_point() + 
  geom_smooth(method="lm")

p + labs(title="My Nice Plot", 
         x="Speed (MPH)", y="Stopping Distance (ft)", caption="Dataset: cars")

#Base graphics is shorter
plot(cars)

#Let's try a more complicated dataset of gene expression
#First read the dataset
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#use nrow() to find how many rows there are
nrow(genes)

#colnames() to find out column names and ncol() to find how many columns there are
colnames(genes)
ncol(genes)

table(genes$State)

#What % of genes are up/down regulated
prec <-  table( genes$state ) / nrow(genes) * 100

#use round() to round the numbers to the amount of sig figs that we want
#we want to find the total fraction of upregulated genes to 2 sig figs
round( table(genes$State) / nrow(genes) * 100, 2)

#Make a ggplot of the gene expression data
g <- ggplot(genes) + aes(x=Condition1, y=Condition2,col=State) + geom_point()
g
g + scale_color_manual( values=c("blue","gray","red") ) +
  labs(title="Gene Expression Upon Drug Treatment", x="Control (no drug)",
       y="Drug Treatment")

#Gapminder dataset
#Make sure to install gapminder by typing "install.packages("gapminder") into R console
library(gapminder)
head(gapminder)



