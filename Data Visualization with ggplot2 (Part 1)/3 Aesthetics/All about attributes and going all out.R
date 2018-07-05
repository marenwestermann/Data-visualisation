# load the ggplot2 package
library(ggplot2)

# Change cyl inside mtcars to a factor
mtcars$fcyl <- as.factor(mtcars$cyl) 

## All about attributes
# Define a hexadecimal color
my_color <- "#4ABEFF"

# First scatter plot, with col aesthetic:
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) + 
  geom_point()

# Plot 1, but set col attributes in geom layer:
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +  
  geom_point(color = my_color)

# Plot 2, with fill instead of col aesthetic, plus shape and size attributes in geom layer.
ggplot(mtcars, aes(x = wt, y = mpg, fill = fcyl)) +  
  geom_point(size = 10, shape = 23, color = my_color)

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + 
  geom_point(alpha = 0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + 
  geom_point(shape = 24, color = "yellow")

# Expand to draw text with label rownames(mtcars) and color red
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + 
  geom_text(label = rownames(mtcars), color = "red")

## Going all out
# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x = mpg, y = qsec, color = factor(cyl))) + 
  geom_point()

# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x = mpg, y = qsec, color = factor(cyl), shape = factor(am))) + 
  geom_point()

# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x = mpg, y = qsec, color = factor(cyl), shape = factor(am), size = (hp/wt))) + 
  geom_point()
