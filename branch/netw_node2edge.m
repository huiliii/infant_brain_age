function [edge_net_index] = netw_node2edge(node_net_index)

% convert network_index on node level (nx1) to edge level (nxn)
% each element in edge_network (i,j) indicates which two networks 
% the edge links, intranetwork or internetwork

% **notice: undirectional edges here***

num_node = length(node_net_index);

edge_net_index = zeros(num_node,num_node);

for i = 1:num_node
    for j = 1:num_node
       
        edge_temp = [node_net_index(i);node_net_index(j)];
        edge_temp = sort(edge_temp);

        edge_net_index = edge_temp(1)*10+edge_temp(2);
    end
end



