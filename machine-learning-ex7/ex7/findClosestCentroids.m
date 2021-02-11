function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%fprintf('\n');
%fprintf(' %d', size(X));
%fprintf('\n');
%fprintf(' %d', length(centroids));
%fprintf('\n');
%fprintf(' %d', centroids(1, :));

%fprintf('\n');
%fprintf(' %d', X(1));

%pause;

for i = 1:size(X, 1)

	%fprintf('\n');

	teste = [0 0 0];

	for j = 1:size(centroids, 1)
	
		teste(j) = sum(((X(i,:) - centroids(j,:)).^2)(:));

	end
	
	%fprintf(' %d\n', teste);
	%pause;
	
	[_, id] = min(teste);
	
	idx(i) = id;
	
	%fprintf(' %d\n', t);
	%fprintf(' %d\n', id);
	%fprintf('\n');
	
	
end

%fprintf('\n');
%fprintf(' %d', size(teste));
%fprintf('\n');
%fprintf(' %d', teste);

%pause;



% =============================================================

end

