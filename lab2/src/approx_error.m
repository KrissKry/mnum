function [approx_error] = approx_error(X, Y, coefficients)

    coefficients = flip(coefficients, 1);
    %1, x, x^2, ...
    degree = size(coefficients, 1);

    approx_error = zeros( size(X) );

    for element = 1:size(X,2)

        sum = 0;
        for coeff = 1 : degree

            sum = sum + coefficients(coeff) * X(element)^(coeff - 1);

        end
        approx_error(element) = Y(element) - sum;
    end
    
end