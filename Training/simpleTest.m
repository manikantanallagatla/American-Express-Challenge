
clear ; close all; clc


input_layer_size  = 6;  % 20x20 Input Images of Digits
hidden_layer_size = 36;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)


fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('ThetaTeke.mat');
load('X_1.mat');load('X_23.mat');load('X_24.mat');
load('X_25.mat');load('X_26.mat');load('X_27.mat');load('Y.mat')
X = [X_1 X_23 X_24 X_25 X_26 X_27];
m = size(X, 1);


pred = predict(Theta1, Theta2, X);
save answer.mat pred