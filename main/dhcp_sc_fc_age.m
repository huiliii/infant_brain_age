clear 
addpath '/utils'
addpath '/CPM'

%% load data
% load structural/functional brain connectome
% num_edge x num_subject
% sc_edge_all; fc_edge_all

% load demo data
% ga: num_subject x 1, gestational age
% pma: num_subject x 1, postmenstrual age
% sex: num_subject x 1



% define term/preterm
index_term = (ga>=37);
index_preterm = (ga<37);


%% SC_age
age = pma;

% age prediction 
pt = 0.01;
% whole-brain connectivity cpm ~age repeat 100 times 
for i = 1:100
[age_pred_sc_rep(:,i),pmask_sc(:,i)] = cpm_main(sc_edge_all,age,'kfolds',10,'pthresh',pt);
end
age_pred_sc = mean(age_pred_sc_rep,2);


% network connectivity cpm ~ age
% load your network definition: edge_net_vec_index: num_edge x 1, each
% elements indicates the network the edge belongs to
net_edge_vec = unique(edge_net_vec_index);
for n = 1:length(net_edge_vec)
    try
        [age_network_pred(:,n),~,~,rp(n,:)] = cpm_main(sc_edge_all(edge_net_vec_index==net_edge_vec(n),:),age,'kfold',10,'pthresh',pt);
    catch
        fprintf('loop number %d failed\n',n)
    end 
end
age_error_sc_network_pred = repmat(age,1,36) - age_network_pred;

% age pred error
age_dev_sc = age-age_pred_sc;
age_dev_abs_sc = abs(age_dev_sc);
[r,p] = corr(age_dev_sc,epds_tot,'rows','complete')
[h,p,~,t] = ttest2(age_dev_sc(psych_mother==0),age_dev_sc(psych_mother==1))
[r,p] = corr(age_dev_sc,bayley_cog,'rows','complete')



%% FC_age
% whole-brain connectivity cpm ~age repeat 100 times 
for i = 1:100
[age_pred_fc_rep(:,i),pmask_fc(:,i)] = cpm_main(fc_edge_all,age,'kfolds',10,'pthresh',pt);
end
age_pred_fc = mean(age_pred_fc_rep,2);

% network
net_edge_vec = unique(edge_net_vec_index);
for n = 1:length(net_edge_vec)
    try
        [age_network_pred(:,n),~,~,rp(n,:)] = cpm_main(fc_edge_all(edge_net_vec_index==net_edge_vec(n),:),age,'kfold',10,'pthresh',pt);
    catch
        fprintf('loop number %d failed\n',n)
    end 
end
age_error_fc_network_pred = repmat(age,1,36) - age_network_pred;

% age pred error
age_dev_fc = age-age_pred_fc;
age_dev_abs_fc = abs(age_dev_fc);
[r,p] = corr(age_dev_fc,epds_tot,'rows','complete')
[r,p] = corr(age_dev_fc,bayley_cog,'rows','complete')


%% SC-FC

% SC age ~ FC age
[r,p] = corr(age_pred_fc,age_pred_sc)
age_dev_sc_fc = age_pred_sc-age_pred_fc;

