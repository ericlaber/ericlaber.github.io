##
## @file coxph.R
## @brief Distributed Cox-PH estimation via approximate
##        gradient descent.
## @author Eric B. Laber
## @Note written quickly and poorly 
##

require ("R.utils")
require ("MASS")
require ("lasso2")


## For illustration we'll read in data from 20 files in
## chunks of size 1000.
nFile = 5
nLines = 10000 # lines per file
nChunks = 20
chunkSize=floor (nLines/nChunks)
p = 100


par (mar=c(5, 5, 4, 2)+0.1)
## Loop through files
maxit = 500
theta1 = rep (0, p)
theta2 = rep (0, p)
gr1 = numeric(p)
gr2 = numeric (p)
firstFlag = T
for (m in 1:maxit){
  for (j in 1:nFile){
    fNameU = paste ("distFileCoxU", j, ".csv", sep="")
    fNameT = paste ("distFileCoxT", j, ".csv", sep="")
    fNameD = paste ("distFileCoxD", j, ".csv", sep="")
    print (paste ("Processing files: ", fNameU, " , ", fNameT,
                  " , ", fNameD))
    for (k in 1:nChunks){
      print (paste ("Chunk: ", k))
      xj = as.matrix (read.csv (fNameU, sep=",", header=F,
        skip=(k-1)*chunkSize, nrows=chunkSize))
      tj = as.numeric (read.csv (fNameT, sep=",", header=F,
        skip=(k-1)*chunkSize, nrows=chunkSize)[,1])
      dj = as.numeric (read.csv (fNameD, sep=",", header=F,
        skip=(k-1)*chunkSize, nrows=chunkSize)[,1])
      
      gr2 = numeric (p)
      for (i in 1:chunkSize){
        xbNum = numeric (p)
        xbDen = 0.0
        for (l in 1:chunkSize){
          xbNum = xbNum + xj[l,]*(tj[l] >= tj[i])*exp(sum(xj[l,]*theta2))
          xbDen = xbDen + (tj[l] >= tj[i])*exp(sum(xj[l,]*theta2))
        }
        gr2 = gr2 - dj[i]*(xj[i,] - xbNum/xbDen)
      }
      
      if (firstFlag){
        theta2 = theta2 - (1e-5)*gr2
        firstFlag=F
      } else{
        stepSize = sum((theta2-theta1)*(gr2-gr1))/sum((gr2-gr1)^2)
        stepSize = max (stepSize, 1e-4)
        theta1 = theta2
        gr1 = gr2
        theta2 = theta2 - stepSize*gr2
      }
      
      plot (theta2)
    }
  }
}
