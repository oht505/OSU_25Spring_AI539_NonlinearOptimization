function H = obj_Hessian(Q, c, mu)
    
    H = Q + mu*(c'*c);
end