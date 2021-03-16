##
## @file simple_random_projection.R
## @brief Gaussian random projection with ridge
## @author Eric B. Laber
## @note Written hastily and rather badly 
##

require(MASS)

## Helper function
fit_ridge_gcv <- function(x, y, lam_seq=seq(0,1000, length=10000)){
 ridge_op <- lm.ridge(y ~ x - 1, lam=lam_seq)
 lam_opt_ind <- which.min(ridge_op$GCV)
 return(coef(ridge_op)[lam_opt_ind,])
}

fit_proj_ridge_gcv <- function(
  x, 
  y, 
  proj_dim, 
  num_replicates, 
  lam_seq=seq(0, 1000, length=10000),
  sparse=F
  ){
  p <- dim(x)[2]
  beta_hat_proj <- numeric(p)
  for(m in 1:num_replicates){
    if(!sparse){
      Omega <- matrix(rnorm(proj_dim*p)/sqrt(proj_dim), nrow=p)
    }else{
      Omega <- matrix(
        sample(
          c(-sqrt(3), 0, sqrt(3)), 
          size=proj_dim*p,
          replace=T, 
          prob = c(1/6, 2/3, 1/6)
        ), 
        nrow=p
      )
      image(abs(Omega))
    }
    x_proj <- x %*% Omega
    beta_hat_proj <- beta_hat_proj + 
      Omega %*% fit_ridge_gcv(x_proj, y)
  }
  return(beta_hat_proj/num_replicates)
}

## Let's generate a reasonably large training data set
n <- 2500
p <- 4000
m = 50
basis_vectors <- matrix(runif(m*p), ncol=m)
x_train <- t(basis_vectors %*% matrix(rnorm(m*n), nrow=m)) + 
  matrix(rnorm(n*p), nrow=n)/4
beta_star <- rnorm(p)*(runif(p) < 0.75)/sqrt(n)
y_train <- x_train %*% beta_star + rnorm(n)

# Run OLS
beta_hat <- fit_ridge_gcv(x_train, y_train)

# Project data onto 24-dim space
beta_hat_proj <- fit_proj_ridge_gcv(x_train, y_train, 25, 10)
beta_hat_proj_sparse <- fit_proj_ridge_gcv(x_train, y_train, 25, 10, sparse=T)

# Evaluate MSE on test set 
n_test <- 100000
x_test <- matrix(rnorm(n_test*p), nrow=n_test)
y_test <- x_test %*% beta_star + rnorm(n_test)

mse_ols <- mean((y_test - x_test %*% beta_hat)^2)
mse_proj <- mean((y_test - x_test %*% beta_hat_proj)^2)
mse_proj_sparse <- mean((y_test - x_test %*% beta_hat_proj_sparse)^2)
