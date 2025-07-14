% Implementation of a modification of Newton's method to solve
% min_x, y f(x,y) = x^2 - 5xy + y^4 - 25x - 8y


itr = 1;
x = [0; 0;]; % initial point
n = size(x); % dimension of the variable vector

grad_x = norm(obj_grad(x),2); % grad_x will save Euclidean norm of gradients
f_x = obj(x); % f_x will save objective function values
tau = 10^(-6);

delta = 10^(-1);

while (norm(obj_grad(x(:,itr)),2) > tau) % Stopping criterion: Euclidean norm of gradient <= tau
    
    
    
    x_itr = x(:,itr);
    H = obj_Hessian(x_itr);
    
    eig_H = eig(H); % A vector consisting of eigenvalues of the Hessian an x_itr
    
    min_eig = min(eig_H);
    
    if (min_eig < delta) % If the minimum eigenvalue of Hessian is lower than delta, we add a scaled identity matrix to the Hessian to make its minimum eigenvalue equal to delta.
        H = H + (delta - min_eig)*eye(2); 
    end
    
    g = obj_grad(x_itr)'; % gradient at x_itr (column vector version)
    d = -inv(H)*g;
    
        % Armijo's rule below
    alpha = 1;
    eta = 1.2;
    epsilon = 0.4;
    pass = 0;
    
    while pass==0
        
        
        if (obj(x_itr + alpha*d) > (obj(x_itr) + epsilon*alpha*g'*d))
            alpha = alpha/eta;
        else 
            pass = 1;
        end
        
    end
    
    x_new = x_itr + alpha*d; % Obtain a new point based on the stepsize obtained by the backtracking algorithm
    x = [x x_new];
    grad_x = [grad_x norm(obj_grad(x_new),2)];
    f_x = [f_x obj(x_new)];
    
    itr = itr + 1;
    
    
end

% check the first order condition: the below should be near zero.

grad_final = norm(obj_grad(x(:,itr)),2);

% check the second order condition: the eigenvalues of Hessian (below)
% should be all nonnegative. (If they are all positive, the sufficient
% condition holds.)
Hessian_eig = eig(obj_Hessian(x(:,itr)));

figure();

semilogy([1:1:itr], grad_x)
title('Euclidean norm of gradient versus iteration index')
xlabel('Iteration index')
ylabel('Euclidean norm of gradient')
grid on


figure();

plot([1:1:itr], f_x)
title('Objective function value versus iteration index')
xlabel('Iteration index')
ylabel('Objective function value')
grid on


x_opt = [20; 3]; % Numerically, you can find that this would be the local minimum point to which the algorithm converges to.

% x_err will save the distance from x_k to x^* at each iteration, in
% Euclidean norm

x_err = [];

for k=1:itr
    
    x_err = [x_err; norm(x(:,k)-x_opt,2)];
    
end

figure();

semilogy([1:1:itr], x_err)
title('Euclidean distance to the relative minimum point versus iteration index')
xlabel('Iteration index')
ylabel('Distance to the optimal solution')
grid on