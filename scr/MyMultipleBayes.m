% train different Bayes classifiers and then 
% merge results for classification

clear all;

tic
I=load('DataSet.txt');

% load variables
var1=I(:,4); var2=I(:,7);  g=I(:,8);
var3=I(:,1); var4=I(:,3);  g=I(:,8);
var5=I(:,5); var6=I(:,6);  g=I(:,8);
var7=I(:,2); var8=I(:,6);  g=I(:,8);
var9=I(:,3); var10=I(:,7);  g=I(:,8);

%----------------------------

%----------------------------
responses = zeros(210,5);
prediction = zeros(210:1);

% multiple classifier types
[C1,err1,P1,logp1,coeff1] = classify([var1 var2],[var1 var2],g,'linear');
[C2,err2,P2,logp2,coeff2] = classify([var3 var4],[var3 var4],g,'quadratic');
[C3,err3,P3,logp3,coeff3] = classify([var5 var6],[var5 var6],g,'linear');
[C4,err4,P4,logp4,coeff4] = classify([var7 var8],[var7 var8],g,'quadratic');
[C5,err5,P5,logp5,coeff5] = classify([var9 var10],[var9 var10],g,'quadratic');

responses(:,1) = C1;
responses(:,2) = C2;
responses(:,3) = C3;
responses(:,4) = C4;
responses(:,5) = C5;

for i= 1:210
    %[L,K] = max(responses(i,:));
    %prediction(i,1) = L;
    M = mode(responses(i,:));
    prediction(i,1) = M;
end
disp("confusion matrix:")
disp(crosstab(prediction,g))

figure; h1 = gscatter(var1,var2,g,'rgb','.',[],'off'); 
xlabel('Length of Kernel '); ylabel('Kernel Groove');
title('{\bf Original Classes}');
figure; h2 = gscatter(var1,var2,prediction,'rgb','.',[],'off');
xlabel('Length of Kernel '); ylabel('Kernel Groove');
title('{\bf Predicted Classes}');

toc