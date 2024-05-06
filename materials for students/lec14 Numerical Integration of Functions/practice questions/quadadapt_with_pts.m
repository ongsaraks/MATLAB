function [q, xpts] = quadadapt_with_pts(f,a,b,tol,varargin)
% Evaluates definite integral of f(x) from a to b
if nargin < 4 | isempty(tol),tol = 1.e-6;end
c = (a + b)/2;
fa = feval(f,a,varargin{:});
fc = feval(f,c,varargin{:});
fb = feval(f,b,varargin{:});

[q, xpts_sub] = quadstep(f, a, b, tol, fa, fc, fb, varargin{:});

xpts = [a b xpts_sub];
xpts = sort(xpts)';

end


function [q, xpts_sub] = quadstep(f,a,b,tol,fa,fc,fb,varargin)
% Recursive subfunction used by quadadapt.
h = b - a; c = (a + b)/2;
d = (a+c)/2;
e = (c+b)/2;
fd = feval(f,(a+c)/2,varargin{:});
fe = feval(f,(c+b)/2,varargin{:});
q1 = h/6 * (fa + 4*fc + fb);
q2 = h/12 * (fa + 4*fd + 2*fc + 4*fe + fb);
if abs(q2 - q1) <= tol
    q = q2 + (q2 - q1)/15;
    xpts_sub = [d c e];
else
    [qa, xpts_suba] = quadstep(f, a, c, tol, fa, fd, fc, varargin{:});
    [qb, xpts_subb] = quadstep(f, c, b, tol, fc, fe, fb, varargin{:});
    q = qa + qb;

    xpts_sub = [xpts_suba  c  xpts_subb];
end
end