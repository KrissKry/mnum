function [roots] = laguerre(x, coeffs, tolerance)

    F = coeffs;
    n = length(coeffs) - 1;
    roots = zeros(4, 1);
    xk = x;
    counter = 0;
    while n > 0
        %derivatives 
        dF = polyder(F);
        d2F = polyder(dF);

        %max iterations for each polynomial of nth degree
        for i = 1:25

            % f(x), f'(x), f''(x)
            Fx = polyval(F, xk);
            dFx = polyval(dF, xk);
            d2Fx = polyval(d2F, xk);

            %tolerance reached
            if abs(Fx) < tolerance
                break;
            end

            %nominator
            nomin =  n * Fx;

            %denominator
            z = (n - 1) * ((n - 1) * dFx^2 - n * Fx * d2Fx);
            zp = dFx + sqrt(z);
            zn = dFx - sqrt(z);

            %choose which denominator to use
            if abs(zp) > abs(zn)
                denomin = zp;
            else
                denomin = zn;
            end

            fprintf('Iteration %d, x = %.5f + %.5fi, |Fx| = %.5f\n', i, real(xk), imag(xk), abs(Fx));
            
            %calculate next x
            xk = xk - nomin/denomin;

            counter = counter + 1;
        end

        %f(xk) for approximity of root
        y = abs(polyval(F, xk));

        fprintf('Root found at x = %.5f + %.5fi. |Fx| = %.5f\n', real(xk), imag(xk), y);

        %add calculated root to output
        roots(n) = xk;

        % https://uk.mathworks.com/help/matlab/ref/deconv.html
        % deflation
        [ F, R ] = deconv(F, [1, -xk]);
        
        % polynomial degree decreased by 1
        n = n - 1;

    end
    fprintf('Iterations %d', counter);
end