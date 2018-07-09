# Load the ggplot2 package
library(ggplot2)


# Heat maps 

# Load the RColorBrewer package
library(RColorBrewer)

# Load the lattice package 
library(lattice) 

# Create color palette
myColors <- brewer.pal(9, "Reds")

# Build the heat map from scratch
ggplot(barley, aes(x = year, y = variety, fill = yield)) + 
  geom_tile() + 
  facet_wrap(~ site, ncol = 1) + 
  scale_fill_gradientn(colors = myColors)


# Heat Maps Alternatives (1)

# Line plots
ggplot(barley, aes(x = year, y = yield, col = variety, group = variety)) + 
  geom_line() + 
  facet_wrap( ~ site, nrow = 1)


# Heat Maps Alternatives (2) 

# Create overlapping ribbon plot from scratch
ggplot(barley, aes(x = year, y = yield, group = site, col = site, fill = site)) + 
  geom_line() + 
  stat_summary(fun.y = mean, geom = "line") + 
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "ribbon", col = NA, alpha = 0.1)
