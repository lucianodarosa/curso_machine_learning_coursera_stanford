function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

val_params = [0.01 0.03 0.1 0.3 1 3 10 30];

std_mean = 1.0;

for i = 1:length(val_params)

	for j = 1:length(val_params)

		model= svmTrain(X, y, val_params(i), @(x1, x2) gaussianKernel(x1, x2, val_params(j)));

		predictions = svmPredict(model, Xval);

		aux = mean(double(predictions ~= yval));

		if (aux < std_mean)

			std_mean = aux;
			
			C = val_params(i);
			sigma = val_params(j);
			
		end
		
	end

end

%fprintf('\n');
%fprintf('%f\n', std_mean);
%fprintf('\n');
%fprintf('%f\n', C);
%fprintf('\n');
%fprintf('%f\n', sigma);
%fprintf('\n');

% =========================================================================

end
