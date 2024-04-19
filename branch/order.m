function ranking_order = order(arr)
% descend: rank 1 = max; ascend: rank 1 = min
%     [~,i] = sort(arr,'descend');
%     r = 1:length(arr);
%     r(i) = r;
%     ranking_order = r';
[~,ii]=sort(arr,'descend');
[~,ranking_order]=sort(ii);
end

