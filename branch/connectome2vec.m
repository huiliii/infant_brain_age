function [upper_vector] = connectome2vec(A)
% turn upper-tria of A to a 1d vector
At = A.';
m  = (1:size(At,1)).' > (1:size(At,2));
upper_vector  = At(m);