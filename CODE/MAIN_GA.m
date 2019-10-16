clear all;
clc;

%load network data
load('adj_mat_cell.mat');


%% GA Parameters 

% define ga parameters
NumGen          = 5;         
population_len  = 10;         
V               = node_no;   
seed_len        = 10;    
max_timesteps   = 5;     
num_elites      = 2;
num_mutation    = round(0.1*seed_len);


%% Initializations
%initialize seed sts

all_node=1:V;
seed_set = create_population(population_len,seed_len,all_node);

% initialize fitness storagee
all_fitness_vector=zeros(NumGen, population_len);
all_seed=cell(1,NumGen);
max_fitness=zeros(1,population_len);

%% Running the GA for evolving the chromosomes

% run the GA for mentioned generations

for i = 1:NumGen
    
    fitnessVector=zeros(1,population_len);
    
    for w=1:population_len   
        fitnessVector(w)= get_fitness(adj_mat_cell, all_node, seed_set(w,:),max_timesteps);
    end
    
    [~,FitIDx]    = sort(fitnessVector,'descend'); % Descending order
    hFitIDx       = FitIDx(1:num_elites);           % Fittest individuals
    new_seed_set    = zeros(population_len,seed_len);
    new_seed_set(1:num_elites,:) = seed_set(hFitIDx,:); % Get Elites
    
%%%%%%%%%% Apply crossover and mutation for generating rest of the population %%%%%%%%%%%%%%
    for j = num_elites+1:2:population_len       % Each time update two of the Chromosomes.  
        rng('Shuffle');
        
        rand_elite_index = randperm(num_elites,2);     % Take two random elites
        in_set1= new_seed_set(rand_elite_index(1),:) ;
        in_set2= new_seed_set(rand_elite_index(2),:) ;
        
        
        [in_setv1,in_setv2] =  do_crossover(in_set1,in_set2);
        new_seed_set(j,:)   = do_mutation_new(in_setv1,all_node,num_mutation);
        new_seed_set(j+1,:) = do_mutation_new(in_setv2,all_node,num_mutation);   
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    seed_set = new_seed_set; % New set of Chromosomes
    all_seed{i}=seed_set;
    all_fitness_vector(i,:)=fitnessVector;
    max_fitness(1,i)=max(fitnessVector);
    
    fprintf('%d\n',max(fitnessVector));
end

% save the fitness values
save_name=strcat('GA_pop_',num2str(population_len),'_seed_',num2str(seed_len),'_v1.mat');
        
save(save_name,'max_fitness','all_fitness_vector');

plot(max_fitness);