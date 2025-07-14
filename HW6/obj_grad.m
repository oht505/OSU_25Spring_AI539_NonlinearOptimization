function f_grad = obj_grad(x, Q, b, c, mu)
    
    f_grad = Q*x - b + mu*(c'*x)*c;
end
