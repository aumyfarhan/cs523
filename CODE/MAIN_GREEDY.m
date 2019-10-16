clear all;
clc;

load('adj_mat_cell.mat');


%% GA Parameters 
   
V               = node_no;   
seed_len        = 10;    
max_timesteps   = 5;     



%% Initializations
all_node=1:V;

each_node_fitness_vector=zeros(1,V);


%% Running the GA for evolving the chromosomes

for seed = 1:V
    
    www=get_fitness_greedy(adj_mat_cell,seed,max_timesteps,all_node);
    www
    each_node_fitness_vector(seed)= www;

end


%save_name=strcat('GA_pop_',num2str(population_len),'_seed_',num2str(seed_len),'_v1.mat');
        
save(save_name,'max_fitness','all_fitness_vector');