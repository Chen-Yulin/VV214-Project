function res_img = sobelx(source_img)
    kernel = zeros(3,3);
    kernel(:,1) = -1;
    kernel(:,3) = 1;
    kernel(2,1) = -2;
    kernel(2,3) = 2;
    res_img = conv2d_3x3(source_img, kernel);
    res_img = res_img./4;
end