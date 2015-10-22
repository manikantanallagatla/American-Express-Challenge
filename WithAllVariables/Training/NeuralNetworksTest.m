
clear ; close all; clc


input_layer_size  = 31;  % 20x20 Input Images of Digits
hidden_layer_size = 68;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

load("X.mat");
load('Y.mat');
%X = [X_1 X_2 X_3 X_4 X_5 X_6 X_7 X_8 X_9 X_10 X_11 X_12 X_13 X_14 X_15 X_16 X_17 X_18 X_19 X_20 X_21 X_22 X_23 X_24 X_25 X_26 X_27];

X = x;m = size(X, 1);
Y = Y(1:14273);
load("FinalTheta");
%initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
%initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_Theta1 = Theta1;
initial_Theta2 = Theta2;
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

options = optimset('MaxIter', 10);

lambda = 100;

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

save FinalTheta.mat Theta1 Theta2
NeuralNetworksTest
