function  adj= CreateGraph_AUMY(V,E)
if E > V*V
    frpintf("Specified connections aren't possible in the graph");
end
adj = spalloc(V, V, E);
idx = randperm(V * V, E+V);
idx(ismember(idx, 1:V+1:V*V)) = [];
idx = idx(1:E);
adj(idx) = 1;
adj = min( adj + adj.', 1);

end