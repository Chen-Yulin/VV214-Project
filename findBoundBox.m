function [pointUL,pointDR] = findBoundBox(contour_graph)
    [row,col] = find(contour_graph==1);
    pointUL = [min(row),min(col)];
    pointDR = [max(row),max(col)];
end