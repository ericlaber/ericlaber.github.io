##
## @file growingLinearModel.R
## @brief Estimating a linear model with growing dimension
## @author Eric B. Laber
## @note Written hastily and rather badly 
##
require ("MASS")
require ("grImport")
set.seed (0)

## We will consider the following setup:
## We will generate 2p independent standard normal
## predictors and set \beta_j^* = log(p+1)/p^2 if j \le p
## and \beta_j^* = 0 otherwise.  We will fit the following
## models:  (1) oracle linear: linear model that knows which
##              components of \beta^* are nonzero
##          (2) full linear: linear model that uses all 2p variables
##          (3) ridge regression built from all 2*p variables
##
compEMSE = function (p, n=100, M=1000, nT=10000){
  bStar = numeric (2*p)
  bStar[1:p] = log(2:(p+1))/((1:p)^2)
  EMSEO = 0 # Oracle
  EMSEA = 0 # All variables
  EMSER = 0 # Ridge tuned via GCV
  xT = matrix (rnorm(2*p*nT), nrow=nT)
  yT = xT%*%bStar + rnorm (nT)
  
  for (m in 1:M){
    x = matrix (rnorm(2*p*n), nrow=n)
    y = x%*%bStar + rnorm (n)
    bHatO = as.numeric (lm.fit (x[,1:p], y)$coefficients)
    EMSEO = EMSEO + mean ((yT-xT[,1:p]%*%bHatO)^2)
  
    bHatA = as.numeric (lm.fit (x, y)$coefficients)
    EMSEA = EMSEA + mean ((yT-xT%*%bHatA)^2)
    
    lam = seq (0, 100, len=50)
    ridgeFits = lm.ridge (y ~ x-1, lam=lam)
    bHatR = coef(ridgeFits)[which.min(ridgeFits$GCV),]
    EMSER = EMSER + mean ((yT-xT%*%bHatR)^2)
  }
  return (list('oracle'=EMSEO/M,
               'linear'=EMSEA/M,
               'ridge'=EMSER/M))
  
}


genPlot = function(){
  pSeq = c(2:10, seq(15, 50, by=5))
  plot (pSeq, ylim=c(0.95, 4.5), xlim=c(1, 50),
        type='n', xlab="p", ylab="EMSE")
  legend("topleft", c("Linear", "Oracle", "Ridge"),
         lty=c(1,1,1), pch=c(18, 19, 17),
         col=c("red", "blue","green"), lwd=3)
  pStart = compEMSE (pSeq[1])
  points (pSeq[1], pStart$oracle, pch=19, col='blue')
  points (pSeq[1], pStart$linear, pch=18, col='red')
  points (pSeq[1], pStart$ridge, pch=17, col='green')
  for (k in 2:length(pSeq)){
    p = pSeq[k]
    pNext = compEMSE (pSeq[k])
    points (c(pSeq[k-1], p), c(pStart$oracle, pNext$oracle),
            type='l', col='blue')
    points (p, pNext$oracle, pch=19, col='blue')

    points (c(pSeq[k-1], p), c(pStart$linear, pNext$linear),
            type='l', col='red')
    points (p, pNext$linear, pch=18, col='red')

    points (c(pSeq[k-1], p), c(pStart$ridge, pNext$ridge),
            type='l', col='green')
    points (p, pNext$ridge, pch=17, col='green')

    
    pStart = pNext
  }
}


