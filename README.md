# Sepsis_Project

Code Repository for {Insert Citation for Paper} {add link to paper}

## DTW_Compute_Train_and_Validation_Cohorts.ipynb

#### Jupyter notebook calculates dynamic time warping distance matrices for both training and validation cohorts. <br>
*Note: Execute notebook separetely for each (ie. two runs to complete both training and validation)*
<br>
<br>
#### Raw Data used displayed below
*['respiratoryrate', 'heartrate', 'systolicBP', 'diastolicBP', 'temperature'] are the key columns.* <br>
![image](https://user-images.githubusercontent.com/116388073/208173716-ea3934f8-f8b3-41d6-8606-cb3b74c52cb4.png)
<br>
<br>
#### Data from columns of interest will be recast into an array of shape (observations, admitted , admitted hours window, features values) before DTW algorithm applied
![image](https://user-images.githubusercontent.com/116388073/208174534-818045e6-6ee6-4cd3-97a2-b55e542371cf.png)

#### Resultant distance matrices forwarded to consensus clustering algorithm.

## DTW_Consensus_Clustering.ipynb (DTW_Consensus_Clustering.R)
*Note: Code is written in R, but also designed to be excuted in a python environment using r2py package. If using python, will need to load in the accompanying .tar file for the appropriate installations of R libraries (example provided in the notebook)* <br>

#### Input distance matrix, returns a ConsensusClusterPlus object
A variety of results can be extracted and saved from this object (see documentation [here](https://www.bioconductor.org/packages/release/bioc/vignettes/ConsensusClusterPlus/inst/doc/ConsensusClusterPlus.pdf)), for this study the consensus classes were recorded as well as four standard plots output by the algorithm.
