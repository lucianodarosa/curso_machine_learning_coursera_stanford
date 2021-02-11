function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 

pw = size(X_poly, 2);

X_poly(:, 1:pw) = X(:).^[1:pw];
	
%fprintf('\n=============\n');
%fprintf('\n');
%fprintf('\n%f', (X_poly));
%fprintf('\n');
%fprintf('\n%d', size(X));
%fprintf('\n');
%fprintf('\n%d', p);
%fprintf('\n');
%fprintf('\n=============\n');
%pause;

% =========================================================================

end
