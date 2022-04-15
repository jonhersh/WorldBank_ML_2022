# ------------------------------------------------
# Load packages and data prep
# ------------------------------------------------
library('dplyr')
library('ggplot2')
library('ggthemes')

# load data if not already loaded

CR_dat <- read_rds("https://github.com/jonhersh/WorldBank_ML_2022/raw/main/datasets/CR_dat.rds")



# ------------------------------------------------
# Create Simple bar charts
# ------------------------------------------------
ggplot(CR_dat, aes(x = as.factor(poor_stat))) +
  geom_bar()

ggplot(CR_dat, aes(x = poor_stat)) + 
  geom_bar()

ggplot(CR_dat, aes(x = num_hh)) + 
  geom_bar() +
  xlab("Number in household") +
  ylab("Freqency") +
  ggtitle("My plot")

ggsave("figures/frequency_num_hh.png")

# change color of bar based on some other characteristic of
# the data
ggplot(CR_dat, aes(x = num_hh)) + 
  geom_bar(aes(fill = as.factor(poor_stat))) 

ggplot(CR_dat, aes(x = age)) + 
  geom_bar(aes(fill = as.factor(poor_stat))) 


 
# ------------------------------------------------
# Create Simple Scatter plot
# ------------------------------------------------

# aes specifies the x and y axes
# geom_point creates the points

ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(alpha = 1/10)

# maximize data:ink

ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point()

# change the transparency of the points with alpha = [number less than 1]
ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(alpha = 1/10)




# ------------------------------------------------
# Add a smoothing trend line with geom_smooth()
# ------------------------------------------------
# we can change the color of the points
ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(alpha = 1/10) +
  geom_smooth(method = "lm")

# change to a linear line
# we can change the color of the points
# note we have saved this object as p and not plotted it
p <- ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(aes(color = mar_stat), alpha = 1/10) + 
  geom_smooth(method = "lm")

# change the axes labels
p <- p +
  xlab("Age of Head of Household") + 
  ylab("Years of Education") 

plot(p)

# change to the minimal theme and increase the font size
# see more themes here: http://jrnold.github.io/ggthemes/index.html
p <- p + 
  theme_minimal(base_size = 16)

plot(p)


# ------------------------------------------------
# Create multiple plots based on a factor level
# ------------------------------------------------
ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(alpha = 1/10) +
  facet_wrap(~ as.factor(poor_stat)) +
  geom_smooth()

ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(aes(color = mar_stat), alpha = 1/10) + 
  facet_wrap(~ mar_stat)


ggplot(CR_dat, aes(x = age, y = mean_educ)) +
  geom_point(alpha = 1/10) + 
  geom_smooth(method = "lm") +
  facet_wrap(~ urban)

# ------------------------------------------------
# Create interactive plots with plotly
# ------------------------------------------------
library('plotly')
# make an interactive plot using plotly
p <- ggplotly(p)

# even better we can save this as an html file! 
htmlwidgets::saveWidget(p, file = "figures/myployly.html")


# ------------------------------------------------
# Exercises
# ------------------------------------------------

# 1. Use the geom_bar function to create a histogram 
# plot of poor_stat, where the fill is set to the urban variable


# 2. Create a scatter plot of dependency rate on the X axis
#    and mean_education on the y axis, where the color is set to 
#    marriage status (mar_stat)


# 3. Create a scatter plot of age against mean education
#    faceted by urban. Include a linear smoothing line 


# 4. Add axes labels and a theme of your choice using the ggthemes package


# 5. Save the figure as either a plotly or a png object


