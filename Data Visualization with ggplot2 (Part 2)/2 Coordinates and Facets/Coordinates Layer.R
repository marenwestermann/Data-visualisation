# Load the ggplot2 package
library(ggplot2)


# Zooming in 

# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = factor(am))) + 
  geom_point() + geom_smooth()

# Add scale_x_continuous
p + scale_x_continuous(limits = c(3,6), expand = c(0,0))

# The proper way to zoom in:
p + coord_cartesian(xlim = c(3,6))


# Aspect ratio

# Complete basic scatter plot function
base.plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = F)

# Plot base.plot: default aspect ratio
base.plot

# Fix aspect ratio (1:1) of base.plot
base.plot + coord_equal()


# Pie charts 

# Create stacked bar plot: thin.bar
thin.bar <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) +
  geom_bar()

# Convert thin.bar to pie chart
thin.bar + coord_polar(theta = "y")

# Create stacked bar plot: wide.bar
wide.bar <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) +
  geom_bar(width = 1)

# Convert wide.bar to pie chart
wide.bar + coord_polar(theta = "y")
