#nested
log(exp(sqrt(abs(-4))))

#pipe
-4     %>%
abs()  %>%
sqrt() %>%  
exp()  %>%
log()  %>%
apply(., mean)


#a more realistic example
my_data = ohip               %>%
          filter(sex=='m')   %>%
          group_by(ikn)      %>%
          arrange(servdate)  %>%
          slice(1)
