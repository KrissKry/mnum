
%   DOKUMENTACJA:
%   get_data()                                  - zwraca macierze X, Y z zadania
%   get_coefficients_normal/qr(X, Y, degree)    - zwraca współczynniki wielomianu
%   approx_error(X, Y, coefficients)            - zwraca błędy dla każdego z dyskretnych próbek X
%   euclides_norm(approx_error)                 - zwraca normę euklidesową dla błędów przybliżenia wielomianu do próbek
%   max_norm(approx_norm)                       - zwraca maksymalną normę dla błędów przybliżenia wielomianu do próbek
%   plot_approximation(X, Y, coefficients)      - rysuje dyskretne próbki oraz przybliżony wielomian


function do_everything(type, degree)
    % type 1 == układ równań normalnych
    % type 2 or any other == QR
    [X, Y] =  get_data();
    
    if type == 1
        wsp = get_coefficients_normal(X, Y, degree);
    else
        wsp = get_coefficients_qr(X, Y, degree);
    end
    
    blad = approx_error(X, Y, wsp);
    euc_norm = euclides_norm(blad);
    czebyszew_norm = max_norm(blad);

    plot_approximation(X, Y, wsp);
end