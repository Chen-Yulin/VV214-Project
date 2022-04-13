function res_img = conv2d_3x3(source_img,kernel)
    [row, col] = size(source_img);
    res_img = zeros(row-2, col-2);
    for processRow = 2:row-1
        for processCol = 2:col-1
            cut_img = im2double(source_img(processRow-1:processRow+1, processCol-1:processCol+1));
            res_pixel = 0;
            res_matrix = cut_img.*kernel;
            res_img(processRow-1,processCol-1) = sum(res_matrix,'all');
        end
    end
end