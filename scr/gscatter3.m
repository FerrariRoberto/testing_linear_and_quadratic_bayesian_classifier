function graph = gscatter3(x,y,z,g) 

% this function to print a 3D image, support 3 labels 

colors = {'b','r','g'}; 
[groups, ~, groupIdx] = unique(g);

graph = [];
for i = 1:length(groups)
    indices = find(g == groups(i)); 
    ht = scatter3(x(indices),y(indices),z(indices), 36, colors{i},'filled');  
    hold on 
    graph = [graph(:); ht(:)];
end
box on
grid on
hold off