
clear ; close all; clc


input_layer_size  = 6;  % 20x20 Input Images of Digits
hidden_layer_size = 36;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)


load('X_1.mat');load('X_23.mat');load('X_24.mat');
load('X_25.mat');load('X_26.mat');load('X_27.mat');load('Y.mat')
X = [X_1 X_23 X_24 X_25 X_26 X_27];
m = size(X, 1);

fprintf('\nInitializing Neural Network Parameters ...\n')

%initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
%initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
load('ThetaTeke.mat');
initial_Theta1 = Theta1;
initial_Theta2 = Theta2;
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

options = optimset('MaxIter', 10000);

lambda = 1;

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, Y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));



pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == Y)) * 100);

save ThetaTeke.mat Theta1 Theta2
