%%Problem 2a implement Explicit Euler method in matlab

clc
clear all

% Constants
g = 9.81;
K = 1.40;
h = 0.01;
t0 = 0;
t1 = 10;
n = (t1-t0)/h;

% State space model
f = @(y,t) [y(2); -g*(1-(1/y(1))^K)];

% Stuff
t = [t0:h:t1];
y = zeros(2,n+1);

disp(length(t))
disp(length(y))

%Initial conditions

y(:,1) = [2;0];

for i = 1:(n-1)
    y(:,i+1) = y(:,i) + h*f(y(:,i),t(i));
end

plot(t,y)
legend y ydot
