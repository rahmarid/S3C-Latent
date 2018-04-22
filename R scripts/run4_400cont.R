library(parallel)
library(doParallel)
library(stablespecImptLatent)
c1 <- makeCluster(25)
registerDoParallel(c1)



load("data4_400_cont.RData")
numSubset <- 25
num_iteration <- 30 
all_Pop <- 50
allMut <- 0.01
allCross <- 0.45
longi <- FALSE
num_time <- 1
the_co <- "covariance"
cons_matrix <- NULL
th <- 0.6
to_plot <- FALSE
mix <- FALSE
imputed <- FALSE
toMultiple <- FALSE
toComplement <- FALSE



result <- list()

for (i in 1:10) {
  
  print(i)
  result[[i]] <- stablespecImptLatent::stableSpec(theData = data4_400[[i]], nSubset = numSubset,
                                                  allIteration = num_iteration, allPop = all_Pop,
                                                  allMutRate = allMut, allCrossRate = allCross,
                                                  longitudinal = longi, numTime = num_time,
                                                  co = "covariance", consMatrix = cons_matrix, threshold = th,
                                                  toPlot = to_plot, mixture = mix, impute = imputed, 
                                                  latentList = allLatent4[[i]],
                                                  multiple = toMultiple, complementary = toComplement)
  
}
stopCluster(c1)

