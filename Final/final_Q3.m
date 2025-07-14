% Implement the penalty method with the 
% quadratic penalty function

clearvars;
close all;
clc;

%% Problem Setting
Q = [2 1 0 10; 
    1 4 3 0.5;
    0 3 -5 6;
    10 0.5 6 -7];
b = [-1; 0; -2; 3];

obj_f = @(x) 0.5 * x' * Q * x + b' * x;
h_f = @(x) sum(x.^2) - 1;
g_f = @(x) max(0, -x);

%% Parameters
x_init = ones(4,1);
x_k = x_init / norm(x_init);
c_init = 1;
c_k = c_init;
beta = 2;
epsilon = 1e-6;
max_iter = 100;

history_f_vals = [];
history_penalties = [];
history_P_vals = [];

%% Penalty Method 
fprintf('Starting Penalty Method ...\n');

for k = 1:max_iter
    x_k = gd_backtracking(Q, b, c_k, x_k);
    
    f_val = obj_f(x_k);
    P_val = penalty_value(x_k);
    penalty_val = c_k * P_val;

    history_f_vals(end+1) = f_val;
    history_P_vals(end+1) = P_val;
    history_penalties(end+1) = penalty_val;

    fprintf("Iter %2d: f(x)=%.4f, P(x)=%.4e, c*P=%.4e\n", ...
        k, f_val, P_val, penalty_val);

    if penalty_val < epsilon
        fprintf("Converged. \n")
        break;
    end

    c_k = beta * c_k;
end

%% Results
fprintf("\n x_init: \n");
disp(x_init / norm(x_init));
fprintf("Final solution x_k: \n");
disp(x_k);

%% Plot
figure;
semilogy(1:length(history_f_vals), history_f_vals,'LineWidth', 1.5); 
title('f(x_k) vs. Iteration');
xlabel('Iteration k')
ylabel('f(x_k)')
grid on

figure;
semilogy(1:length(history_penalties), history_penalties, 'LineWidth', 1.5); 
title('c_k * P(x_k) vs. Iteration');
xlabel('Iteration k')
ylabel('c_k * P(x_k)')
grid on

figure;
semilogy(1:length(history_P_vals), history_P_vals, 'LineWidth', 1.5); 
title('P(x_k) vs. Iteration');
xlabel('Iteration k')
ylabel('P(x_k)')
grid on