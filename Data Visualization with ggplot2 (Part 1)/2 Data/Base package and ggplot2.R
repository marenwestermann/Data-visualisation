# Plot the correct variables of mtcars
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Change cyl inside mtcars to a factor
mtcars$fcyl <- as.factor(mtcars$cyl)

# Make the same plot as in the first instruction
plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Basic plot
# Call abline() with carModel as first argument and set lty to 2
plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# This code will draw the legend of the plot
plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)
invisible(lapply(mtcars$fcyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (fcyl == x)), col = x)
}))
legend(x = 5, y = 33, legend = levels(mtcars$fcyl),
       col = 1:3, pch = 1, bty = "n")

# Load the ggplot2 package
library(ggplot2)

# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = fcyl)) +
  geom_point()  # Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = fcyl)) +
  geom_point() + # Copy from Plot 1
  geom_smooth(method = "lm", se = F)   # Fill in using instructions Plot 2

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = fcyl)) +
  geom_point() + # Copy from Plot 2
  geom_smooth(method = "lm", se = F, lty = 2) + # Copy from Plot 2
  geom_smooth(aes(group = 1))   # Fill in using instructions Plot 3

