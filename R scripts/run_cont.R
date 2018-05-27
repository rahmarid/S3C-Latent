library(parallel)
library(doParallel)
library(s3clatent)
c1 <- makeCluster(25) #set a cluster of 25 cores
registerDoParallel(c1)



load("data4_400_cont.RData") #to change the data
numSubset <- 25 #to change the number of subsets 
num_iteration <- 30 # to change the number of iterations 
all_Pop <- 50 #to change the number of models 
allMut <- 0.01 #to change mutation rate/probability
allCross <- 0.45 #to change crossover rate/probability
longi <- FALSE #set to FALSE as the current version of S3C-Latent only supports cross-sectional data
num_time <- 1 # set to 1
the_co <- "covariance" #or "correlation"
cons_matrix <- NULL #see documentation to set a constraint matrix
th <- 0.6 #threshold of stability selection



result <- list()

for (i in 1:20) {
  
  print(i)
  result[[i]] <- stablespecImptLatent::stableSpec(theData = data4_400[[i]], nSubset = numSubset,
                                                  allIteration = num_iteration, allPop = all_Pop,
                                                  allMutRate = allMut, allCrossRate = allCross,
                                                  longitudinal = longi, numTime = num_time,
                                                  co = "covariance", consMatrix = cons_matrix, threshold = th,
                                                  latentList = allLatent4[[i]])
                                                  
  
}
stopCluster(c1)

