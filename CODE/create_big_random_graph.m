


edge_list=table2array(socEpinions1);
if (min(min(edge_list)))==0
    edge_list=edge_list+1;
end
node_no=max(max(edge_list));
adj = sparse(edge_list(:,1), edge_list(:,2), 1, node_no, node_no);

no_of_random_graph=20;
adj_mat_cell=cell(1,no_of_random_graph);

for i=1:no_of_random_graph
    
    rand_mat=ceil(sprand(node_no,node_no,0.7));
    adj_mat_cell{i}=adj.*rand_mat;
    
end

save('adj_mat_cell_big.mat','adj_mat_cell','node_no')
    