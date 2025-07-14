
g = 1;
b = -5;
x_true = [1.05; 0.98; 0.1];

% Power flow memasurement functions
h_1 = @(x) g * (x(1) * x(2) * cos(x(3)) - x(1)^2) - b * x(1) * x(2) * sin(x(3));
h_2 = @(x) -b * (x(1) * x(2) * cos(x(3)) - x(1)^2) - g * x(1) * x(2) * sin(x(3));
h_3 = @(x) g * (x(2) * x(1) * cos(x(3)) - x(2)^2) + b * x(2) * x(1) * sin(x(3));
h_4 = @(x) -b * (x(2) * x(1) * cos(x(3)) - x(2)^2) + g * x(2) * x(1) * sin(x(3));

% Generate the measurements (P_12, Q_12, P_21, Q_21) for true state
a = [h_1(x_true); h_2(x_true); h_3(x_true); h_4(x_true)];
fprintf("a = [%.2f, %.2f, %.2f, %.2f]\n", a(1), a(2), a(3), a(4));

% f(V_1, V_2, theta_2)
f = @(x) sum(([h_1(x); h_2(x); h_3(x); h_4(x)] - a).^2);

% Gradient of the function f
% [x, y] = [(P_12, Q_12, P_21, Q_21), (V_1, V_2, theta_2)]
grad_f = @(x, y) [ -2*( (x(1) - h_1(y)) * (y(2)*cos(y(3)) - 2*y(1) + 5 * y(2) * sin(y(3))) ...
    + (x(2) - h_2(y)) * ( 5*y(2)*cos(y(3)) - 10 * y(1) - y(2) * sin(y(3)) ) ...
    + (x(3) - h_3(y)) * ( y(2) * cos(y(3)) - 5 * y(2) * sin(y(3)) ) ...
    + (x(4) - h_4(y)) * ( 5 * y(2) * cos(y(3)) + y(2) * sin(y(3)) ) ); 
    -2*( (x(1) - h_1(y)) * (y(1) * cos(y(3)) + 5 * y(1) * sin(y(3))) ...
    + (x(2) - h_2(y)) * (5 * y(1) * cos(y(3)) - y(1) * sin(y(3))) ...
    + (x(3) - h_3(y)) * (y(1) * cos(y(3)) - 2* y(2) - 5 * y(1) * sin(y(3))) ...
    + (x(4) - h_4(y)) * (5 * y(1) * cos(y(3)) - 10 * y(2) + y(1) * sin(y(3)))) ; 
    -2*( (x(1) - h_1(y)) * (-y(1)*y(2)*sin(y(3)) + 5*y(1)*y(2)*cos(y(3))) ...
    + (x(2) - h_2(y)) * (-5*y(1)*y(2)*sin(y(3)) -1*y(1)*y(2)*cos(y(3))) ...
    + (x(3) - h_3(y)) * (-y(2)*y(1)*sin(y(3)) - 5*y(2)*y(1)*cos(y(3))) ...
    + (x(4) - h_4(y)) * (-5*y(2)*y(1)*sin(y(3)) + y(2)*y(1)*cos(y(3)))) ]; 

% Hessian 
function H = numerical_hessian(f, x)
    n = length(x);
    h = 1e-5;
    H = zeros(n);

    for i = 1:n
        for j = 1:n
            x1 = x; x1(i) = x1(i) + h; x1(j) = x1(j) + h;
            x2 = x; x2(i) = x2(i) + h; x2(j) = x2(j) - h;
            x3 = x; x3(i) = x3(i) - h; x3(j) = x3(j) + h;
            x4 = x; x4(i) = x4(i) - h; x4(j) = x4(j) - h;
            H(i,j) = (f(x1) - f(x2) - f(x3) + f(x4)) / (4*h^2);
        end
    end
end

% Parameter Initialization
x_0 = [1.0; 1.0; 0];
x_k = x_0;
tol = 1e-4;
epsilon = 1e-6;
max_iter = 1000;
alpha_init = 1.0;
eta = 2.0;

grad_norms = [];
estim_errors = [];


% GD with Backtracking line search
for k = 1: max_iter
    g_k = grad_f(a, x_k);
    d = -g_k;
    grad_norms(end+1) = norm(g_k);
    estim_errors(end+1) = norm(x_k-x_true)^2;

    if norm(g_k) < tol
        break;
    end

    % Backtracking
    alpha = alpha_init;
    while f(x_k + alpha * d) > f(x_k) + epsilon * alpha * g_k' * d
        alpha = alpha / eta;
    end

    x_k = x_k + alpha * d;
end

% Results
x_star = x_k;
H = numerical_hessian(f, x_star);
eigenvalues = eig(H);

fprintf('Initial point x_0: [%.1f, %.1f, %.1f]\n', x_0(1), x_0(2), x_0(3));
fprintf('Initial alpha value: %.2f\n', alpha_init);
fprintf('Minimum point x*: (%.4f, %.4f, %.4f)\n', x_star(1), x_star(2), x_star(3));
fprintf('Final alpha value: %.2f\n', alpha);
fprintf('Eigenvalues of Hessian: %.4f, %.4f, %.4f\n', eigenvalues);

if all(eigenvalues > 0)
    disp('x* is a local minimum since Hessian is positive definite')
else
    disp('x* is not a stricy local minimum since Hessian is not positive definite')
end

% Plot - Gradient norms
figure;
semilogy(1:length(grad_norms), grad_norms, 'LineWidth', 2);
xlabel('Iteration k'); ylabel('||∇f(x_k)||'); grid on;
title('Gradient Norm vs Iteration');

% Plot - Estimation errors
figure;
semilogy(1:length(estim_errors), estim_errors, 'LineWidth', 2);
xlabel('Iteration k'); ylabel('||x_k - x_{true}||^2'); grid on;
title('Estimation Error vs Iteration');
