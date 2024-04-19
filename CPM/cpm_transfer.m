function [y2_predict,perf] = cpm_transfer(x1,y1,x2,y2,kfolds,pthresh)

[x1,y1] = cpm_check_errors(x1,y1,kfolds);


[r1,p]=corr(x1',y1);
pmask1=(+(r1>0))-(+(r1<0)); 
pmask1=pmask1.*(+(p<pthresh));

[x2,y2] = cpm_check_errors(x2,y2,kfolds);
for i=1:size(x1,2)
    summary_feature1(i)=nanmean(x1(pmask1>0,i))-nanmean(x1(pmask1<0,i));
end
mdl=robustfit(summary_feature1,y1'); 


[r2,p]=corr(x2',y2);
pmask2 = sign(r1).*sign(r2).*pmask1;
for i=1:size(x2,2)
    % summary_feature2(i)=nanmean(x2(pmask>0,i))-nanmean(x2(pmask<0,i));
    summary_feature2(i)=nanmean(x2(pmask2>0,i))-nanmean(x2(pmask2<0,i));
    y2_predict(i,1)=mdl(2)*summary_feature2(i) + mdl(1); 
end


[r,p] = corr(y2_predict,y2);
mae = mean(abs(y2_predict-y2));
perf = [r p];
