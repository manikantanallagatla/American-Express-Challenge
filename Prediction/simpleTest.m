

clear ; close all; clc


input_layer_size  = 27;  % 20x20 Input Images of Digits
hidden_layer_size = 68;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)


fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('FinalTheta.mat');

load('X_1.mat');load('X_2.mat');load('X_3.mat');load('X_4.mat');load('X_5.mat');load('X_6.mat');load('X_7.mat');load('X_8.mat');
load('X_9.mat');load('X_10.mat');load('X_11.mat');load('X_12.mat');load('X_13.mat');load('X_14.mat');load('X_15.mat');load('X_16.mat');
load('X_17.mat');load('X_18.mat');load('X_19.mat');load('X_20.mat');load('X_21.mat');load('X_22.mat');load('X_23.mat');load('X_24.mat');
load('X_25.mat');load('X_26.mat');load('X_27.mat');
X = [X_1 X_2 X_3 X_4 X_5 X_6 X_7 X_8 X_9 X_10 X_11 X_12 X_13 X_14 X_15 X_16 X_17 X_18 X_19 X_20 X_21 X_22 X_23 X_24 X_25 X_26 X_27];
m = size(X, 1);

pred = predict(Theta1, Theta2, X);
save answer.mat pred