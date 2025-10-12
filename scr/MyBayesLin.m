% classification task using Linear Bayes
clear all;

tic
I=load('DataSet.txt');

% select a subset of features from file (labels/groups are g)
%var1=I(2:2:end,4); var2=I(2:2:end,7);  g=I(2:2:end,8);   
var1=I(:,4); var2=I(:,7);  g=I(:,8);
%var1=I(:,1); var2=I(:,3);  g=I(:,8);
%var1=I(:,5); var2=I(:,6);  g=I(:,8);

% process to print dati, subdivided for  Bayesian classifier
figure; h1 = gscatter(var1,var2,g,'rgb','.',[],'off'); 
legend('class1 ','class2','class3','Location','NW');
[X,Y] = meshgrid(linspace(min(var1),max(var1)),linspace(min(var2),max(var2)));
X = X(:); Y = Y(:);
% Bayes -  classify
[C,err,P,logp,coeff] = classify([X Y],[var1 var2],g,'linear');

K = coeff(1,2).const;
L = coeff(1,2).linear;
KK = coeff(1,3).const;
LL = coeff(1,3).linear;
KKK = coeff(2,3).const;
LLL = coeff(2,3).linear;

f = sprintf('0 = %g+%g*x+%g*y',K,L(1),L(2));
ff = sprintf('0 = %g+%g*x+%g*y',KK,LL(1),LL(2));
fff = sprintf('0 = %g+%g*x+%g*y',KKK,LLL(1),LLL(2));

%hold on; h2 = ezplot(f,[min(var1) max(var1) min(var2) max(var2)]);
%hold on; h3 = ezplot(ff,[min(var1) max(var1) min(var2) max(var2)]);
%hold on; h4 = ezplot(fff,[min(var1) max(var1) min(var2) max(var2)]);
hold on; gscatter(X,Y,C,'rgb','.',1,'off');
xlabel('Length of Kernel '); ylabel('Kernel Groove');
title('{\bf Linear Bayes}');


%----------
% print the confusion matrix
% classify will give the classification results, the linear Bayes
[C2,err,P,logp,coeff] = classify([var1 var2],[var1 var2],g,'linear');
% confusion matrix
disp("confusion matrix:")
disp(crosstab(C2,g))

toc