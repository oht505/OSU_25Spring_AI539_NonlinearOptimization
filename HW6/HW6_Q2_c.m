% Implement of PARTAN with Backtracking Line Search 
% to find a local minimum point
% min_x f(x) = 0.5x^TQx - b^Tx + 0.5μ(c^Tx)^2

clearvars;
close all;
clc;

%% Load data
load('HW6_data.mat');

% Set μ value
mu = 1;
%mu = 1000;

%% PARTAN with Backtracking Line Search

% Initialization
grad_x = [];
f_x = [];
x_vals = [];
err_vals = [];
x_0 = zeros(size(b,1), 1);
x_k = x_0;
x_star = find_x_star(Q, b, c, mu);
n_restart = 20;
n_blocks = 5;

% Parameters
tau = 1.3e-5;
alpha_min = 1e-12; % Backtracking lower bound

% Backtracking parameters
eta = 2.0;
epsilon = 0.4;

% Save the first value
x_vals(:, 1) = x_0;
grad_vals(1) = norm(obj_grad(x_0, Q, b, c, mu));
f_vals(1) = obj(x_0, Q, b, c, mu);
err_vals(1) = norm(x_0 - x_star);

converged = false;
while true
    %% Step 1: x_1 = x_0 - alpha_0 * grad_f(x_0)
    g_0 = obj_grad(x_k, Q, b, c, mu);
    d_0 = -g_0;
    
    alpha_0 = 1.0;
    while obj(x_k + alpha_0 * d_0, Q, b, c, mu) > obj(x_k, Q, b, c, mu) + epsilon * alpha_0 * g_0' * d_0
        alpha_0 = alpha_0 / eta;
        if alpha_0 < alpha_min
            warning('Step size too small in Step 1.\n');
            break;
        end
    end
    x_k_prev = x_k;
    x_k = x_k + alpha_0 * d_0;
    
    % Save x1 results
    x_vals(:,end+1) = x_k;
    grad_vals(end+1) = norm(obj_grad(x_k, Q, b, c, mu));
    f_vals(end+1) = obj(x_k, Q, b, c, mu);
    err_vals(end+1) = norm(x_k - x_star);
    
    
    %% Step 2: PARTAN Update
    
    max_iter = 10000;
    for k = 2: max_iter
        
        % Step 2-(i) 
        g_k = obj_grad(x_k, Q, b, c, mu);
        d = -g_k;
    
        % Backtracking Line Search for α_k
        alpha = 1.0;
        while obj(x_k + alpha * d, Q, b, c, mu) > (obj(x_k, Q, b, c, mu) + epsilon * alpha * g_k' * d)
            alpha = alpha / eta;
            if alpha < alpha_min
                warning('Step size too small in Step 1.\n');
                break;
            end
        end
        y_k = x_k + alpha * d;
    
    
        % Step 2-(ii)
        g_yk = obj_grad(y_k, Q, b, c, mu);
        if g_yk' * (y_k - x_k_prev) < 0
            d_partan = y_k - x_k_prev;
        else
            d_partan = -(y_k - x_k_prev);
        end
    
    
        % Step 2-(iii)
        beta = 1.0;
        while obj(y_k + beta * d_partan, Q, b, c, mu) > (obj(y_k, Q, b, c, mu) + epsilon * beta * g_yk' * d_partan)
            beta = beta / eta;
            if beta < alpha_min
                warning('Beta size too small at iter %d\n', k);
                break;
            end
        end
        x_k_next = y_k + beta * d_partan;

        x_k_prev = x_k;
        x_k = x_k_next;
    
        % Save info
        x_vals(:, end+1) = x_k_next;
        grad_vals(end+1) = norm(obj_grad(x_k_next, Q, b, c, mu));
        f_vals(end+1) = obj(x_k_next, Q, b, c, mu);
        err_vals(end+1) = norm(x_k_next - x_star);
    
        fprintf('PARTAN iter %d: ||grad|| = %.2e, f = %.4f, alpha = %.2e, beta = %.2e\n', ...
            k, grad_vals(end), f_vals(end), alpha, beta);
        
        
        % Step 2-(iv) 
        if grad_vals(end) < tau
            fprintf('Converged at iteration %d\n', k);
            converged = true;
            break;
        end
    end

    %% Step 3 (Restart) Go back to the first line of while-loop or Terminate
    if converged
        break;
    end
end

% Plotting
figure; 
semilogy(1:length(grad_vals), grad_vals, 'LineWidth', 1.5); 
title('Gradient Norm vs. Iteration (PARTAN)');
xlabel('Iteration k')
ylabel('∥∇f(x_k)∥')
grid on

figure; 
plot(1:length(f_vals), f_vals, 'LineWidth', 1.5); 
title('Objective Function Value vs. Iteration (PARTAN)');
xlabel('Iteration k')
ylabel('f(x_k)')
grid on

figure; 
semilogy(1:length(err_vals), err_vals, 'LineWidth', 1.5); 
title('Distance to Optimal Solution vs. Iteration (PARTAN)');
xlabel('Iteration k')
ylabel('∥x_k − x*∥')
grid on