%liczy i zwraca współczynniki
function [coefficients] = get_coefficients_qr(X, Y, degree)
    
    samples = size(X, 2);
    A = zeros(samples, degree + 1);

    for row = 1:samples
        for column = degree + 1:-1:1
            A(row, column) = X(row) ^ (degree + 1 - column);
        end
    end

    % Dekompozycja QR na macierzy A o wymiarach m x n, taka, że A = QR.
    % R to macierz górna trójkątna o wymiarach m x n, 
    % Q to macierz ortogonalna o wymiarach m x m.
    [Q, R] = qr(A);
    % [R, Q] = qrmgs(A); %nieużywana implementacja
    
    % Y = Y' bo moja macierz Y ma wymiar nx1
    coefficients = R \ (Q' * Y');
end