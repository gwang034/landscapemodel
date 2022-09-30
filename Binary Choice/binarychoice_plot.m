function binarychoice_plot(paramaux, xmintraj, xmaxtraj, ymintraj, ymaxtraj)
% given a set of parameters, plot the binary choice model

% inputs: 
%   paramaux - a vector of length 2 describing the parameters that
%              are functions of signals
%   xmintraj - the minimum x-value of the trajectory
%   xmaxtraj - the maximum x-value of the trajectory
%   ymintraj - the minimum y-value of the trajectory
%   ymaxtraj - the maximum y-value of the trajectory


% Steps:
% Find critical points
% Find saddles within critical points by computing the eigenvalues of
% Hessian matrix and checking signs (new script to do all of this)
% Plot critical points with color coding (saddles diff color/marker)
% For saddles, evaluate F at point to find level curves
% Plot level curves around saddles

%% Find Critical Points
allattractors = binarychoice_eq(paramaux(1), paramaux(2));

% % Uncomment to plot all critical points
% figure()
% plot(allattractors(:, 1), allattractors(:, 2), '.', 'Markersize', 20);
% title("All Attractors")

%% Evaluate Hessian Matrix at each CP & Determine CP Type

for i = 1:size(allattractors, 1)
    x = allattractors(i, 1);
    y = allattractors(i, 2);
    [eig_val] = binarychoice_hes(x, y);
    if eig_val(1) * eig_val(2) > 0
        if eig_val(1) < 0 % minimum
            allattractors(i, 3) = 1; % minimum
        else % maximum
            allattractors(i, 3) = 2; % maximum
        end
    else % saddle
        allattractors(i, 3) = 3; % saddle
    end
end


%% Level Curves for Saddle Points

saddles = allattractors(allattractors(:, 3)==3, 1:2)'; % store saddle points

U=@(x,y,param) x.^4+y.^4+y.^3-4.*(x.^2).*y+y.^2-paramaux(1).*x+paramaux(2).*y; %landscape at that parameter value

x1=linspace(xmintraj,xmaxtraj,100); % setting the limits of x
y1=linspace(ymintraj,ymaxtraj,100);% setting the limits of y
[X,Y] = meshgrid(x1,y1);

% [mins,sad,Max]=VTD_Lan_Mod_v1_CriticalPointsClas_Compile(param);
Z= U(X,Y,paramaux);

% final plot
figure()
for j=1:size(saddles,2)
    % plot level curves
    contour(X,Y,Z,[U(saddles(1,j), saddles(2,j),paramaux), U(saddles(1,j), saddles(2,j),paramaux)],'k', 'LineWidth',2);
    hold on
end

colors = [".r", ".g", ".b"]; % min <- red, max <- green, saddle <- blue

% plot color-coded critical points
for i = 1:size(allattractors, 1)
    plot(allattractors(i, 1), allattractors(i, 2), colors(allattractors(i, 3)), 'Markersize', 20)
    hold on
end
title("Saddle Point Level Curves")

end