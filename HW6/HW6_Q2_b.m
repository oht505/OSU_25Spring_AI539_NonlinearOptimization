% Implement of Gradient Descent with Backtracking Line 
% Search to find a local minimum point
% min_x f(x) = 0.5x^TQx - b^Tx + 0.5μ(c^Tx)^2

clearvars;
close all;
clc;

%% Load data
load('HW6_data.mat');

%mu = 1;
mu = 1000;

%% Gradient Descent with Backtracking Line Search

% Initalization
grad_x = [];
f_x = [];
x_vals = [];
x_errors = [];
x_k = zeros(size(b,1), 1);
tau = 1.3e-5;

% Save initial value
grad_x(1) = norm(obj_grad(x_k, Q, b, c, mu));
f_x(1) = obj(x_k, Q, b, c, mu);
x_vals(:, 1) = x_k;
x_star = find_x_star(Q, b, c, mu);
x_errors(1) = norm(x_k-x_star);

k = 1;
while (norm(obj_grad(x_k, Q, b, c, mu), 2) > tau)

    g = obj_grad(x_k, Q, b, c, mu);
    d = -g;


    % Backtracking algorithm below
    % The code below will search for a step size using the backtracking
    % algorithm.

    % Initial stepsize and the parameters of the Backtracking algorithm
    alpha = 1;
    eta = 2;
    epsilon = 0.4;

    % Below, we keep decreasing the stepsize until the satisfactory descent
    % criterion is satisfied.

    pass = 0;
    while (pass == 0)
        if obj(x_k + alpha * d, Q, b, c, mu) > (obj(x_k, Q, b, c, mu) + epsilon * alpha * g' * d)
            
            alpha = alpha / eta;
        else
            pass = 1;
        end
    end

    % Update x_k
    x_k = x_k + alpha * d;
    g = obj_grad(x_k, Q, b, c, mu);

    % Record info
    grad_x(end+1) = norm(g);
    f_x(end+1) = obj(x_k, Q, b, c, mu);
    x_vals(:, end+1) = x_k;
    x_errors(end+1) = norm(x_k - x_star);

    fprintf('Iteration %d: ||grad|| = %.2e, f = %.4f, alpha = %.2e\n', ...
            k, grad_x(end), f_x(end), alpha);

    k = k + 1;
end

% Plotting
figure; 
semilogy(1:k, grad_x, 'LineWidth', 1.5); 
title('Gradient Norm vs. Iteration k');
xlabel('Iteration k')
ylabel('∥∇f(x_k)∥')
grid on

figure; 
plot(1:k, f_x, 'LineWidth', 1.5); 
title('Objective Function Value vs. Iteration k');
xlabel('Iteration k')
ylabel('f(x_k)')
grid on

figure; 
semilogy(1:k, x_errors, 'LineWidth', 1.5); 
title('Distance to Optimal Solution vs. Iteration k');
xlabel('Iteration k')
ylabel('∥x_k − x*∥')
grid on