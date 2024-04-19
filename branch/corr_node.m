function [r_node,p_node] = corr_node(controls, scores, options)

arguments
    controls double
    scores double
    options.pthred double = 0.05
    options.FDR double = 0
end

[node_num,~] = size(controls);
r_node = zeros(node_num,1);
p_node = zeros(node_num,1);


for n = 1:node_num
    [r_node(n,1), p_node(n,1)] = ...
        corr(controls(n,:)',scores,'rows','complete');
end
if options.FDR==1
    p_node = mafdr(p_node,'BHFDR',true);
end
r_node(p_node>options.pthred)=0;
r_node(isnan(r_node)) = 0;
