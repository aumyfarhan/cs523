function out_set = do_mutation(in_set,all_node)



rand_old_seed_ind=randi([1,length(in_set)],1,1);

rand_new_seed_ind=randi([1,length(all_node)],1,1);

out_set=in_set;

out_set(rand_old_seed_ind)=all_node(1,all_node(rand_new_seed_ind));

