# Quick eval of our toy model

mse_bakeoff <- function(n, mu, sigma, B=1000, num_test=10000){
  test_x <- rnorm(num_test)*sigma + mu
  zero_mse <- mean(test_x^2)
  mean_mse <- 0
  shrinkage_mse <- 0
  for (b in 1:B){
    x <- rnorm(n)*sigma + mu
    x_bar <- mean(x)
    sigma_hat <- sd(x)
    mean_mse <- mean_mse + mean((test_x - x_bar)^2)
    shrinkage_est <- x_bar*(mu^2/(mu^2 + sigma^2/n))
    shrinkage_mse <- shrinkage_mse + mean((test_x - shrinkage_est)^2)
  }
  return(c(zero_mse, mean_mse/B, shrinkage_mse/B))
}