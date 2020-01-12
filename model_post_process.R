#simulate data
df <- data.frame(death=rbinom(1000,1,0.2),
                   age=runif(1000, min=18, max=65),
                   sex=sample(c('Male','Female'), 1000, replace=T)
                 )

#simple logistic regression
model1 <- glm(data=df, death ~ age + sex, family='binomial')

#view model
summary(model1)

#Output - sink()
sink("my_model_output.txt")
summary(model1)
sink()

#Output - extract individual elements
#point estimates
or = model1 %>%
     coef() %>%
     exp()

#ci
ci = model1    %>%
     confint() %>%
     exp()
#join
results2 <- cbind(or, ci)

#output
write.csv(results2,"my_model_output2.csv")

#Output - using tidy() from broom
library(broom)

results3 <- tidy(model1, exponentiate=T, conf.int=T)

#view
results3

#other broom functions
glance(model1)
augment(model1)