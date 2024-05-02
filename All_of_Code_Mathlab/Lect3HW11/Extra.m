function [L1, L2, et] = Extra(x, xx, yint,x_test)
% calculateExtras: Calculate L1, L2, and et
% [L1, L2, et] = calculateExtras(x, y, xx, yint): Calculates L1, L2, and et
% based on the Lagrange interpolating polynomial.
% input:
% x = independent variable
% y = dependent variable
% xx = value of independent variable at which the interpolation is calculated
% yint = interpolated value of dependent variable
% output:
% L1, L2 = constants in the interpolation
% et = percent relative error

% Calculate L1 and L2 based on the number of data points
n = length(x);
if n == 2
    L1 = (xx - x(2)) / (x(1) - x(2));
    L2 = (xx - x(1)) / (x(2) - x(1));
elseif n == 3
    L1 = ((xx - x(2)) .* (xx - x(3))) / ((x(1) - x(2)) .* (x(1) - x(3)));
    L2 = ((xx - x(1)) .* (xx - x(3))) / ((x(2) - x(1)) .* (x(2) - x(3)));
else
    L1 = ((xx - x(2)) .* (xx - x(3)) .* (xx - x(4))) / ((x(1) - x(2)) .* (x(1) - x(3)) .* (x(1) - x(4)));
    L2 = ((xx - x(1)) .* (xx - x(3)) .* (xx - x(4))) / ((x(2) - x(1)) .* (x(2) - x(3)) .* (x(2) - x(4)));
end

% Calculate f(2.5) for percent relative error
f25 = x_test^5 - 16 * x_test^4 + 99 * x_test^3 - 296 * x_test^2 + 428 * 2.5 - 240;
et = abs((f25 - yint) / f25) * 100;

% Display L1, L2, and et
fprintf('L1 = %.4f\n', L1);
fprintf('L2 = %.4f\n', L2);
fprintf('et = %.4f\n', et);

end