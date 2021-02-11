function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%=======================================================================================

h = sum((theta' .* X)')';

h_sigma = sum((h - y).^2);

reg_param = 0;
if (lambda != 0)
	reg_param = (lambda/(2*m)) * sum(theta(2:end,:).^2);
end

J = ((1/(2*m)) * h_sigma) + reg_param;

%=======================================================================================

if (m > 1)

	sigma_grad = sum(((h .- y) .* X));

	grad(1) = (1/m) * sigma_grad(1);

	lr_grads = ((1/m) * sigma_grad(2:end))';

else

	sigma_grad = (h .- y) .* X;

	grad(1) = (1/m) * sigma_grad(1);

	lr_grads = ((1/m) * sigma_grad(2:end))';

end

reg_param = 0;
if (lambda != 0)
	reg_param = ((lambda/m) * theta(2:end,:));
end

grad(2:end) = lr_grads + reg_param;

%fprintf('\n=============\n');
%fprintf('\n');
%fprintf('X............: [%d, %d]', size(X));
%fprintf('\n');
%fprintf('\n=============\n');
%pause;

%=======================================================================================

grad = grad(:);

end
