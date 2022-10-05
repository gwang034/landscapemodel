function binarychoice_paramplot(ymintraj, ymaxtraj)
% plots parameter values given range of y values
% inputs:
%   ymintraj - the minimum y value of the trajectory
%   ymaxtraj - the maximum y value of the trajectory

% values of x that make the determinant of the Hessian equal 0 given y
x_fun = @(y) (sqrt(2)*sqrt(y+3*y^2+6*y^3)) / sqrt(-5 + 9*y + 18*y^2);

figure()
for y=ymintraj:ymaxtraj
    x = [x_fun(y) -x_fun(y)]; % x values
    p1 = 4.*x.^3 - 8.*x.*y; % parameter 1 value
    p1 = real(p1); % only plot real value
    p2 = -4*y^3-3*y^2+4.*x.^2-2*y; % parameter 2 value
    p2 = real(p2); % only plot real value
    plot(p1, p2, '.', 'Markersize', 20)
    hold on
    
end
title(['Parameters for y = ', num2str(ymintraj), ':', num2str(ymaxtraj)])
    





end