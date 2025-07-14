function [P, gradP] = penalty_value(x)
    h = sum(x.^2) - 1;
    grad_h = 2*x;

    g = -x;
    grad_g = zeros(size(x));
    for i = 1:4
        if g(i) > 0
            grad_g(i) = -g(i);
        end
    end

    P = 0.5 * h^2 + 0.5 * sum((g(g > 0)).^2);
    gradP = h * grad_h + grad_g;
end
