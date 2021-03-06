# ------------------------------------------------
# Setup
# ------------------------------------------------
# Please download and install:
#   - R 4.1.3
#   - RStudio Desktop 2022.02.1 Build 461

# ------------------------------------------------
# Packages to Install
# ------------------------------------------------
package_list <- c(
    'ggthemes', 
    'glmnet', 
    'here', 
    'leaflet', 
    'rmarkdown', 
    'rprojroot', 
    'threejs', 
    'tidyverse', 
    'usethis', 
    'UsingR', 
    'randomForest',
    'glmnetUtils',
    'GGally',
    'partykit',
    'rpart',
    'plotROC',
    'randomForestExplainer',
    'plotly',
    'ggthemes',
    'here'
)

# install.packages('pacman')
pacman::p_load(package_list, character.only = TRUE)


# ------------------------------------------------
# data prep
# ------------------------------------------------
library('dplyr')
library('here')

# from https://www.kaggle.com/c/costa-rican-household-poverty-prediction/data?select=codebook.csv
train <- read.csv(here::here("datasets", "train.csv")) 
test <- read.csv(here::here("datasets", "train.csv"))

CR_dat <- bind_rows(train, test)

CR_dat <- 
    CR_dat %>% 
    rename(household_ID = idhogar,
           poor_stat = Target,
           num_rooms = rooms,
           bathroom = v14a,
           refrig = refrig,
           no_elect = noelec,
           no_toilet = sanitario1,
           comp = computer,
           tv = television,
           mobile = mobilephone,
           num_hh = tamhog,
           urban = area1,
           mean_educ = meaneduc,
           num_children = hogar_nin,
           num_adults = hogar_adul,
           num_elderly = hogar_mayor,
           disabled = dis) %>% 
    mutate(poor_stat = if_else(poor_stat == 1 | poor_stat == 2, 1,0),
           dep_rate = (num_children + num_elderly) / num_adults,
           mar_stat = case_when(estadocivil3 == 1 ~ "married",
                                estadocivil4 == 1~ "divorced",
                                estadocivil6 == 1~ "widowed",
                                !estadocivil6 ==1 & 
                                    !estadocivil3 ==1 & 
                                    !estadocivil4== 1 ~ "other")) %>% 
    mutate(mar_stat = as.factor(mar_stat)) %>% 
    filter(parentesco1 == 1) %>% 
    select(household_ID,poor_stat,num_rooms,
           bathroom, refrig, no_elect, no_toilet, comp, dep_rate,
           tv, mobile, num_hh, urban, mean_educ, num_children, num_adults,
           num_elderly, disabled, mar_stat, age) %>% 
    drop_na() %>% 
  as_tibble()

rm(test)
rm(train)

# write_rds(CR_dat,file = "datasets/CR_dat.rds")
