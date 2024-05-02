function yy = quspline(x,y,xx)
    % quspline(x,y,xx):
    %   uses a quadratic spline interpolation to find yy, the values
    %   of the underlying function y at the points in the vector xx.
    %   The vector x specifies the points at which the data y is given.

    n = length(x);
    m = length(xx);
    a = y; % Set a(i) to the function values y(i) as a(i) = f(i)
    b = zeros(1, n-1); % Initialize b(i)
    c = zeros(1, n-1); % Initialize c(i)
    
    % Calculate b(i) for each segment
    for i = 1:n-1
        h_i = x(i+1) - x(i);
        b(i) = (y(i+1) - y(i)) / h_i;
    end
    
    % Calculate c(i) for each segment
    for i = 2:n-1
        h_iminus1 = x(i) - x(i-1);
        h_i = x(i+1) - x(i);
        c(i) = (b(i) - b(i-1)) / h_i - b(i) / h_i;
    end
    
    % Interpolation
    yy = zeros(1, m);
    for i = 1:m
        j = find(x <= xx(i), 1, 'last'); % Find the interval where xx(i) falls
        if isempty(j) || j == n
            j = n - 1;
        end
        hh = xx(i) - x(j); % Distance from xx(i) to the left knot x(j)
        yy(i) = a(j) + b(j) * hh + c(j) * hh^2; % Quadratic spline interpolation
    end
end
