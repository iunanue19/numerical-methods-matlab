function [vx, vy] = rk4_system(f, a, b, n, ya)
% Calculate the solution of systems of differential equations from Runge-Kutta (Order Four) method
% Inputs:
%         f: Array of functions f(x)
%         a: Initial point
%         b: End point
%         n: Number of intervals
%        ya: Array of initial values
% Outputs:
%       vx: Array containing x values
%       vy: Array containing y values (solution of IVP)

    m = size(f, 1);
    x = 0;
    y = zeros(m, 1);

    k1 = zeros(m, 1);
    k2 = zeros(m, 1);
    k3 = zeros(m, 1);
    k4 = zeros(m, 1);

    vx = zeros(1, n + 1);
    vy = zeros(m, n + 1);

    h = (b - a) / n;
    x = a;
    y = ya;

    vx(1) = x;
    vy(:, 1) = y;

    for i = 1:n

        for j = 1:m
            k1(j) = h * f{j}(x, y);
        end

        for j = 1:m
            k2(j) = h * f{j}(x + h / 2, y + k1 / 2);
        end

        for j = 1:m
            k3(j) = h * f{j}(x + h / 2, y + k2 / 2);
        end

        for j = 1:m
            k4(j) = h * f{j}(x + h, y + k3);
        end

        x = a + i * h;
        y = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6;

        vx(i + 1) = x;
        vy(:, i + 1) = y;
    end
end
