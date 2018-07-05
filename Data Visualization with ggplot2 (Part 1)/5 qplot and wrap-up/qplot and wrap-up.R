# Load the ggplot2 package
library(ggplot2)


## Using qplot

# The old way (shown)
plot(mpg ~ wt, data = mtcars) # formula notation
with(mtcars, plot(wt, mpg)) # x, y notation

# Using ggplot:
ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

# Using qplot:
qplot(wt, mpg, data = mtcars)


## Using aesthetics

# Categorical variable mapped onto size:
# cyl
qplot(wt, mpg, data = mtcars, size = factor(cyl))

# gear
qplot(wt, mpg, data = mtcars, size = factor(gear))

# Continuous variable mapped onto col:
# hp
qplot(wt, mpg, data = mtcars, col = hp)

# qsec
qplot(wt, mpg, data = mtcars, color = qsec)


## Choosing geoms 

# qplot() with x only
qplot(factor(cyl), data = mtcars)

# qplot() with x and y
qplot(factor(cyl), factor(vs), data = mtcars)

# qplot() with geom set to jitter manually
qplot(factor(cyl), factor(vs), data = mtcars, geom = "jitter")

# "Basic" dot plot, with geom_point():
ggplot(mtcars, aes(factor(cyl), wt, col = factor(am))) +
  geom_point(position = position_jitter(0.2, 0))

# "True" dot plot, with geom_dotplot():
ggplot(mtcars, aes(factor(cyl), wt, fill = factor(am))) +
  geom_dotplot(binaxis = "y", stackdir = "center")

# qplot with geom "dotplot", binaxis = "y" and stackdir = "center"
qplot(
  factor(cyl), wt,
  data = mtcars,
  fill = factor(am),
  geom = "dotplot",
  binaxis = "y",
  stackdir = "center"
)


## Chicken weight 

# Check out the head of ChickWeight
head(ChickWeight)

# Basic line plot
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_line(aes(group = Chick))

# Take plot 2, map Diet onto col.
ggplot(ChickWeight, aes(x = Time, y = weight, color = Diet)) +
  geom_line(aes(group = Chick))

# Take plot 3, add geom_smooth()
ggplot(ChickWeight, aes(x = Time, y = weight, color = Diet)) +
  geom_line(aes(group = Chick, alpha = 0.3)) + 
  geom_smooth(lwd = 2, se = F)


## Titanic 

# Load the readr package
library(readr)

# Load the titanic dataset
titanic <- read_delim("../titanic.txt", delim = "/")

# Change Sex inside titanic to a factor
titanic$Sex <- as.factor(titanic$Sex)

# Check the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge")

# Plot 2, add facet_grid() layer
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge") + 
  facet_grid(. ~ Survived)

# Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# Plot 3, but use the position object from instruction 4
ggplot(titanic, aes(x = Pclass, y = Age, col = Sex)) +
  geom_point(position = posn.jd, size = 3, alpha = 0.5) + 
  facet_grid(. ~ Survived)
