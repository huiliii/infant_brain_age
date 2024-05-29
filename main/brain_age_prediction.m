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

% age pred error
age_dev_sc = age-age_pred_sc;
age_dev_abs_sc = abs(age_dev_sc);




%% FC_age
% whole-brain connectivity cpm ~age repeat 100 times 
for i = 1:100
[age_pred_fc_rep(:,i),pmask_fc(:,i)] = cpm_main(fc_edge_all,age,'kfolds',10,'pthresh',pt);
end
age_pred_fc = mean(age_pred_fc_rep,2);

% age pred error
age_dev_fc = age-age_pred_fc;
age_dev_abs_fc = abs(age_dev_fc);



%% SC-FC

% SC age ~ FC age
[r,p] = corr(age_pred_fc,age_pred_sc)
age_dev_sc_fc = age_pred_sc-age_pred_fc;

%% further brain-behav association
% [r,p] = corr(age_dev_sc,epds_tot,'rows','complete')
% [r,p] = corr(age_dev_sc,bayley_cog,'rows','complete')
% [r,p] = corr(age_dev_fc,epds_tot,'rows','complete')
% [r,p] = corr(age_dev_fc,bayley_cog,'rows','complete')

