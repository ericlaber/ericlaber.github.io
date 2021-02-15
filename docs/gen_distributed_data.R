## 
## @file gen_distributed_data.R
## @brief Generate data for distributed example
## @note Written hastily and badly. One could potentially improve 
##       performance using bigmemory and bigalgebgra
## 
require("data.table")
p <- 2000
n_file <- 20
file_predictors_root <- "distributed_file_X"
file_outcomes_root <- "distributed_file_Y"
obs_per_file <- 200000


## Generate data for linear model with 2K predictors and 10M rows
## which we'll split across 20 files each with 500K rows
GENERATE_DATA <- FALSE
if(GENERATE_DATA){
  beta_star <- c(rep(10/sqrt(n_file*obs_per_file), 50),
                 rep(0, p-50))

  for(j in 1:n_file){
    file_predictors <- paste(file_predictors_root, j, ".csv", sep="")
    xj <- matrix(rnorm(obs_per_file*p), ncol=p)
    fwrite(xj, file=file_predictors)
    print(paste("finished writing X", j))
  
    file_outcomes <- paste(file_outcomes_root, j, ".csv", sep="")
    yj <- xj %*% beta_star + rnorm(obs_per_file)
    fwrite(yj, file=file_outcomes)
    print(paste("finished writing y", j))
  }
  rm(list=c(xj, yj))
}



## Read the data one file at a time and fit OLS
n_files_to_run_live <- 5  # use a smaller nbr for in-class demo
xxt <- matrix(0, nrow=p, ncol=p) # running outer product x*x^T
xy  <- numeric(
  p) # running product of x*y 
par (mar=c(5, 5, 4, 2)+0.1) # for illustration we'll plot as we go, set margin
for (j in 1:n_files_to_run_live){
  file_predictors <- paste(file_predictors_root, j, ".csv", sep="")
  xj <- as.matrix(fread(file_predictors))
  print(paste("Finished reading in x", j, sep=""))
  xxt <- xxt + t(xj) %*% xj
  print("finished computing xxt")
  
  file_outcomes <- paste(file_outcomes_root, j, ".csv", sep="")
  print(paste("Finished reading in y: ", j, sep=""))
  yj <- as.matrix(fread(file_outcomes))[,1]
  xy <- xy + t(xj) %*% yj
  
  # Show interim soln, slow and shouldn't do this in practice 
  plot (solve (xxt,  xy), xlab="Index", ylab=expression(hat(beta))) 
}
beta_hat = solve (xxt,  xy) # final OLS estimator  


## Now we can use our OLS estimator to compute lasso soln
sig = xxt/(n_files_to_run_live*obs_per_file)
compute_lasso_soln <- function (tau, maxit=500, tol=1e-8){
  fn = function (b){
    return (as.numeric(
      t(b-beta_hat) %*% sig %*% (b-beta_hat) + tau*sum(abs(b))
      ))
  }
  gr = function (b){
    return(as.numeric(2*sig%*%(b-beta_hat) + tau*sign(b)))
  }
  beta_cur <- beta_hat
  direction_cur <- gr (beta_cur)
  
  # Line search objective
  ls_obj = function (alpha){
    return (fn(beta_cur - alpha*direction_cur))
  }
  
  alpha_opt <- optimize (ls_obj, interval=c(0,1))$minimum
  beta_next <- beta_cur - alpha_opt*gr(beta_cur)
  for (k in 1:maxit){
    direction_next <- gr (beta_next)
    dx = beta_next - beta_cur
    if (max(abs(dx)) < tol){
      break
    }
    dg <- direction_next - direction_cur
    alpha_opt <- sum(dg*dx)/sum(dg^2)
    beta_cur <- beta_next
    direction_cur <- direction_next
    beta_next <- beta_next - alpha_opt*direction_next
  }
  return (beta_next)
}

## Show lasso solution with penalty \tau = 10
plot(compute_lasso_soln(tau=10))


