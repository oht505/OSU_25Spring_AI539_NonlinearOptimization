function f = obj(x, Q, b, c, mu)
    
    f = 0.5*(x'*Q*x) - b'*x + 0.5*mu*(c'*x)^2;
end