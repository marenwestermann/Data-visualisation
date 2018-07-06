# Load the ggplot2 package
library(ggplot2)


# Facets: the basics 

# Basic scatter plot
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Separate rows according to transmission type, am
p + facet_grid(. ~ am)

# Separate columns according to cylinders, cyl
p + facet_grid(cyl ~ .)

# Separate by both columns and rows 
p + facet_grid(cyl ~ am)


# Many variables 

# Load the RColorBrewer package
library(RColorBrewer) 

# Code to create the cyl_am col and myCol vector
mtcars$cyl_am <- paste(mtcars$cyl, mtcars$am, sep = "_")
myCol <- rbind(brewer.pal(9, "Blues")[c(3,6,8)],
               brewer.pal(9, "Reds")[c(3,6,8)])

# Basic scatter plot, add color to scale: 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  scale_color_manual(values = myCol)

# Facet according on rows and columns. 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  scale_color_manual(values = myCol) + 
  facet_grid(gear ~ vs)

# Add more variables 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am, size = disp)) +
  geom_point() +
  scale_color_manual(values = myCol) + 
  facet_grid(gear ~ vs)


# Dropping levels 

# Load the readr package
library(readr)

# Load the mamsleep dataset
mamsleep <- read_delim("../mamsleep.txt", delim = "/")

# Basic scatter plot
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) + 
  geom_point()

# Facet rows accoding to vore
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) + 
  geom_point() + 
  facet_grid(vore ~ .)

# Specify scale and space arguments to free up rows
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) + 
  geom_point() + 
  facet_grid(vore ~ ., scale = "free_y", space = "free_y")
