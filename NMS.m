function contour_graph = NMS(grad_graph)
    [row,col,~] = size(grad_graph);
    grad_graph(2:row-1,2:col-1,1)=GuassBlur(grad_graph(:,:,1));
    contour_graph = zeros(row,col);
    for g_row = 2:row-1
        for g_col = 2:col-1
            dir = grad_graph(g_row,g_col,2);
            center = grad_graph(g_row,g_col);
            E = grad_graph(g_row,g_col+1);
            NE = grad_graph(g_row-1,g_col+1);
            N = grad_graph(g_row-1,g_col);
            NW = grad_graph(g_row-1,g_col-1);
            W = grad_graph(g_row,g_col-1);
            SW = grad_graph(g_row+1,g_col-1);
            S = grad_graph(g_row+1,g_col);
            SE = grad_graph(g_row+1,g_col+1);
            if dir == 0     %横向
                if center>=E && center>=W
                    contour_graph(g_row,g_col) = center;
                else
                    contour_graph(g_row,g_col) = 0;
                end
            elseif dir == 1 %左上
                if center>=NE && center>=SW
                    contour_graph(g_row,g_col) = center;
                else
                    contour_graph(g_row,g_col) = 0;
                end
            elseif dir == 2 %竖直
                if center>=N && center>=S
                    contour_graph(g_row,g_col) = center;
                else
                    contour_graph(g_row,g_col) = 0;
                end
            elseif dir == 3 %右上
                if center>=SE && center>=NW
                    contour_graph(g_row,g_col) = center;
                else
                    contour_graph(g_row,g_col) = 0;
                end
            end
        end
    end
end