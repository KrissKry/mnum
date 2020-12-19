

function root = bisection(a, b, tolerance)
    count = 1;
    fn_c = 10000;
    while (abs(fn_c) > tolerance) && (abs(b-a) > tolerance)

        c = (a + b)/2;
        fn_a = evaluate(a);
        fn_b = evaluate(b);
        fn_c = evaluate(c);
        %fprintf('%d\n', fn_c);
%        fprintf('Iteracja %d dla przedziału [%d, %d] c=%d f=%d\n', counter, a, b, c, fn_c);
        count = count + 1;
        %looking for a root on the left
        if fn_a * fn_c < 0
            b = c;
        
        %looking for a root on the right
        elseif fn_c * fn_b < 0
            a = c;

        end
    end
    root = c;
    fprintf('%d iterations \n', count);
end