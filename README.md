This was a university project for an exam; it contains MATLAB scripts comparing different Bayesian classifiers.
the models take as input a "DataSet.txt", containing different features.
the models were tested using the dataset:  
Charytanowicz, M., Niewczas, J., Kulczycki, P., Kowalski, P., & Lukasik, S. (2010). Seeds [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5H30K.
Data for testing were pre-processed and normalized. The input .txt file should have the structure as:
'%label1 %label2 %label3  ... %class'  
'x_11 x_12 x_13 ...           1'   
'x_21 x_22 ...                2'  
.  
.  
.  

The feature selection in involved to choose up to 3 features plus the label/class (described by a number)
In the project the files:
-MyBayesLin: contains a linear classifier. output: confusion matrix, classification image and elapsed time  
-MyBayesQ:   contains a quadratic classifier. output: confusion matrix, classification image and elapsed time  
-MyMultipleBayes: different classifiers are considered. classification involves the mode of results. output: confusion matrix, classification image and elapsed time  
-LOOCV_MyBayes: estimate classification error via LOOCV for Linear and Quadratic models  
-LOOCV_MultipleBayes: estimate classification error via LOOCV for ensemble of models  
(Leave-one-out cross-validation see:https://en.wikipedia.org/wiki/Cross-validation_(statistics)#Leave-one-out_cross-validation)  








