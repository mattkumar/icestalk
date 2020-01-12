library(viridis)
library(ggplot2)

#example data
df <- data.frame(group=sample(letters[1:5], 100, replace=T),
                 y=rnorm(100,0,1),
                 x=rnorm(100,2,10)
                )

#scatter plot of y vs x, colored by group
my_plot <- ggplot(df, aes(y=y,x=x, color=group)) +
           geom_point(size=5) +
           scale_color_viridis_d() +
           theme_bw()

#view
my_plot
