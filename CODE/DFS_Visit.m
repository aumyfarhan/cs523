function color = DFS_Visit(u,adj,color,time,timesteps)
%% Take the neighbours of given 'u'. 
fprintf("Node %d\n",u);
allAdj_U = adj(u,:);
Adj_U = find(allAdj_U==1);
%color_U = color(Adj_U);
%gain=length(find(color_U=='w'));
%color(Adj_U) = 'B';
for v = 1:length(Adj_U)
fprintf(" Make %d black\n",Adj_U(v));    
color(Adj_U(v)) = 'B';     
end
%% If the time consgtraints agree 
if(time<=timesteps && length(find(color=='B'))<=length(color))
    time = time+1; % Increase the time steps 
    for v = 1:length(Adj_U)
         color = DFS_Visit(Adj_U(v),adj,color,time,timesteps);
         %gain=gain+g;
         %DFS_Visit(Adj_U(v),adj,time,timesteps);
         %end
    end     
end
%
end
