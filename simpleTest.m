
clear ; close all; clc


input_layer_size  = 30;  % 20x20 Input Images of Digits
hidden_layer_size = 30;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)


fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('ThetaValueWith25Iterations.mat');
load ('data.mat');


pred = predict(Theta1, Theta2, X);
save answer.mat pred