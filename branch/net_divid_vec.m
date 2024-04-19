function net_vecs = net_divid_vec(vecs,nets)

net_num = length(unique(nets));
sub_num = size(vecs,2);

net_vecs = zeros(net_num,sub_num);

for n = 1:net_num
    net_vecs(n,:) = mean(vecs(nets==n,:));
end
