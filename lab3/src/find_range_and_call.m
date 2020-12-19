
function [roots] = find_range_and_call(type)
    % type == 0 => Call bisection
    % type != 0 => Call newton
    a = 0;
    b = 1;
    beta = 1.05;
    roots = zeros(2, 1);
    x1 = a;
    x2 = b;

    for k = 1:2
        for iter = 1:25
            if evaluate(x1) * evaluate(x2) < 0
                
                
                if type == 0
                    fprintf('Bisection call in range: [%d, %d]\n', x1, x2);
                    roots(k) = bisection(x1, x2, 0.0001);
                else
                    fprintf('Newton call with argument %d\n', x1);
                    roots(k) = newton(x1, 0.0001);
                end

                x1 = x2;
                x2 = b + 2;
                break;
                
            elseif abs(evaluate(x1)) < abs(evaluate(x2))
                x1 = x1 + beta * (x1 - x2);

            else
                x2 = x2 + beta * (x2 - x1);
            end
        end
    end
end


