% Solve the first order necessary condition 
%   to identify a local minimum point x*
%   (for the two cases: μ = 1 and μ = 1000)

% min_x f(x)=0.5*x^T*Q*x-b^T*x+0.5*mu*(c^T*c)^2.

clearvars;
close all;
clc;

%% Load data
load('HW6_data.mat');  

%% Test Two Cases  μ = 1 and μ = 1000
% Case 1: μ = 1 
mu1 = 1;
x_star_mu1 = find_x_star(Q, b, c, mu1);
norm_grad_1 = norm(Q*x_star_mu1-b + mu1*(c'*x_star_mu1)*c);

% Case 2: μ = 1000 
mu2 = 1000;
x_star_mu2 = find_x_star(Q, b, c, mu2);
norm_grad_2 = norm(Q*x_star_mu2-b + mu2*(c'*x_star_mu2)*c);

% Print the results
fprintf('For μ = 1, norm of x*: %.4f\n', norm(x_star_mu1));
fprintf('For μ = 1000, norm of x*: %.4f\n', norm(x_star_mu2));
fprintf('Norm of gradient for μ=1: %.4e\n', norm_grad_1);
fprintf('Norm of gradient for μ=1000: %.4e\n', norm_grad_2);