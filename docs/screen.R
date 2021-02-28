##
## @file screen.R
## @brief Demonstrate sure indpendence screening
## @author Eric B. Laber
## @note Written hastily and rather poorly 
##
set.seed (0)
require ("lasso2")
require ("MASS")

estSISRidge = function (x, y, lam, M){
    x = scale (x, center=T, scale=T)
    y = scale (y, center=T, scale=T)
    w = t(x) %*% y
    ind = which (rank(-abs(w)) <= M)
    xr = x[,ind] # reduced covariates

    ridgeFits = lm.ridge (y ~ xr -1, lam=lam)
    bHatAll = coefficients (ridgeFits)
    d = eigen (t(xr) %*% xr)$values
    ridgeDF = numeric (length (lam))
    for (j in 1:length(d)){
        ridgeDF = ridgeDF + d[j]/(d[j]+lam)
    }
    ridgeBIC = numeric (length(lam))
    n = dim(xr)[1]
    for (i in 1:length(lam)){
        bHat = bHatAll[i,]
        rss = sum((y - xr %*% bHat)^2)
        ridgeBIC[i] = log(rss) + ridgeDF[i]*log (n)/n
    }

    bHat = numeric (dim(x)[2])
    bHat[ind] = bHatAll[which.min(ridgeBIC),]
    return (bHat)
}


## Generate data with only a few important covariates
n = 500
p = 1500
x = matrix (rnorm (n*p), nrow=n)
bStar = c(1, 1, 2, 2, rep(0, p-4))
y = x %*% bStar + rnorm (n)
sigY = sd (y)
sigX = apply (x, 2, sd)
bHat = estSISRidge(x, y, seq (0, 2000, length=5000), 10)*sigY/sigX
