% classify with multiple classifier 
% and merge results. then estiamte error via LOOCV
clear all;

tic
I=load('DataSet.txt');

var1=I(:,4); var2=I(:,7);  g=I(:,8);
var3=I(:,1); var4=I(:,3);  g=I(:,8);
var5=I(:,5); var6=I(:,6);  g=I(:,8);
var7=I(:,2); var8=I(:,6);  g=I(:,8);
var9=I(:,3); var10=I(:,7);  g=I(:,8);

%----------------------------
responses = zeros(210,5);
predictions = zeros(210:1);

for i=1:210
    
    train_var1 = var1;
    train_var2 = var2;
    train_var3 = var3;
    train_var4 = var4;
    train_var5 = var5;
    train_var6 = var6;
    train_var7 = var7;
    train_var8 = var8;
    train_var9 = var9;
    train_var10 = var10;
    
    train_var1(i) = [];
    train_var2(i) = [];
    train_var3(i) = [];
    train_var4(i) = [];
    train_var5(i) = [];
    train_var6(i) = [];
    train_var7(i) = [];
    train_var8(i) = [];
    train_var9(i) = [];
    train_var10(i) = [];
    
    train_g = g;
    train_g(i) = [];
    %--------
    test_var1 = var1(i);
    test_var2 = var2(i);
    test_var3 = var3(i);
    test_var4 = var4(i);
    test_var5 = var5(i);
    test_var6 = var6(i);
    test_var7 = var7(i);
    test_var8 = var8(i);
    test_var9 = var9(i);
    test_var10 = var10(i);
    
    % classify with the models
    [C1,err1,P1,logp1,coeff1] = classify([test_var1 test_var2],[train_var1 train_var2],train_g,'linear');
    [C2,err2,P2,logp2,coeff2] = classify([test_var3 test_var4],[train_var3 train_var4],train_g,'quadratic');
    [C3,err3,P3,logp3,coeff3] = classify([test_var5 test_var6],[train_var5 train_var6],train_g,'linear');
    [C4,err4,P4,logp4,coeff4] = classify([test_var7 test_var8],[train_var7 train_var8],train_g,'quadratic');
    [C5,err5,P5,logp5,coeff5] = classify([test_var9 test_var10],[train_var9 train_var10],train_g,'quadratic');
    
    responses(i,1) = C1;
    responses(i,2) = C2;
    responses(i,3) = C3;
    responses(i,4) = C4;
    responses(i,5) = C5;
    

    M = mode(responses(i,:));
    predictions(i,1) = M;    
end

% controllo dell'errore
Errors = 0;

for i= 1:210
    if (predictions(i,1)~= g(i,1))
        Errors = Errors + 1;
    end
end


fprintf('\n');
fprintf('-----------\n');
fprintf('results of Multi Models: \n');
disp(crosstab(predictions,g))
fprintf('total error = %f', Errors/210);
fprintf('\n');

toc