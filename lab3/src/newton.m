
function [root] = newton(x, tolerance)
    count = 1;
    xn = x;
    f_xn = 10000;

    while abs(f_xn) > tolerance
        
        f_xn = evaluate(xn);

        f_prim = derivative(xn);
        %fprintf('%d\n', xn);
        xn = xn - (f_xn/f_prim);
        count = count + 1;
    end
    
    root = xn;
    fprintf('%d iterations \n', count);
end