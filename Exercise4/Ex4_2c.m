% The implicit midpoint rule (Gauss order 2)

%Parameters
t0 = 0;
t1 = 10;
h = 0.01;
n = (t1-t0)/h;
K = 1.40;
g = 9.81;
t = t0:h:t1;

%Initial condition
y0 = [2 0]';
y = zeros(2,n);
y(:,1) = y0;

% Our model on state space form
f = @(y,t) [y(2); -g*(1-(1/y(1))^K)];

% Settings for fsolve
opt = optimset('Display','off','TolFun',1e-8);

for i = 1:n
    r = @(y_next) (y(:,i) + h*feval(f, (y_next+y(:,i))/2, t(i)+h/2) - y_next);
    y(:,i+1) = fsolve(r,y(:,i),opt);
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
