function binarychoice_attractors(paramaux)
% function that classifies an attractor as a cell type given a set of
% parameters
% inputs:
%   paramaux - the parameter values

options=odeset('RelTol', 1e-6); % sets error tolerance
F1_deriv = @(t, sols) [-(4*sols(1)^3-8*sols(1)*sols(2)-paramaux(1));
    -(4*sols(2)^3+3*sols(2)^2-4*sols(1)^2+2*sols(2)+paramaux(2))];
tspan=[0 1000];
init=[1; 1];
[t,sols]=ode45(F1_deriv,tspan,init,options);

attractor = sols(length(t), :)

if attractor(1) > 0 & attractor(2) > 0
    disp('Mesoderm')
    elseif attractor(1) < 0 & attractor(2) > 0
        disp('Extraembryonic')
    else
        disp('Pluripotent')
end

end