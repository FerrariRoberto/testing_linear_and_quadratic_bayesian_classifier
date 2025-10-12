
% classify and make confrontation between Linear and Quadratic classifier
% (Bayes)   and estiamte error via LOOCV
clear all;

I=load('DataSet.txt');

var1=I(:,4); var2=I(:,7);  g=I(:,8);        % kernel groove and length K
%var1=I(:,1); var2=I(:,3);  g=I(:,8);         % area and compactness
%var1=I(:,5); var2=I(:,6);  g=I(:,8);        % width and asymm



% --- Linear and Quadratic Bayes --------
% to store in memory classification results for LOOCV
predictionsLin = zeros(210,1);
predictionsQuad = zeros(210,1);

% LOOCV - loop 
for i= 1:210
    
    train_var1 = var1;
    train_var2 = var2;
    train_g = g;
    % remove 1 element
    train_var1(i) = [];
    train_var2(i) = [];
    train_g(i) = [];
    % test case
    test_var1 = var1(i);
    test_var2 = var2(i);
    %---
    [C1,err,P,logp,coeff] = classify([test_var1 test_var2],[train_var1 train_var2],train_g,'linear');
    predictionsLin(i,1) = C1;
    
    [C2,err,P,logp,coeff] = classify([test_var1 test_var2],[train_var1 train_var2],train_g,'quadratic');
    predictionsQuad(i,1) = C2;
    
    %fprintf(G)
end

% check eerror
ErrorsLin = 0;
ErrorsQuad = 0;

for i= 1:210
    if (predictionsLin(i,1)~= g(i,1))
        ErrorsLin = ErrorsLin + 1;
    end
    
    if (predictionsQuad(i,1)~= g(i,1))
        ErrorsQuad = ErrorsQuad + 1;
    end
end
fprintf('\n');
fprintf('-----------\n');
fprintf('results of Linear Bayes: \n');
disp(crosstab(predictionsLin,g))
fprintf('total error = %f', ErrorsLin/210);

fprintf('\n');
fprintf('results of Quadratic Bayes: \n');
disp(crosstab(predictionsQuad,g))
fprintf('total error = %f', ErrorsQuad/210);
fprintf('\n');
