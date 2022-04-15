# ------------------------------------------------
# load packages
# ------------------------------------------------
library('dplyr')
library('rsample')

# uncomment and run if the CR_dat dataset is not loaded
# source('code/0_data_prep.r')

# ------------------------------------------------
# testing/training split of your data
# ------------------------------------------------
# always set seed before doing anything that involves randomization
set.seed(1818)

split_dummy <- sample(c(rep(0, 0.75 * nrow(CR_dat)),  # Create dummy for splitting
                        rep(1, 0.25 * nrow(CR_dat))))
# create training data
CR_train <- CR_dat[split_dummy == 0, ]   
CR_test <- CR_dat[split_dummy == 1, ]   


# initial split is a helper function that will 
# take a dataset and create functions to split into
# testing and training sets
# CR_split <- initial_split(CR_dat, prop = 0.75)

# CR_split

# create training data
# CR_train <- training(CR_split)

# create testing data
# CR_test <- testing(CR_split)

# output nrow of each test and training set
# lst(CR_train,CR_test) %>% purrr::map(nrow) 

# 1. How many rows does the CR_test data frame contain? 
#    (hint use the function nrow) 

# nrow(CR_test)

# 2. How many rows does the CR_train data frame contain?

# nrow(CR_train)

