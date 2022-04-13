function gradient_graph = threshold(grad_img,downValue,upValue)
    [row,col,~] = size(grad_img);
    gradient_graph = zeros(row,col,1);
    for g_row = 1:row
        for g_col = 1:col
            if grad_img(g_row,g_col,1) < downValue
                gradient_graph(g_row,g_col,1) = 0;
                %gradient_graph(g_row,g_col,2) = -1;
            elseif grad_img(g_row,g_col,1) > downValue && grad_img(g_row,g_col,1) < upValue
                gradient_graph(g_row,g_col,1) = 0.5;
                %gradient_graph(g_row,g_col,2) = grad_img(g_row,g_col,2);
            else
                gradient_graph(g_row,g_col,1) = 1;
                %gradient_graph(g_row,g_col,2) = grad_img(g_row,g_col,2);
            end
        end
    end
end