# ------------------------------------------------
# load packages and data
# ------------------------------------------------
library('dplyr')
library('rsample')
library('plotROC')

# install.packages(packages)

# uncomment and run if the CR_dat dataset is not loaded
# source('code/0_data_prep.r')

# uncomment below if you have not loaded CR_test and CR_train
# source('code/3_cross_validation.r')

# ------------------------------------------------
# Generate model predictions
# ------------------------------------------------
scores_train <- tibble(
    `true` = as.factor(CR_train$poor_stat),
    `preds_lasso` = predict(lasso_mod, 
                            newdata = CR_train, 
                            s = "lambda.min", 
                            type = "response")[,1],
    `preds_ridge` = predict(ridge_mod, 
                            newdata = CR_train, 
                            s = "lambda.min", 
                            type = "response")[,1]
)

preds_train <- scores_train %>%  
    mutate(class_lasso = 
               as.factor(if_else(preds_lasso > 0.7,1,0)),
           class_ridge = 
               as.factor(if_else(preds_lasso > 0.7,1,0)))


# ------------------------------------------------
# estimate confusion matrix
# ------------------------------------------------
library(yardstick)
conf_mat(preds_train,
         truth = true,
         estimate = class_lasso)


# ------------------------------------------------
#  Plot ROC curve
# ------------------------------------------------
p <- ggplot(preds_train %>% mutate(true = as.numeric(as.character(true))), 
            aes(m = preds_lasso, d = true)) + 
    geom_roc(labelsize = 3.5, 
             cutoffs.at = 
                 c(0.99,0.9,0.7,0.5,0.3,0.1,0)) +
    theme_minimal(base_size = 16)
print(p)
calc_auc(p)


# ------------------------------------------------
#  Exercises
# ------------------------------------------------
# 1. Generate predicted scores using the lasso model
#    for the test data frame (using lambda.min)


# 2. Generate class predictions using a variety of cutoffs


# 3. Compute confusion a confusion matrix for those various
#    cutoff thresholds

# 4. Produce an ROC plot using the lasso model predictions
#    for the test set. 

# 5. Our model is overfit if the accuracy in the test is 
#    considerably worse than the accuracy in the training. 
#    Compare the AUC metric in the test versus train for the 
#    ridge model. Is our model overfit or underfit? 


