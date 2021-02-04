##
## @file allSubsets.R
## @brief Illustrate all subsets variable selection
## @author Eric B. Laber
## @note Written hastily and rather badly 
##
require ("lasso2")
require ("MASS")
require ("leaps")

## Load data fit OLS estimate
data ("Prostate")
head (Prostate)

Prostate = data.frame (scale (Prostate, center=T, scale=F))
lmFit = lm (lpsa ~ ., data=Prostate)
summary (lmFit)

## All subsets regression 
dMat = as.matrix (Prostate[,1:8])
leapsFit = regsubsets (x = dMat, y=Prostate$lpsa, nbest=1, nvmax=8)

summary (leapsFit)  # examine models of each size

plot(summary(leapsFit)$bic, type="l", xlab="df", ylab="bic")


## Stepwise selection using BIC
n = dim(dMat)[1]
lmStep = stepAIC (lmFit, k=log(n))  # same as all subsets!

