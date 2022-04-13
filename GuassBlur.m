function A = GuassBlur(B)
    kernel = [0.095 0.118 0.095;
              0.118 0.148 0.118;
              0.095 0.118 0.095];
    [row,col] = size(B);
    A = zeros(row-2,col-2);
    A = conv2d_3x3(B, kernel);
end