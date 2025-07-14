% -------- Problem setting ------------
Q = [1, 0.5, 0;
     0, 1, 0.25;
     0, 0.25, 1];

a = [1; -1; 2];

grad_f = @(x) Q*x + a;
f = @(x) 0.5 * x' * Q * x + a' * x;

lambda = eig(Q);
lambda_max = max(lambda);
alpha_upper = 2 / lambda_max;

fprintf("Maximum eigenvalue: %.4f\n", lambda_max);
fprintf("Safe upper bound for alpha: alpha < %.4f\n", alpha_upper);
%--------------------------------------


% --------- Initialization ------------
x = [0; 0; 0]; %initial point x_0

%alpha = 1.0;
alpha = lambda_max;
epsilon = 1e-7;
max_iter = 1000;

x_star = -Q \ a;
x_diff_norms = [];
%--------------------------------------


% --------- Gradient Descent -------------
for k = 1: max_iter
    g = grad_f(x);
    x_diff_norms(end+1) = norm(x - x_star);

    if norm(g) < epsilon
        break;
    end

    x = x - alpha * g;
end
%------------------------------------------


% ----------- Plot & Print ---------------
figure;
semilogy(0:k-1, x_diff_norms, '-o', 'LineWidth', 1.5);
xlabel('Iteration k'); 
ylabel('||x_k - x^*||');
title('Convergence to Global Minimizer');
grid on;

fprintf('Converged at iteration %d\n', k-1);
fprintf('Current alpha: %.4f\n', alpha);
fprintf('x* = [%f, %f, %f]\n', x(1), x(2), x(3));
fprintf('Final error ||x_k - x^*|| = %.2e\n', x_diff_norms(end));
