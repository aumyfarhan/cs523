function adj_mat=create_graph(V)

adj_mat=randi([0,1],V);
adj_mat=adj_mat-diag(diag(adj_mat));
for i=1:9
    for j=i+1:10
        adj_mat(j,i)=adj_mat(i,j);
    end
end