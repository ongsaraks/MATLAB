function yy = quadspline(x,y,xx)

% quadspline(x,y,xx):
%   uses a quadratic spline interpolation to find yy, the values
%   of the underlying function y at the points in the vector xx.
%   The vector x specifies the points at which the data y is given.
n = length(x); m = length(xx);
aa(n,1) = -1; aa(n,2) = 1 ;cc(n) = 0;
for i = 1:n - 1
    aa(i,i) = h(x, i) / 2;
    aa(i,i+1) = h(x, i) / 2;
    cc(i) = y(i + 1) - y(i);
end
aa
b = aa\cc';
for i = 1:n - 1
    a(i) = y(i);
    if i == 1
        c(i) = 0;
    else
        c(i) = ((y(i + 1) - y(i) - (b(i) * h(x , i)))/(h(x , i) ^ 2));
    end
end
a
b
c
for i = 1:m
    yy(i) = SplineInterp(x, n, a, b, c, xx(i));
end
end
%%
function hh = h(x, i)
hh = x(i + 1) - x(i);
end

function yyy = SplineInterp(x, n, a, b, c, xi)
for ii = 1:n - 1
    if xi >= x(ii) - 0.000001 & xi <= x(ii + 1) + 0.000001
        yyy=a(ii)+b(ii)*(xi-x(ii))+c(ii)*(xi-x(ii))^2;
        break
    end
end
end