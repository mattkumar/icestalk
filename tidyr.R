#simulate data
my_data = data.frame(ikn=rep(1:3, each=5),
                     visit=rep(1:5),
                     score=rnorm(15)
                     )

#view
my_data


library(tidyr)

#long to wide
wide = my_data %>%
       pivot_wider(values_from='score', 
                   names_from='visit', 
                   names_prefix='V')

#view
wide


#wide to long
long = wide %>%
       pivot_longer(values_to='score',
                    names_to='timepoint',
                    cols=2:6)

#view
long