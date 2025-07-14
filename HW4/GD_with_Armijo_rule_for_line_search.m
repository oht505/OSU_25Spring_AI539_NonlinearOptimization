% ------------------ Problem setting -----------------------

% x = [x(1), x(2)]
% x(1) = x
% x(2) = y

f = @(x) x(1)^2 - 5*x(1)*x(2) + x(2)^4 - 25*x(1) - 8*x(2);

grad_f = @(x) [2*x(1) - 5*x(2) - 25;
               -5*x(1) + 4*x(2)^3 - 8];

Hessian_f = @(x) [2, -5;
                  -5, 12*x(2)^2];


% ------------------- Initialization -----------------------

eta = 2.0;
epsilon = 1e-3;
tol = 1e-6;
alpha_init = 1.0;
alpha = alpha_init;

max_iter = 600;
x_0 = [0; 0];   % x = [x, y]
x = x_0;     

f_vals = zeros(max_iter, 1);
grad_norms = zeros(max_iter, 1);


%---------GD with Armijo's rule for line search-------------

for k = 1: max_iter
    g = grad_f(x);
    d = -g;

    grad_norms(k) = norm(g);
    f_vals(k) = f(x);

    if grad_norms(k) < tol
        break;
    end


    while true

        cond1 = f(x + alpha * d) <= f(x) + epsilon * alpha * g' * d;
        cond2 = f(x + eta * alpha * d) <= f(x) + epsilon * eta * alpha * g' * d;

        if cond1 && cond2
            alpha = eta * alpha;

        elseif ~cond1
            alpha = alpha / eta;

        else
            break;

        end
    end

    x = x + alpha * d;
end


%------------------------- Hessian Check -------------------------

x_star = x;
H = Hessian_f(x_star);
eigenvalues = eig(H);

fprintf('Initial point x_0: [%.1f, %.1f]\n', x_0(1), x_0(2));
fprintf('Initial alpha value: %.2e\n', alpha_init);
fprintf('Minimum point x*: (%.4f, %.4f)\n', x_star(1), x_star(2))
fprintf('Final alpha value: %.2e\n', alpha);
fprintf('Gradient norm at solution: %.2e\n', norm(grad_f(x_star)))
fprintf('Eigenvalues of Hessian: %.4f, %.4f\n', eigenvalues)

if all(eigenvalues > 0)
    disp('The point is local minimum since Hessian is positive definite')
else
    disp('The point is not a stricy local minimum since Hessian is not positive definite')
end


%------------------------ Plot ------------------------------

figure;
semilogy(grad_norms, 'LineWidth', 1.5);
xlabel('Iteration k');
ylabel('||∇f(x_k)||');
title('Gradient Norm vs Iteration');

figure;
plot(f_vals, 'LineWidth', 1.5);
xlabel('Iteration k');
ylabel('f(x_k)');
title('Function value vs Iteration');