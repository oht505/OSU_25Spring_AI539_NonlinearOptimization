% Problem setting
Q = [1, 0.5, 0; 
    0.5, 1, 0.25; 
    0, 0.25, 1];

b = [-1; 1; 2];

grad_f = @(x) Q*x - b;

x_star = Q \ b;


% Parameter Initialization
x = zeros(3,1);
max_iter = 40;
epsilon = 1e-6;

grad_norms = [];
E_vals = [];


% Gauss-Southwell algorithm
for k = 1:max_iter
    g = grad_f(x);

    grad_norms(end+1) = norm(g);

    E = 0.5 * (x - x_star)' * Q * (x - x_star);
    E_vals(end+1) = E;

    if norm(g) < epsilon
        break;
    end

    [~, i_k] = max(abs(g));

    e_i = zeros(3,1);
    e_i(i_k) = 1;

    denominator = (e_i' * Q * e_i);
    numerator = (e_i' * Q * x - b' * e_i);
    alpha_k = -(numerator/denominator); 
    
    x = x + alpha_k * e_i;

end


% Eigen values
eigenvalues = eig(Q);
a = eigenvalues(1);
A = eigenvalues(3);
fprintf("Eigen values: [%.3f, %.3f, %.3f] \n", eigenvalues);


% Decreasing ratio
fprintf("Decreasing ratio: %.3f\n", 1-(a/(3*A)));


% Plot - grad_norm
figure;
semilogy(0:k-1, grad_norms, 'b-o', 'LineWidth', 1.5);
xlabel('Iteration k');
ylabel('||g(x_k)||');
title('Gradient Norm vs. Iteration (log-scale)');
grid on;

% Plot - E_values
figure;
semilogy(0:k-1, E_vals, 'r-s', 'LineWidth', 1.5);
xlabel('Iteration k');
ylabel('E(x_k)');
title('E vs. Iteration (log-scale)');
grid on;