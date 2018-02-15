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

%Explicit euler method
for i = 1:(n-1)
    y(:,i+1) = y(:,i) + h*f(y(:,i),t(i));
end

% Energy for the system
A = 0.01;
m = 200;
p0 =2e5;

% Energy formula

E = (p0*A/(K-1)) * y(1,:).^(-(K-1)) + m*g.*y(1,:) + 1/2 * m*y(2,:).*y(2,:);



figure
subplot(211)
plot(t,y)
legend y ydot
subplot(212)
plot(t,E)
legend Energy
