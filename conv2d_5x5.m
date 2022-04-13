function res_img = conv2d_5x5(source_img,kernel)
    [row, col] = size(source_img);
    res_img = zeros(row-4, col-4);
    for processRow = 3:row-2
        for processCol = 3:col-2
            cut_img = im2double(source_img(processRow-2:processRow+2, processCol-2:processCol+2));
            res_matrix = cut_img.*kernel;
            res_img(processRow-2,processCol-2) = sum(res_matrix,'all');
        end
    end
end