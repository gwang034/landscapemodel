% Steps:
% Find critical points
% Find saddles within critical points by computing the eigenvalues of
% Hessian matrix and checking signs (new script to do all of this)
% Plot critical points with color coding (saddles diff color/marker)
% For saddles, evaluate F at point to find level curves
% Plot level curves around saddles

%% Set Parameter Values
close all

paramaux = [0, 1]; %parameter value
xmintraj = -5;
xmaxtraj = 5;
ymintraj = -5;
ymaxtraj = 5;

%% Find & Plot Critical Points
allattractors = equilibriumbinarychoice(paramaux(1), paramaux(2));
figure()
plot(allattractors(:, 1), allattractors(:, 2), '.', 'Markersize', 20);
title("All Attractors")

%% Evaluate Hessian Matrix at each CP & Determine CP Type

for i = 1:length(allattractors)
    x = allattractors(i, 1);
    y = allattractors(i, 2);
    [eig_val] = hessian(x, y);
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

colors = [".r", ".g", ".b"];

figure()
for i = 1:length(allattractors)
    plot(allattractors(i, 1), allattractors(i, 2), colors(allattractors(i, 3)), 'Markersize', 20)
    hold on
end
title("All Attractors Color Coded")

%% Level Curves for Saddle Points

saddles = allattractors(allattractors(:, 3)==3, 1:2)'; % store saddle points

U=@(x,y,param) x.^4+y.^4+y.^3-4.*(x.^2).*y+y.^2-paramaux(1).*x+paramaux(2).*y; %landscape at that parameter value

x1=linspace(xmintraj,xmaxtraj,100); %setting the limits of x
y1=linspace(ymintraj,ymaxtraj,100);%setting the limits of y
[X,Y] = meshgrid(x1,y1);

%[mins,sad,Max]=VTD_Lan_Mod_v1_CriticalPointsClas_Compile(param);
Z= U(X,Y,paramaux);

figure()
for j=1:size(saddles,2)
    contour(X,Y,Z,[U(saddles(1,j), saddles(2,j),paramaux), U(saddles(1,j), saddles(2,j),paramaux)],'b', 'LineWidth',2);
    hold on
    scatter(saddles(1,j),saddles(2,j),70,'m', 'filled');
end
title("Saddle Point Level Curves")