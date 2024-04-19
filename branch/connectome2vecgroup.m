function [upper_vectors] = connectome2vecgroup(As)
% turn upper-tria of A to a 1d vector
for s = 1:size(As,3)
    A = As(:,:,s);
    At = A.';
    m  = (1:size(At,1)).' > (1:size(At,2));
    upper_vector  = At(m);
    upper_vectors(:,s) = upper_vector;
end