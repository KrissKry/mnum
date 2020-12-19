function [coefficients] = get_coefficients_normal(X, Y, degree)
    tic
    
    %G * a = rho - układ równań normalnych
    rho = zeros(degree + 1, 1);
    G = zeros(degree + 1, degree + 1);
    samples = size(X, 2); % == 11


    
    %count rho
    for equation = 1:degree + 1
        sum = 0;
        for sample = 1: samples
            sum = sum + Y(sample) * (X(sample)^(equation-1));
        end
        rho(equation, 1) = sum;
    end

    %count G
    for row = 1: degree + 1
        for column = 1: degree + 1
            g = 0;
            for sample = 1: samples
                g = g + X(sample)^(row + column - 2);
            end
            G(row, column) = g;
        end
    end

    coefficients = linsolve(G, rho);
    %is now 1 + x + x^2 ...

    coefficients = flip(coefficients, 1);
    %is now ...x^2 + x + 1

    toc
end