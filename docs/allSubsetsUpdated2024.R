##
## @file allSubsets.R
## @brief Illustrate all subsets variable selection
## @author Eric B. Laber
## @note STA 561
##
require ("genridge")
require ("MASS")
require ("leaps")

## Load data fit OLS estimate
data ("prostate")
head (prostate)

prostate <- data.frame (scale (prostate, center=T, scale=F))
lmFit <- lm (lpsa ~ ., data=prostate)
summary (lmFit)

## All subsets regression 
dMat <- as.matrix (prostate[,1:8])
leapsFit <- regsubsets (x = dMat, y=prostate$lpsa, nbest=1, nvmax=8)

summary (leapsFit)  # examine models of each size

plot(summary(leapsFit)$bic, type="l", xlab="df", ylab="bic")


## Stepwise selection using BIC
n <- dim(dMat)[1]
lmStep <- stepAIC (lmFit, k=log(n))  # same as all subsets!

