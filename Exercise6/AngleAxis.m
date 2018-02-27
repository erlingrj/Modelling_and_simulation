% TTK4130 Exercise 6 task 3 d %

%% Implement an algorithm to find the angle axis
%% Representation from the Rotation Matrix R


R = [0.2133 -0.2915 0.9325;
    0.9209 -0.2588 -0.2915;
    0.3263 0.9209 0.2133];

% Finding the angle theta with
% cos(theta) = (r11+r22+r33-1)/2
theta = acos((sum(diag(R))-1)/2);

% Find Euler Rotation Vector e
e = 1/2 * [R(3,2)-R(2,3);R(1,3)-R(3,1);R(2,1)-R(1,2)];

% Calculate k

k = e/sin(theta);

disp(k)
