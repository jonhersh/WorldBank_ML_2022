# WorldBank_ML_2022
 Materials for World Bank Machine Learning Training, April 8-15, 2022


#### April 8, 14, and 15
#### Instructor: [Jonathan Hersh](https://jonathan-hersh.com) (hersh@chapman.edu) 


## Getting Started

Hello! These are the materials for World Bank Machine Learning training. The topics covered will include:

### April 8 (10am - 1pm EST)
1. Intro to R and [dplyr](https://dplyr.tidyverse.org/) for data manipulation
2. Intro to [ggplot2](https://ggplot2.tidyverse.org) for plotting and graphics

### April 14 (10am - 1pm EST)
3. Intro to Machine Learning for Public Policy 
4. Regularized regression with Lasso, Ridge, and [ElasticNet](https://glmnet.stanford.edu/articles/glmnet.html)
5. Binary classification and diagnostics

### April 15 (10am - 1pm EST)
6. Regression trees and random forests 
7. Applications of machine learning in economics and economic development
8. Data Pipelines and Dashboarding in [Shiny](https://shiny.rstudio.com/) and [flexdashboard](https://pkgs.rstudio.com/flexdashboard/) 


------

## Computing and Installation Instructions

We will be coding in the R together. I don't presume **any** knowledge of coding, so don't be afraid if you've never coded before. 

There are two ways you can run R and [RStudio](https://rstudio.com/), either locally on your computer, or on the cloud in [rstudio.cloud](rstudio.cloud)

### Installing R Locally

If you would like to install and run R locally please install the following programs:

* RStudio Desktop 2022.02.1 Build 461 [link](https://www.rstudio.com/products/rstudio/download/#download)
* R 4.1.3 [link](https://cran.r-project.org/bin/windows/base/)

### Running R in a Web Browser

If you cannot install those programs, please head over to [rstudio.cloud](https://rstudio.cloud). 

* Click "GET STARTED FOR FREE" 
* Then click "Sign Up". 
![](images/rstudio.cloud.PNG)
* You may log in using your email address
* Next click new project. 
* You should now see a R Studio session in your browser. 
![](images/rstudio_console.PNG)


### Using Github

If you have never used Github, don't worry. It's easy! To download the files in this repository to your computer, please do one of the following. 

1. Download github and create a username. Navigate to the top of this repo and click 'clone'. This will copy all of the files to your computer. 
2. Click the "Code" button on the main page, and then "Download Zip" to download all the files in this repo as a zip. 
3. You may also download the files individually, or copy and paste code as needed. 
4. Use [git2r](https://github.com/ropensci/git2r) to clone the repo directly.  

### Loading The Github Repo in rstudio.cloud

```
install.packages('usethis')
install.packages('tidyverse')

newProject <- usethis::use_course('https://github.com/jonhersh/WorldBank_ML_2022/archive/refs/heads/main.zip')



