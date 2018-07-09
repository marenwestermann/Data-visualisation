# Load the ggplot2 package
library(ggplot2)

# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl) 

# Change am inside mtcars to a factor
mtcars$am <- as.factor(mtcars$am)


# Bar plots (1)

# Base layers
m <- ggplot(mtcars, aes(x = cyl, y = wt))

# Draw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar", fill = "skyblue") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)


# Bar plots (2)

# Base layers
m <- ggplot(mtcars, aes(x = cyl,y = wt, col = am, fill = am))

# Plot 1: Draw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)

# Plot 2: Set position dodge in each stat function
m +
  stat_summary(fun.y = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), 
               geom = "errorbar", width = 0.1, position = "dodge")

# Set your dodge posn manually
posn.d <- position_dodge(0.9)

# Plot 3:  Redraw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar", position = posn.d) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = posn.d)


# Bar plots (3)

# Load the readr package
library(readr)

# Load the mtcars.cyl dataset 
mtcars.cyl <- read_delim("../mtcars_cyl.txt", delim = "/")

# Base layers
m <- ggplot(mtcars.cyl, aes(x = cyl, y = wt.avg))

# Plot 1: Draw bar plot
m + geom_bar(stat = "identity", fill = "skyblue")

# Plot 2: Add width aesthetic
m + geom_bar(aes(width = prop), stat = "identity", fill = "skyblue")

# Plot 3: Add error bars
m + geom_bar(aes(width = prop), stat = "identity", fill = "skyblue") +  
  geom_errorbar(aes(ymin  =wt.avg - sd, ymax = wt.avg + sd), width = 0.1)
