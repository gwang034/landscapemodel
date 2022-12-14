function binarychoice_signals(ymintraj, ymaxtraj, q, M)
% plots parameter values given range of y values
% inputs:
%   ymintraj - the minimum y value of the trajectory
%   ymaxtraj - the maximum y value of the trajectory
%   q - a linear transformation in the process of changing signaling
%   expression to parameter expression
%   M - a linear transformation in the process of changing signaling
%   expression to parameter expression

x_fun = @(y) (sqrt(2)*sqrt(y+3*y^2+6*y^3)) / sqrt(-5 + 9*y + 18*y^2);

i = 1;
for y=ymintraj:0.001:ymaxtraj
    x = [x_fun(y) -x_fun(y)]; % x values
    if real(x) == 0
        continue
    end
    p1(i:i+1) = 4.*x.^3 - 8.*x.*y; % parameter 1 value
    % p1 = real(p1); % only plot real value
    p2(i:i+1) = -4*y^3-3*y^2+4.*x.^2-2*y; % parameter 2 value
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