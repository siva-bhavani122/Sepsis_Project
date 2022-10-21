# Load Packages
library(tidyverse)
if (!require("BiocManager", quietly = TRUE))
install.packages("BiocManager",ask=FALSE)

BiocManager::install("ConsensusClusterPlus",ask=FALSE)
BiocManager::install("ALL",ask=FALSE)
library(ALL)
install.packages('cluster')
install.packages('ConsensusClusterPlus')
install.packages('diceR')
library(diceR)
library(ConsensusClusterPlus)

# Load Distance Matrix
dtw_dist <- read.csv('train_distances_normalized_no_stdcapped.csv') #load in DTW distance matrix (either train or valid)
dtw_dist <- subset(dtw_dist, select = -c(1))


# Run HC Consensus Clustering
results = ConsensusClusterPlus(as.matrix(dtw_dist),maxK=6,reps=100,pItem=0.8,pFeature=1, title='DTW_Train_HC',clusterAlg="hc", distance="pearson",plot="png",innerLinkage="complete")

# Output Results to CSV
for(j in 2:6){
CM = as.data.frame(results[[j]]['consensusClass'])
# ml = as.data.frame(results[[j]][['ml']][,])
# colnames(CM) = vader_assign_raw[,1]
# colnames(ml) = vader_assign_raw[,1]
# rownames(CM) = vader_assign_raw[,1]
# rownames(ml) = vader_assign_raw[,1]

write.csv(CM, paste0('train_consensus_class_cluster_',j, '_HC_dropseed_complete_normalized_nocap.csv'),row.names = TRUE)
}

# Run PAM Consensus Clustering
results = ConsensusClusterPlus(as.matrix(dtw_dist),maxK=6,reps=100,pItem=0.8,pFeature=1, title='DTW_Train_PAM',clusterAlg="pam", distance="pearson",plot="png",innerLinkage="complete")

# Output Results to CSV
for(j in 2:6){
CM = as.data.frame(results[[j]]['consensusClass'])
# ml = as.data.frame(results[[j]][['ml']][,])
# colnames(CM) = vader_assign_raw[,1]
# colnames(ml) = vader_assign_raw[,1]
# rownames(CM) = vader_assign_raw[,1]
# rownames(ml) = vader_assign_raw[,1]

write.csv(CM, paste0('train_consensus_class_cluster_',j, '_PAM_dropseed_complete_normalized_nocap.csv'),row.names = TRUE)
}
