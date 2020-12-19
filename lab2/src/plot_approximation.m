%rysuje wykres próbek oraz aproksymowanego wielomianu

function plot_approximation(X, Y, coefficients)
    
    %próbkowanie wielomianu = 10x liczba próbek X
    sample_rate = size(X,2) * 10;

    %co jaką wartość x jedna próbka wielomianu
    x_step = ( X(end) - X(1) ) / sample_rate;

    polynomial_x = X(1):x_step:X(end);
    polynomial_y = polyval(coefficients, polynomial_x);


    plot(X, Y, 'o', polynomial_x, polynomial_y);
    ylabel('y(x)');
    xlabel('x');
    title('Próbki');
    grid on;
end