library(parallel)
library(doParallel)
library(stablespecImptLatent)
c2 <- makeCluster(30)
registerDoParallel(c2)



load("data4_400_disc.RData") #to change the data
numSubset <- 35
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
mix <- TRUE
imputed <- FALSE
toMultiple <- FALSE
toComplement <- FALSE



result <- list()

for (i in 1:20) {
  
  print(i)
  result[[i]] <- s3clatent::stableSpec3(theData = data4_400_d$newSample[[i]], nSubset = numSubset,
                                                  allIteration = num_iteration, allPop = all_Pop,
                                                  allMutRate = allMut, allCrossRate = allCross,
                                                  longitudinal = longi, numTime = num_time,
                                                  co = "covariance", consMatrix = cons_matrix, threshold = th,
                                                  toPlot = to_plot, mixture = mix, impute = imputed, 
                                                  latentList = allLatent4[[i]],
                                                  multiple = toMultiple, complementary = toComplement)
  
}
stopCluster(c2)

