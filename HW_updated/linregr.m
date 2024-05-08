function [a, r2] = linregr(x,y)
% linregr: linear regression curve fitting
% [a, r2] = linregr(x,y): Least squares fit of straight
% line to data by solving the normal equations
% input:
% x = independent variable
% y = dependent variable
% output:
% a = vector of slope, a(1), and intercept, a(2)
% r2 = coefficient of determination
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
x = x(:); y = y(:); % convert to column vectors
sx = sum(x);
sy = sum(y);
sx2 = sum(x.*x) ;
sxy = sum(x.*y) ;
sy2 = sum(y.*y);

%-----add------%
y_bar = sy/length(y);
st = sum((y.*y_bar).^2);
%--------------%
a(1) = (n*sxy-sx*sy)/(n*sx2-sx^2);
a(2) = sy/n-a(1)*sx/n;

%-----add------%
sr = sum((y - a(2) - a(1).*x).^2);
sy_x = sqrt(sr/(length(x)-2))
%--------------%

r2 = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2

%-----add------%
r = sqrt(r2)
%--------------%

% create plot of data and best fit line
xp = linspace(min(x),max(x),2);
yp = a(1)*xp+a(2);
plot(x,y,'o',xp,yp)
grid on
end