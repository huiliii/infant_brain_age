function connectome_sub = ts2cn(ts_sub)
% input: time_series n nodes x t timepoints x s subjects
% output: connectome 

[n_node,~,n_sub] = size(ts_sub);
connectome_sub = zeros(n_node,n_node,n_sub);

for s = 1:n_sub
    for i = 1:n_node
        for j = i+1:n_node
            [r,p] = corr(ts_sub(i,:,s),ts_sub(j,:,s));
            if p<0.05
                connectome_sub(i,j) = r;
            end
        end
    end
end

    
