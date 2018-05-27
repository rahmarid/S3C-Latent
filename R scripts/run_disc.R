library(parallel)
library(doParallel)
library(s3clatent)
c2 <- makeCluster(30) #set a cluster of 30 cores
registerDoParallel(c2)



load("data4_400_disc.RData") #to change the data
numSubset <- 35 #to change the number of subsets
num_iteration <- 30 #to change the number of iterations
all_Pop <- 50 #to change the number of models in a population
allMut <- 0.01 #to chagne the mutation rate/probability
allCross <- 0.45 #to change the crossover rate/probability
longi <- FALSE #set to FALSE as the current version of S3C-Latent only supports cross-sectional data
num_time <- 1 #set to 1
the_co <- "covariance" #doesn't matter for ordinal data.
cons_matrix <- NULL #see documentation to set a constraint matrix
th <- 0.6 #threshold of stability selection.
mix <- TRUE #if ordinal data or a mixture of continuous and ordinal data.




result <- list()

for (i in 1:20) {
  
  print(i)
  result[[i]] <- s3clatent::stableSpec3(theData = data4_400_d$newSample[[i]], nSubset = numSubset,
                                                  allIteration = num_iteration, allPop = all_Pop,
                                                  allMutRate = allMut, allCrossRate = allCross,
                                                  longitudinal = longi, numTime = num_time,
                                                  co = "covariance", consMatrix = cons_matrix, 
                                                  threshold = th, mixture = mix, 
                                                  latentList = allLatent4[[i]])
  
}
stopCluster(c2)

