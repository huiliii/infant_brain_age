function [C] = vec2connectome(b)
% input v
% output A n_nodes x n_nodes
n=roots([1,1,-2*numel(b)]);
n=n(n>0)+1;

C=tril(ones(round(n)),-1);
C(logical(C))=b;
C=C+C.';



