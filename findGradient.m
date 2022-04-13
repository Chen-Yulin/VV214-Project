function gradient_graph = findGradient(sobelx_graph, sobely_graph)
    [row, col] = size(sobelx_graph);
    gradient_graph = zeros(row,col,4);
    gradient_graph(:,:,3)=sobelx_graph;
    gradient_graph(:,:,4)=sobely_graph;
    for g_row = 1:row
        for g_col = 1:col
            gradx = sobelx_graph(g_row,g_col);
            grady = sobely_graph(g_row,g_col);
            gradient_graph(g_row,g_col,1) = sqrt(gradx^2+grady^2);
            theta = -1;
            if abs(gradx)*0.4>abs(grady)
                theta = 0;
            elseif abs(gradx)*0.4<abs(grady)&&abs(gradx)>abs(grady)*0.4&&gradx*grady>0
                theta = 1;
            elseif abs(gradx)<abs(grady)*0.4
                theta = 2;
            elseif abs(gradx)*0.4<abs(grady)&&abs(gradx)>abs(grady)*0.4&&gradx*grady<0
                theta = 3;
            end
            gradient_graph(g_row,g_col,2) = theta;
        end
    end
            
end