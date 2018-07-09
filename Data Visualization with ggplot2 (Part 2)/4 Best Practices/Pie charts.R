# Load the ggplot2 package
library(ggplot2)

# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl) 

# Change am inside mtcars to a factor
mtcars$am <- as.factor(mtcars$am) 


# Pie charts (1)

# Convert bar chart to pie chart
ggplot(mtcars, aes(x = factor(1), fill = am)) +
  geom_bar(position = "fill", width = 1) + 
  facet_grid(. ~ cyl) + 
  coord_polar(theta = "y")


# Pie charts (2)

# Parallel coordinates plot using GGally
library(GGally)

# All columns except am
group_by_am <- which(colnames(mtcars) == "am")
my_names_am <- (1:11)[-group_by_am]

# Basic parallel plot - each variable plotted as a z-score transformation
ggparcoord(mtcars, my_names_am, groupColumn = group_by_am, alpha = 0.8)