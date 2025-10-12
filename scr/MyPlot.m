% print some features respect groups

clear all;

if(1)      
    I=load('DataSet.txt');        
    if(0) 
        % take 3 variables and label / group
        var1=I(:,4); var2=I(:,7); var3=I(:,1); g=I(:,8);
        %---
        [C2,err,P,logp,coeff] = classify([var1 var2 var3],[var1 var2 var3],g,'linear');
        crosstab(C2,g)
        %--- 
        figure; gscatter3(var1,var2,var3,I(:,8));
        legend('class1 ','class2','class3','Location','NW');
        xlabel('Length of Kernel '); ylabel('Kernel Groove');zlabel('Area');
    end;
    
    if(1) 
        % take 3 variables and label / group
        var1=I(:,3); var2=I(:,6); var3=I(:,7); g=I(:,8);
        %---
        [C2,err,P,logp,coeff] = classify([var1 var2 var3],[var1 var2 var3],g,'linear');
        crosstab(C2,g)
        %---
        figure; gscatter3(var1,var2,var3,I(:,8)); 
        legend('class1 ','class2','class3','Location','NW');
        xlabel('Compactness'); ylabel('Asymmetry Coeff.');zlabel('Length of K. Groove');
    end;
     
end;