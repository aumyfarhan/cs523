function node_visited = do_dfs(cur_node,adj_mat,node_visited,cur_timestep)


if (node_visited(cur_node)==0) && (cur_timestep>=0)
    
    node_visited(cur_node)=1;
    current_neighbors= find(adj_mat(cur_node,:)==1);
    cur_timestep=cur_timestep-1;
    
    for cur_ind = 1:length(current_neighbors)
        cur_node=current_neighbors(cur_ind);
        node_visited=do_dfs(cur_node,adj_mat,node_visited,cur_timestep);
    end

end

 

