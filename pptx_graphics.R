library(ggplot2)

#simulate data
df <- data.frame(group=rep(c("Exposed","Non-Exposed"), each=5),
                 time=rep(1:5,2),
                 score=runif(10)
                 )

#basic ggplot
my_plot <- ggplot(df, aes(x=time, y=score, color=group)) +
           geom_line() 
#view
my_plot

#export to pptx
library(officer)
library(rvg)

read_pptx()   %>%
  add_slide() %>%
  ph_with_vg(code=print(my_plot), type="body") %>%
  print(target="my_editable_plot.pptx")
