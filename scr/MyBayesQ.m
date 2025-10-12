% classification task using Quadratic Bayes
clear all;

tic
I=load('DataSet.txt');

% select a subset of features 
var1=I(:,4); var2=I(:,7);  g=I(:,8);
%var1=I(:,1); var2=I(:,3);  g=I(:,8);
%var1=I(:,5); var2=I(:,6);  g=I(:,8);

figure; h1 = gscatter(var1,var2,g,'rgb','.',[],'off'); 
legend('class1','class2','class3','Location','NW');
[X,Y] = meshgrid(linspace(min(var1),max(var1)),linspace(min(var2),max(var2)));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[var1 var2],g,'quadratic');

K = coeff(1,2).const;
L = coeff(1,2).linear; 
Q = coeff(1,2).quadratic;
f = sprintf('0 = %g+%g*x+%g*y+%g*x^2+%g*x.*y+%g*y.^2',...
            K,L,Q(1,1),Q(1,2)+Q(2,1),Q(2,2));

KK = coeff(1,3).const;
LL = coeff(1,3).linear; 
QQ = coeff(1,3).quadratic;
ff = sprintf('0 = %g+%g*x+%g*y+%g*x^2+%g*x.*y+%g*y.^2',...
            KK,LL,QQ(1,1),QQ(1,2)+QQ(2,1),QQ(2,2));
        
KKK = coeff(2,3).const;
LLL = coeff(2,3).linear; 
QQQ = coeff(2,3).quadratic;
fff = sprintf('0 = %g+%g*x+%g*y+%g*x^2+%g*x.*y+%g*y.^2',...
            KKK,LLL,QQQ(1,1),QQQ(1,2)+QQQ(2,1),QQQ(2,2));
        
%hold on; h2 = ezplot(f,[min(var1) max(var1) min(var2) max(var2)]);
%hold on; h3 = ezplot(ff,[min(var1) max(var1) min(var2) max(var2)]);
%hold on; h4 = ezplot(fff,[min(var1) max(var1) min(var2) max(var2)]);
hold on; gscatter(X,Y,C,'rgb','.',1,'off');
xlabel('Length of Kernel '); ylabel('Kernel Groove');
title('{\bf Quadratic Bayes}');

%----------
% print the confusion matrix
% classify will give the classification results, the quadratic Bayes
[C2,err,P,logp,coeff] = classify([var1 var2],[var1 var2],g,'quadratic');

disp("confusion matrix:")
disp(crosstab(C2,g))

toc