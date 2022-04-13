function res_img = sobely(source_img)
    kernel = zeros(3,3);
    kernel(3,:) = -1;
    kernel(1,:) = 1;
    kernel(1,2) = 2;
    kernel(3,2) = -2;
    res_img = conv2d_3x3(source_img, kernel);
    res_img = res_img./4;
end