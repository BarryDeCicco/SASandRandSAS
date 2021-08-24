#  File 1

# from https://rpubs.com/marschmi/RMarkdown

# Other resources:  

# http://rmarkdown.rstudio.com/index.html
# http://kbroman.org/knitr_knutshell/
# https://www.rstudio.com/resources/cheatsheets/  

## Install the correct packages

install.packages("rmarkdown") # Make cool dynamic documents
install.packages("knitr") # Run R Code Chunks
install.packages("ggplot2") # For plotting
install.packages("DT") # Interactive HTML tables
install.packages("devtools") # To include the session information

install.packages("plotly")  # Interactive plots


## Add these packages to the current session to make sure they load correctly

library("rmarkdown") # Make cool dynamic documents
library("knitr") # Run R Code Chunks
library("ggplot2") # For plotting
library("DT") # Interactive HTML tables
library("devtools") # To include the session information

library("plotly")