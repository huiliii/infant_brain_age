function cortical_vec = wb2cortical(wb_vec)
% AAL2 120 nodes -> only cortical part 94 nodes

wb_con = vec2connectome(wb_vec);
cortical_vec = connectome2vec(wb_con(1:94,1:94));