library(cansim)
library(dplyr)
library(tidyr)

#get data
data1 <- get_cansim("17-10-0005-01")

#view
head(data1)

#learn about the data
str(data1)

#use
ontario = data1 %>%
        
          #filter on what we want
          filter(GEO=="Ontario" &
                 Sex=="Both sexes" &
                 REF_DATE %in% c('2015','2016','2017','2018','2019') &
                 grepl("to", `Age group`)) %>%
  
          #keep relevant variables
          select(REF_DATE, `Age group`,VALUE) %>%
  
          #transpose
          pivot_wider(names_from=REF_DATE, values_from=VALUE)

#view
ontario
