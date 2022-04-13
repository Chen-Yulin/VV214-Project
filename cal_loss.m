function Loss = cal_loss(measured_height, measured_width)
    dataSet = readtable('data\dataSet.xlsx');
    index = find(measured_height == 1,1);
    len = length(measured_height);
    tailored_height = zeros(len,1);
    tailored_width = zeros(len,1);
    tailored_height(1:len-index+1) = measured_height(index:len);
    tailored_height(len-index+2:len) = measured_height(1:index-1);
    tailored_width(1:len-index+1) = measured_width(index:len);
    tailored_width(len-index+2:len) = measured_width(1:index-1);
    %L2 loss function
    %cal the probability for Circle
    cir_loss = L2_lossFunction(dataSet.Circle_h,tailored_height)+L2_lossFunction(dataSet.Circle_w,tailored_width);
 
    figure(1)
    subplot(2,6,1);
    hold on;
    plot(tailored_height);
    plot(dataSet.Circle_h);
    axis([1 72 0.9 1.45]);
    hold off;
    subplot(2,6,7);
    hold on;
    plot(tailored_width);
    plot(dataSet.Circle_w);
    axis([1 72 0.9 1.45]);
    hold off;
    
    %cal the probability for Tri
    tri_loss = L2_lossFunction(dataSet.Tri_h,tailored_height)+L2_lossFunction(dataSet.Tri_w,tailored_width);
    
    subplot(2,6,2);
    hold on;
    plot(tailored_height);
    plot(dataSet.Tri_h);
    axis([1 72 0.9 1.45]);
    hold off;
    subplot(2,6,8);
    hold on;
    plot(tailored_width);
    plot(dataSet.Tri_w);
    axis([1 72 0.9 1.45]);
    hold off;
    
    %cal the probability for Sqr
    sqr_loss = L2_lossFunction(dataSet.Sqr_h,tailored_height)+L2_lossFunction(dataSet.Sqr_w,tailored_width);
    
    subplot(2,6,3);
    hold on;
    plot(tailored_height);
    plot(dataSet.Sqr_h);
    axis([1 72 0.9 1.45]);
    hold off;
    subplot(2,6,9);
    hold on;
    plot(tailored_width);
    plot(dataSet.Sqr_w);
    axis([1 72 0.9 1.45]);
    hold off;
    
    %cal the probability for Pent
    pent_loss = min(L2_lossFunction(dataSet.Pent_1_h,tailored_height)+L2_lossFunction(dataSet.Pent_1_w,tailored_width),L2_lossFunction(dataSet.Pent_2_h,tailored_height)+L2_lossFunction(dataSet.Pent_2_w,tailored_width));
    
    subplot(2,6,4);
    hold on;
    plot(tailored_height);
    plot(dataSet.Pent_1_h);
    axis([1 72 0.9 1.45]);
    hold off;
    subplot(2,6,10);
    hold on;
    plot(tailored_width);
    plot(dataSet.Pent_1_w);
    axis([1 72 0.9 1.45]);
    hold off;
    
    subplot(2,6,5);
    hold on;
    plot(tailored_height);
    plot(dataSet.Pent_2_h);
    axis([1 72 0.9 1.45]);
    hold off;
    subplot(2,6,11);
    hold on;
    plot(tailored_width);
    plot(dataSet.Pent_2_w);
    axis([1 72 0.9 1.45]);
    hold off;
    
    
    Loss = [cir_loss, tri_loss, sqr_loss, pent_loss];
end