function [est,I] = Simpson13(f,x,y,ns,b)

    est = 0;
    I = [];

    for i = 1:ns
        
        il = 2*(i-1)+1;
        ir = 2*i+1;

        newx = x(il:ir);
        
        h = (newx(1) - newx(3)) / 2;

        I(i) = h/3 * ( f(newx(3)) + 4.*f(newx(2)) + f(newx(1)) );

        est = est + I(i);

        % fprintf("I = %.4f ",I(i))

    end

    est = abs(est);
           
end