# Load the ggplot2 package
library(ggplot2)

# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl)

# Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + 
  geom_point(size = 4)

# Hollow circles - an improvement
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + 
  geom_point(size = 4, shape = 1)

# Add transparency - very nice
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + 
  geom_point(size = 4, alpha = 0.6)

# Scatter plot: carat (x), price (y), clarity (color)
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + 
  geom_point()

# Adjust for overplotting
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + 
  geom_point(alpha = 0.5)

# Scatter plot: clarity (x), carat (y), price (color)
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) + 
  geom_point(alpha = 0.5)

# Dot plot with jittering
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) + 
  geom_point(position = "jitter", alpha = 0.5)
