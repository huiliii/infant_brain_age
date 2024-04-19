function net_cons = net_divid_con(cons,nets)

% input:cons=connectomes: num_node x num_node x num_sub
%       nets=network definition: num_node x1 

net_num = length(unique(nets));
[node_num,~,sub_num] = size(cons);
cons_new = zeros(size(cons));

       

net_cons = zeros(net_num,net_num,sub_num);

for n = 1:net_num
    for m = 1:net_num
        net_cons(n,m,:) = mean(nonzeros(cons(nets==n,nets==m,:)));
        % net_cons(n,m,:) = sum(cons(nets==n,nets==m,:),[1 2]);
    end
end
