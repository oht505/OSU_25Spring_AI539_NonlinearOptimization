function x_star = find_x_star(Q, b, c, mu)

    A = Q + mu*(c*c');
    x_star = A \ b;
end