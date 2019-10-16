clear all;
clc;

load('adj_mat_cell.mat');


%% GA Parameters 

NumGen          = 5;         
population_len  = 10*NumGen;         
V               = node_no;   
seed_len        = 10;    
max_timesteps   = 5;     


%% Initializations
all_node=1:V;
seed_set = create_population(population_len,seed_len,all_node);


all_fitness_vector=zeros(NumGen, population_len);
max_fitness=zeros(1,population_len);



%% Running the GA for evolving the chromosomes

    
fitnessVector=zeros(1,population_len);

for w=1:population_len   
    fitnessVector(w)= get_fitness(adj_mat_cell, all_node, seed_set(w,:),max_timesteps);
end
    
save_name=strcat('RANDOM_pop_',num2str(population_len),'_seed_',num2str(seed_len),'_v1.mat');
        
save(save_name,'fitnessVector');