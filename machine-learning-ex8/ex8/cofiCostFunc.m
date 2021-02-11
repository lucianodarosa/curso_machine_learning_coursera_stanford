function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%

%fprintf('\n');
%fprintf('%d\n', size(Theta));           % 4 3 (num_users  x num_features matrix of user features)
%fprintf('\n');
%fprintf('%d\n', size(X));                  % 5 3 (num_movies  x num_features matrix of movie features)
%fprintf('\n');
%fprintf('%d\n', size(Y));                  % 5 4 (num_movies x num_users matrix of user ratings of movies)
%fprintf('\n');
%fprintf('%d\n', size(R));                  % 5 4 (num_movies x num_users matrix)
%fprintf('\n');
%fprintf('%d\n', size(X_grad));         % 5 3 (num_movies x num_features matrix)
%fprintf('\n');
%fprintf('%d\n', size(Theta_grad));  % 4 3 (num_users x num_features matrix)
%fprintf('\n');
%pause;

J = (1/2) * sum(((((Theta*X')'.*R).-Y).^2)(:));

J += ((lambda/2) * sum((Theta.^2)(:))) + ((lambda/2) * sum((X.^2)(:)));

%fprintf('\n======PASSOU========\n');

%X = [ones(size(X, 1), 1) X];

for i=1:size(Theta_grad, 1)

	idx = find(R(:,i) ==1);
	
	%fprintf('%d\n', idx);
	%fprintf('\n');
	%pause;
	
	X_temp = X(idx,:);
	Y_temp = Y(idx,i);
	
	%fprintf('\n==============\n');
	%fprintf('%d\n', size(X_temp));
	%fprintf('\n');
	%fprintf('%d\n', size(Theta(i,:)'));
	%fprintf('\n');
	%fprintf('%d\n', size(Y_temp'));
	%fprintf('\n');
	%fprintf('%d\n', size(X_temp));
	%fprintf('\n');
	%fprintf('%f\n', X_temp);
	%fprintf('\n========teste======\n');
	%fprintf('\n');
	%pause;
	
	teste = (((X_temp*Theta(i,:)')-Y_temp)'*X_temp) + (lambda * Theta(i,:));

	%fprintf('%d\n', size(teste));
	%fprintf('\n==============\n');
	%fprintf('\n');
	%pause;
	
	Theta_grad(i,:) = teste;
	
	%Theta_grad(i,:) = Theta_grad(i,:) + (lambda * Theta(i,:));

end

%fprintf('\n======FIM========\n');

for i=1:size(X_grad, 1)

	idx = find(R(i, :) ==1);
	
	%fprintf('%d\n', idx);
	%fprintf('\n');
	%pause;

	Theta_temp = Theta(idx,:);
	Y_temp = Y(i, idx);
	
	%fprintf('\n==============\n');
	%fprintf('%d\n', size(X(i,:)));
	%fprintf('\n');
	%fprintf('%d\n', size(Theta_temp'));
	%fprintf('\n');
	%fprintf('%d\n', size(Y_temp));
	%fprintf('\n');
	%fprintf('%d\n', size(Theta_temp));
	%fprintf('\n==============\n');
	%pause;
	
	teste = ((X(i,:)*Theta_temp'-Y_temp) * Theta_temp) + (lambda * X(i,:));
	
	%fprintf('%d\n', size(teste));
	%fprintf('\n');
	%pause;
	
	X_grad(i,:) = teste;
	
	%X_grad(i,:) = X_grad(i,:) + (lambda * X(i,:));

end










% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
