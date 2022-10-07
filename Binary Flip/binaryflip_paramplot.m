function binaryflip_paramplot(xmintraj, xmaxtraj)
% plots parameter values given range of y values
% inputs:
%   xmintraj - the minimum x value of the trajectory
%   xmaxtraj - the maximum x value of the trajectory

% values of x that make the determinant of the Hessian equal 0 given y
y_fun = @(x) sqrt((-x+3*x^2+6*x^3)/(-5+9*x+18*x^2));

figure()

for x=xmintraj:0.001:xmaxtraj
    y = [y_fun(x) -y_fun(x)]; % x values
    if real(y) == 0
        continue
    end
    p1 = 2*x - 3*x^2 - 4*x^3 + 2.*y.^2; % parameter 1 value
    % p1 = real(p1); % only plot real value
    p2 = 4*x.*y - 4.*y.^3; % parameter 2 value
    % p2 = real(p2); % only plot real value
    plot(p1, p2, 'b.', 'Markersize', 20)
    hold on
    
end
xlim([-3, 1])
ylim([-2, 2])
xlabel('p1')
ylabel('p2')
title(['Parameters for x = ', num2str(xmintraj), ':', num2str(xmaxtraj)])
    



end