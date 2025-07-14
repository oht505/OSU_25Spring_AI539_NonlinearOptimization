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
bt_epsilon = 1e-3;     
delta = 1e-4;
alpha_init = 1.0;

max_iter = 500;
tol = 1e-6;
x_0 = [4; 8];   % x = [x, y]
x = x_0;     

f_vals = zeros(max_iter, 1);
grad_norms = zeros(max_iter, 1);

%--------------- Modified Newton's method ----------------

for k = 1: max_iter
    g = grad_f(x);
    H = Hessian_f(x);

    % Ensuring a descent direction
    lambda_min = min(eig(H));
    if lambda_min < delta
        epsilon_k = delta - lambda_min;
    else
        epsilon_k = 0;
    end

    H_mod = epsilon_k * eye(2) + H;

    d = -H_mod \ g;
    
    % Backtracking line search
    alpha = alpha_init;
    while true
        if f(x + alpha * d) <= (f(x) + bt_epsilon * alpha * g' * d)
            break;
        else
            alpha = alpha / eta;
        end
    end
    
    % Update
    x = x + alpha * d;

    % Log history
    f_vals(k) = f(x);
    grad_norms(k) = norm(g);
    
    % Stop condition
    if norm(g) < tol
        break;
    end
end    

%------------------------- Hessian Check --------------------------

x_star = x;
g_star = grad_f(x_star);
H_star = Hessian_f(x_star);
eigenvalues = eig(H);

fprintf('Initial point x_0: [%.1f, %.1f]\n', x_0(1), x_0(2));
fprintf('Initial alpha value: %.2f\n', alpha_init);
fprintf('Minimum point x*: (%.4f, %.4f)\n', x_star(1), x_star(2))
fprintf('Final alpha value: %.2f\n', alpha);
fprintf('Gradient norm at solution: %.2e\n', norm(g_star))
fprintf('Eigenvalues of Hessian: %.4f, %.4f\n', eigenvalues)

if all(eigenvalues > 0) && norm(g_star) < tol
    disp('x* is a strict local minimum (gradient zero && Hessian positive definite)');
elseif all(eigenvalues >= 0) && norm(g_star) < tol 
    disp('x* is a local minimum (possibly not strict)');
elseif any(eigenvalues < 0)
    disp('x* is NOT a local minimum (Hessian not positive semidefinite)');
else
    disp('Indeterminate case');
end

%------------------------ Plot ------------------------------

f_vals = f_vals(1:k);
grad_norms = grad_norms(1:k);

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