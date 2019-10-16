function [out_set1,out_set2] = do_crossover(in_set1,in_set2)

rng('shuffle');
rand_partition_ind=randi([1,length(in_set1)-1],1,1);

out_set1_1=in_set1(1:rand_partition_ind);
out_set1_2=in_set2(rand_partition_ind+1:end);

out_set1=[out_set1_1 out_set1_2];


out_set2_1=in_set2(1:rand_partition_ind);
out_set2_2=in_set1(rand_partition_ind+1:end);

out_set2=[out_set2_1 out_set2_2];
