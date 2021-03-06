##
## @file lasso.R
## @brief Illustrate lasso
## @author Eric B. Laber
## @note Written hastily and rather badly 
##
require ("lasso2");
require ("MASS");

## Illustrative plots for the orthogonal case
bHat = 10; # least squares estimator
plotObj = function (tau, bSeq=seq(-20, 20, length=1000)){
  par(mar=c(5,6, 4, 2) + 0.1);
  pretitle <- function(tau) {
    bquote(bold(~tau~"="~.(tau)))
  }
  objVals = (bHat-bSeq)^2 + tau*abs(bSeq);
  plot (bSeq, objVals, type='l', lwd=3,
        col="gray", xlab=expression(beta),
        ylab=expression(paste(
            (hat(beta)[n] - beta)^2 + tau, "|", beta, "|")),
        main=pretitle(tau));
  abline(v=bSeq[which.min(objVals)], lty=2, col='red');
}



invPlotObj = function (tau, bSeq=seq(-20, 20, length=1000)){
  par(mar=c(5,6, 4, 2) + 0.1);
  pretitle <- function(tau) {
    bquote(bold(~tau~"="~.(tau)))
  }
  objVals = sign(bSeq)*pmax (abs(bSeq) - tau/2, 0);
  plot (bSeq, objVals, type='l', lwd=3,
        col="gray", xlab=expression(hat(beta)[n]),
        ylab=expression(hat(beta)[n]^tau),
        main=pretitle(tau));
}




## Apply to prostate example
data ("Prostate");
head (Prostate);

Prostate = data.frame (scale (Prostate, center=T, scale=T));
lmFit = lm (lpsa ~ ., data=Prostate);
bHatOLS = coefficients(lmFit)[-1];
summary (lmFit);

## Use lasso2 library: note that this fits a model
## with ||beta||_1 \le c which is equivalent to the
## penalized version we considered
par(mfrow=c(1,2))
lassoFit = l1ce (lpsa ~ ., data=Prostate, bound=seq(0.01, 1, length=100));
bHatTau = coefficients(lassoFit)[,-1];
matplot(apply (bHatTau, 1, function(x) sum(abs(x))),
        coefficients(lassoFit)[,-1],
        type="l",lty=1,xlab="sum(abs(beta))",ylab="beta",main="lasso")
for (j in 1:8){
  text (sum(abs(bHatOLS))-0.125, bHatTau[92, j], names(Prostate)[j]);
}

## Chose model using BIC
dMat = as.matrix (Prostate[,1:8]);
n = dim(Prostate)[1];
lassoDF = apply (abs(bHatTau) > 1e-8, 1, sum);
lassoBIC = numeric (length(lassoDF));
for (i in 1:length(lassoDF)){
  yHat = dMat %*% bHatTau[i,];
  rss = sum ((yHat - Prostate$lpsa)^2);
  lassoBIC[i] = log (rss) + lassoDF[i]*log(n)/n;
}
abline(v=apply (bHatTau, 1, function(x) sum(abs(x)))[which.min(lassoBIC)],
       lty=2);


## Now, let's compare with the ridge solution
lam = seq (0, 10000, len=5000);
ridgeFit <- lm.ridge (lpsa ~ ., data=Prostate, lambda=lam);
bHatRidge = coefficients(ridgeFit)[,-1];
dMat = as.matrix (Prostate[,1:8]);
d = eigen (t(dMat) %*% dMat)$values;
ridgeDF = numeric (length (lam));
for (j in 1:length(d)){
  ridgeDF = ridgeDF + d[j]/(d[j]+lam);
}

matplot(ridgeDF, bHatRidge,
        type="l",lty=1,xlab="df",ylab="beta",main="ridge regression")
for (j in 1:8){
  text (7.65, bHatRidge[3, j], names(Prostate)[j]);
}

