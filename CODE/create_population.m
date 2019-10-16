function all_population = create_population(population_len,seed_len,all_node)    

all_population = zeros(population_len,seed_len);

for i =1:population_len
    rng('shuffle');
    all_population(i,:) = randperm(length(all_node),seed_len); 
end