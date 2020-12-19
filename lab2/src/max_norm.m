%liczy normę Czebyszewa (maksymalną) dla podanej macierzy błędów
function [norm] = max_norm(approx_error)

    norm = 0;

    for err = 1:size(approx_error, 2)

        if abs(approx_error(err)) > norm
            norm = abs(approx_error(err));
        
        end
    end
end