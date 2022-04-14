# ------------------------------------------------
# load packages and data
# ------------------------------------------------
library('tidyverse')
library('tidymodels')
library('rsample')
# install.packages(packages)

# uncomment and run if the CR_dat dataset is not loaded
# source('code/0_data_prep.r')

# uncomment below if you have not loaded CR_test and CR_train
# source('code/3_cross_validation.r')


# ------------------------------------------------
# Estimate Ridge Model from data
# ------------------------------------------------
library('glmnetUtils')
ridge_mod <- glmnetUtils::cv.glmnet(poor_stat ~ ., 
                       data = CR_train %>% select(-household_ID),
                       alpha = 0, 
                       family = "binomial")

coef(ridge_mod) %>% as.matrix() %>% as.data.frame() 

plot(ridge_mod)

# print coefficient matrix using the value of 
# lambda that minimizes cross-validated error
coef(ridge_mod, s = ridge_mod$lambda.min) %>% round(3)

# plot coefficient MSE plot
# x axis is lambda, y is cross-validated MSE
plot(ridge_mod)

# show the shrinkage path of the coefficients
library('coefplot')
coefpath(ridge_mod)


# ------------------------------------------------
# Estimate Lasso Model from data
# ------------------------------------------------
lasso_mod <- glmnetUtils::cv.glmnet(poor_stat ~ ., 
                       data = CR_train %>% select(-household_ID),
                       alpha = 1, 
                       family = "binomial")

coef(lasso_mod)
# print coefficient matrix
coef(lasso_mod, s = lasso_mod$lambda.1se)

# plot coefficient MSE plot
plot(lasso_mod)

coefpath(lasso_mod)

# 1. Using Labda.1se penalization, which variables are shrunk to zero?


# ------------------------------------------------
# Estimate ElasticNet Model from data
# ------------------------------------------------
enet_mod <- cva.glmnet(poor_stat ~ ., 
                       data = CR_train %>% select(-household_ID),
                       alpha = seq(0,1, by = 0.1), 
                       family = "binomial")

minlossplot(enet_mod, cv.type = "min")

# 2. What is the optimal alpha for the ElasticNet model? 
#    What does that mean in your own words? 






