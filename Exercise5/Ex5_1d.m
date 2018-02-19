% Solving Lotka-Volterra predator-prey model with Matlab

% Implicit Euler and fsolve.

%Parameters
t0 = 0;
t1 = 20;
h = 0.01;
n = (t1 - t0)/h;
t = t0:h:t1;

%The model
f = @(y,t)([y(1)*(y(2)-3); y(2) * (2 - y(1))]);

% Initial conditions
y0 = [1;4];

% Allocate vectors for solution

y_EE = zeros(2,n+1);
y_IE = zeros(2,n+1);
y_IME = zeros(2,n+1);

y_EE(:,1) = y0;
y_IE(:,1) = y0;
y_IME(:,1) = y0;


% Explicit Euler:

for i = 1:n
    y_EE(:,i+1) = y_EE(:,i) + h*f(y_EE(:,i));
end

% Implicit Euler

for i = 1:n
    r = @(y_next)(y_IE(:,i) + h*feval(f,y_next,t(i+1)) - y_next);
    y_IE(:,i+1) = fsolve(r,y_IE(:,i),opt);
end

% Implicit midpoint rule

for i = 1:n
    r = @(y_next)(y_IME(:,i) + h*feval(f,(y_IME(:,i) + y_next)/2,t(i)+h/2))-y_next;
    y_IME(:,i+1) = fsolve(r,y_IME(:,i),opt);
end


figure
subplot(311)
plot(t,y_EE)
subplot(312)
plot(t,y_IE)
subplot(313)
plot(t,y_IME)
