
soc=table2array(socEpinions1);
if (min(min(soc)))==0
    soc=soc+1;
end
node_no_soc=max(max(soc));
adj_soc = sparse(soc(:,1), soc(:,2), 1, node_no_soc, node_no_soc);

no_of_random_graph=20;
adj_mat_cell=cell(1,no_of_random_graph);

for i=1:no_of_random_graph
    
    rand_mat=sparse(randi([0 1],node_no_soc,node_no_soc));
    adj_mat_cell{i}=adj_soc
    
    
    