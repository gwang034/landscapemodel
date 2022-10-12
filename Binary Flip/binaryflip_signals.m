function binaryflip_signals(xmintraj, xmaxtraj, q, M)
% plots parameter values given range of y values
% inputs:
%   xmintraj - the minimum x value of the trajectory
%   xmaxtraj - the maximum x value of the trajectory
%   q - a linear transformation in the process of changing signaling
%   expression to parameter expression
%   M - a linear transformation in the process of changing signaling
%   expression to parameter expression

y_fun = @(x) sqrt((-x+3*x^2+6*x^3)/(-5+9*x+18*x^2));

i = 1;
for x=xmintraj:0.001:xmaxtraj
    y = [y_fun(x) -y_fun(x)]; % x values
    if real(y) == 0
        continue
    end
    p1(i:i+1) = 2*x - 3*x^2 - 4*x^3 + 2.*y.^2; % parameter 1 value
    % p1 = real(p1); % only plot real value
    p2(i:i+1) = 4*x.*y - 4.*y.^3; % parameter 2 value
    % p2 = real(p2); % only plot real value
    i = i + 2;
end

param = [p1; p2];

for i = 1:length(param)
    sig_mol(:, i) = M \ (param(:, i) - q);
end

figure()
plot(sig_mol(1,:), sig_mol(2,:), '.')
hold on
xlim([-5 5]);
ylim([-5 5]);
title('Signaling Molecules')
xlabel('SMAD4')
ylabel('beta-cat')

end