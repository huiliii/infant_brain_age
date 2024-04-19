function net_cons = net_divid_con_group(cons,nets)

% input:cons=connectomes: num_node x num_node 
%       nets=network definition: num_node x1 

net_num = length(unique(nets));


       

net_cons = zeros(net_num,net_num);

for n = 1:net_num
    for m = 1:net_num
        net_cons(n,m) = sum(nonzeros(cons(nets==n,nets==m)));
    end
end
