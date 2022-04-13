function loss = L2_lossFunction(Y, R)
    sqr_sum = sum((Y-R).^2);
    loss = sqrt(sqr_sum/length(Y));
end