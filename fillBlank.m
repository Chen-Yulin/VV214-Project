function A = fillBlank(row,col,B)
    [B_row,B_col] = size(B);
    A = uint8(zeros(row,col));
    avgColor = 0;
    for i = 1:B_row
        avgColor = avgColor+double(B(i,1))+double(B(i,B_col));
    end
    for j = 1:B_col
        avgColor = avgColor+double(B(1,j))+double(B(B_row,j));
    end
    avgColor = uint8(round(avgColor/(2*B_row+2*B_col-4)));
    A(:,:) = avgColor;
end