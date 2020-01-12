#simulate data
df <- data.frame(death=rbinom(1000,1,0.2),
                 age=runif(1000, min=18, max=65),
                 sex=sample(c('Male','Female'), 100, replace=T)
)

#fit age against death for males and females separately
allmodels = df            %>%
            group_by(sex) %>%
            do(submodel=glm(data=., death ~ age, family='binomial'))

#save object
save(allmodels, file="my_stratified_models.rda")

#new session
rm(list=ls())

#load model object
load(file='my_stratified_models.rda')

#do stuff without re-running!
allmodels %>%
tidy(submodel, exponentiate=T, conf.int=T)