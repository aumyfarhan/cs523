function fitness_value = get_fitness(adj_mat_cell, all_node, seed_set,max_timesteps)

each_graph_fitness=zeros(1,length(adj_mat_cell));


for graph_ind=1:length(adj_mat_cell)
    
    adj_mat=adj_mat_cell{graph_ind};
    node_visited=zeros(1,length(all_node));

    %old_fitness=sum(node_visited);
    cur_timestep=max_timesteps-1;

    for cur_ind=1:length(seed_set)

        cur_node=seed_set(cur_ind);

        node_visited = do_dfs(cur_node,adj_mat,node_visited,cur_timestep);

        %new_fitness=sum(node_visited);
    end
    
    each_graph_fitness(graph_ind)=sum(node_visited);
    
end

fitness_value=mean(each_graph_fitness);