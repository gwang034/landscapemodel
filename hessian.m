function [eig_val] = hessian(x, y)
% computes the eigenvalues of the hessian matrix given the 
% coordinates of a critical point
% Inputs:
%   x - the x-coordinate of the critical point
%   y - the y-coordinate of the critical point
% Outputs:
%   H - the hessian matrix

H = zeros(2,2);
H(1,1) = 12*x^2 - 8*y;
H(1,2) = -8*x;
H(2,1) = -8*x;
H(2,2) = 12*y^2 + 6*y + 2;

eig_val = eig(-H);

end