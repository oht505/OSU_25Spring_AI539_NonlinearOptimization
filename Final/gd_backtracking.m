function x = gd_backtracking(Q, b, c, x0)
    max_iter = 500;
    tol = 1e-6;
    x = x0;

    for iter = 1:max_iter
        [~, gradP] = penalty_value(x);
        grad_q = Q * x + b + c * gradP;

        if norm(grad_q) < tol
            break;
        end

        % Backtracking Line Search
        alpha = 1.0;
        eta = 2;
        epsilon = 10^(-6);

        q_curr = 0.5 * x' * Q * x + b' * x + c * penalty_value(x);
        while true
            x_t = x - alpha * grad_q;
            q_t = 0.5 * x_t' * Q * x_t + b' * x_t + c * penalty_value(x_t);
            if q_t <= q_curr - epsilon * alpha * (grad_q' * grad_q)
                break;
            end
            alpha = alpha / eta;
        end

        x = x - alpha * grad_q;
    end
end
    

