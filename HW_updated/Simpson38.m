function [est,I] = Simpson38(f,x,y,ns)

    est = 0;
    I = [];
    
    for i = 1:ns

        il = 3*(i-1)+1;
        ir = 3*i+1;

        newx = x(il:ir);

        h = (newx(1) - newx(4)) / 3;

        I(i) = 3*h / 8 * ( f(newx(4)) +  3.*f(newx(3))  + 3.*f(newx(2)) +  f(newx(1)) );

        est = est + I(i);

        % fprintf("I = %.4f ",I(i))
  
    end

    est = abs(est);
    
end