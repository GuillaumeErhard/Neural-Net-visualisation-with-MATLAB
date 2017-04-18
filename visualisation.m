%% Programm by Guillaume ERHARD

% This programm was used to generate all the differents gif and plot used
% in the github.
% github.com/GuillaumeErhard/Neural-Network-visualisation-with-MATLAB
% But be free to use it as a base for any other visualisation.

%%------------------------
clear all; close all;clc;


addpath('./Data');                         
              


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Visualise accuracy after X iteration and effect of number of
%   hidden layer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k = 1:10
    M = load(sprintf('pred_size_%d_1000i.mat',k));
    Data{k}=M.Prediction;
end

min_hidden_layers_size = 15;   
max_hidden_layers_size = 55;



for k = min_hidden_layers_size:5:max_hidden_layers_size
    M = load(sprintf('pred_size_%d_1000i.mat',k));
    Data{k/5+8}=M.Prediction;
end


% Plotting accuracy over iterations

figure();
number_hiddens_layer = [1,2,3,4,5,6,7,8,9,10,15,20,25,30,35,40,45,50,55];

for k=1:size(Data,2)
     
    p=plot(1:size(Data{1},1),Data{k},'LineWidth',2); ylim([0 100])
    title([ 'Number of hidden layers : ' num2str(number_hiddens_layer(k))] ,'FontWeight','bold');
    xlabel('Iterations','FontWeight','bold');
    ylabel('Accuracy in percent','FontWeight','bold');
    pause(0.6);
    hold on;
    
end

% Plotting accuracy reached by each neural nets after 50 iterations

accur_at_50i = cell2mat(Data(1:end));
accur_at_50i = accur_at_50i(50,1:size(Data,2));
figure();
bar(number_hiddens_layer,accur_at_50i,'FaceColor',[0.8 0.49 0]);
title('Accuracy of the neural nets after 50 iterations','FontWeight','bold');
xlabel('Number of hidden layers','FontWeight','bold');
ylabel('Accuracy in percent','FontWeight','bold');
plot(1:size(Data{1},1),Data{1},1:size(Data{1},1),Data{1},1:size(Data{1},1),Data{1});

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Visualise training
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('ex4data1.mat');

figure();

input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)
num_iter = 26;  
hidden_layer_size = 25;
    
lambda = 0.6; 

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

Prediction = zeros(num_iter,1);
for i = 1:num_iter

    
options = optimset('MaxIter', 1);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

initial_nn_params = nn_params;

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
displayDataCustom(Theta1(:, 2:end)); hold on;

pred = predict(Theta1, Theta2, X);
Prediction(i) = mean(double(pred == y)) * 100;

title(['Iteration : ' num2str(i) ' Accuracy : ' num2str(Prediction(i)) ' %']); 

fprintf('\nSize : %f \nTraining Set Accuracy: %f',hidden_layer_size,Prediction(i));


end
    



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Visualise trained neurons
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();


for k = 1:10
    load(sprintf('theta_size_25_200i_v_%d.mat',k));
    
    hidden_layer_size = 25;
    
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
    pred = predict(Theta1, Theta2, X);
    pred = mean(double(pred == y)) * 100;
    
    displayDataCustom(Theta1(:, 2:end)); hold on;
    
    title(['Neural net trained number : ' num2str(k) ' Accuracy : ' num2str(pred) ' %']);
    
    pause(2);
end




