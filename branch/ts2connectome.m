function fc = ts2connectome(ts)
% input ts: num_node x num_timepoint x num_sub

[num_node,~,num_sub] = size(ts);
fc = zeros(num_node, num_node, num_sub);

for s = 1:num_sub
    ts_sub = squeeze(ts(:,:,s));
    [r,p] = corr(ts_sub',ts_sub');
    r(p>0.05) = 0;
    fc(:,:,s) = r;
end
