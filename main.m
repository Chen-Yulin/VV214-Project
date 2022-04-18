img = imread('img\test3_1.png');
img_grey = rgb2gray(img);
%imshow(michy_grey);
%mean_graph = MeanValBlur(michy_grey);
%imshow(mean_graph);
img_grey = GuassBlur(img_grey);
box_heigth = zeros(72,1);
box_width = zeros(72,1);
%imshow(michy_grey);
res_sobelx = sobelx(img_grey);
res_sobely = sobely(img_grey);
gradient_graph = findGradient(res_sobelx,res_sobely);
imshow(gradient_graph(:,:,1));
contour_graph = NMS(gradient_graph);
contour_graph = threshold(contour_graph,0.06,0.1);
%imshow(contour_graph);
for i = 0:5:355
    contour_rotate = imRotate(contour_graph,i);
    hold off;
    imshow(double(contour_rotate));
    [pointUL,pointDR] = findBoundBox(contour_rotate);
    box_heigth(i/5+1) = pointDR(1)-pointUL(1);
    box_width(i/5+1) = pointDR(2)-pointUL(2);
    fprintf('progress: %d /360\n',i);
end
box_width = box_width./min(box_heigth);
box_heigth = box_heigth./min(box_heigth);

loss = cal_loss(box_heigth,box_width);
probability = 0.05.^(5*loss);
probability = probability./sum(probability).*100;
result = find(loss == min(loss));
fprintf('the probability of the shape for the picture is:\n');
fprintf('Circle: %5.2f%%\n',probability(1));
fprintf('Triangle: %5.2f%%\n',probability(2));
fprintf('Square: %5.2f%%\n',probability(3));
fprintf('Pentagon: %5.2f%%\n',probability(4));
switch result
    case 1
        disp('Inference: Cirle')
    case 2
        disp('Inference: Triangle')
    case 3
        disp('Inference: Square')
    case 4
        disp('Inference: Pentagon')
    otherwise
end
        
        
