function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


sigma_grad = zeros(size(theta));

for  i = 1: m

	h = 1 / (1 + exp(-(X(i, :) * theta)));

	J = J + (((-y(i)) * log(h)) - ((1 - y(i)) * log(1 - h)));
	
	for  j = 1: length(theta)

			sigma_grad(j) = sigma_grad(j) + ((h - y(i)) * X(i, j));
			
	end
	
end

grad(1) = ((1/m) * sigma_grad(1));

sigma_theta = 0;

for  j = 2: length(theta)
	
	sigma_theta = sigma_theta + (theta(j) ^ 2);
	
	grad(j) = ((1/m) * sigma_grad(j)) + ((lambda / m) * theta(j));
	
end

J = (1/m) * J + ((lambda / (2 * m)) * sigma_theta);

% =============================================================

end
