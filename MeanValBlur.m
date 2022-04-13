function A = MeanValBlur(B)
    kernel = ones(5,5);
    kernel(:,:) = 0.04;
    [row,col] = size(B);
    A = zeros(row-2,col-2);
    A = conv2d_5x5(B, kernel);
end