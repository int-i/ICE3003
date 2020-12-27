% Prob. 3.20

xlabel('i')
ylabel('j')
zlabel('k')

a = [6 4 2]; b = [2 6 4];
[t, c, s] = solve(a, b);
plot_vec(a, b, c)
pause(3)

a = [3 2 -6]; b = [4 -3 1];
[t, c, s] = solve(a, b);
plot_vec(a, b, c)
pause(3)

a = [2 -2 1]; b = [4 2 -4];
[t, c, s] = solve(a, b);
plot_vec(a, b, c)
pause(3)

a = [-1 0 0]; b = [0 -1 0];
[t, c, s] = solve(a, b);
plot_vec(a, b, c)

function [theta, c, c_size] = solve(a, b)
% Returns θ, {c}, magnitude of {c}

% a * b = |a| |b| cos(theta)
theta = acos(a .* b) / (norm(a) * norm(b));

% Cross product of {a} and {b}
c = cross(a, b);

% Magnitude of {c}
c_size = norm(c);
end

function plot_vec(a, b, c)
plot3([0 a(1)],[0 a(2)],[0 a(3)],'--', [0 b(1)],[0 b(2)],[0 b(3)],'--', [0 c(1)],[0 c(2)],[0 c(3)],'-')
end
