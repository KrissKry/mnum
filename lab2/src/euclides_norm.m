%liczy normę euklidesową dla podanej macierzy błędów
function [norm] = euclides_norm(approx_error)

    sum = 0;
    for err = 1:size(approx_error, 2)
    
        sum = sum + approx_error(err)^2;    
    end

    norm = sqrt(sum);
end
