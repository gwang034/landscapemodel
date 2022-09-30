function [eig_val] = binaryflip_hes(x, y)

H = zeros(2,2);
H(1, 1) = 12*x^2 + 6*x - 2;
H(1, 2) = -4*y;
H(2, 1) = -4*y;
H(2, 2) = 12*y^2 - 4*x;

eig_val = eig(-H);
end