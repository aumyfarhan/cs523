function out_set = do_mutation_new(in_set,all_node,num_mutation)

for cur_mutation=1:num_mutation
    
    rng('shuffle');
    rand_new_seed_ind=randi([1,length(all_node)],1,1);
    
    new_seed=all_node(1,rand_new_seed_ind);
    
    
    while (ismember(in_set,new_seed))
        
        rng('shuffle');
        rand_new_seed_ind=randi([1,length(all_node)],1,1);
    
        new_seed=all_node(1,rand_new_seed_ind);
    
    end
    
    rng('shuffle');
    rand_old_seed_ind=randi([1,length(in_set)],1,1);

    out_set=in_set;

    out_set(1,rand_old_seed_ind)=new_seed;

end