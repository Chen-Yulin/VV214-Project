function A = imRotate(B,degree)
[row,col]=size(B);
newRow=round(row*abs(cosd(degree))+col*abs(sind(degree)));
newCol=round(col*abs(cosd(degree))+row*abs(sind(degree)));
A = fillBlank(newRow,newCol,B);
M1=[1 0 0;0 -1 0;-0.5*newCol 0.5*newRow 1 ];
M2=[cosd(degree) -sind(degree) 0;sind(degree) cosd(degree) 0;0 0 1];  %角度旋转变换矩阵M2，顺时针方向
M3=[1 0 0;0 -1 0;0.5*col 0.5*row 1];
    for i=1:newCol
        for j=1:newRow
            temp=[i j 1]*M1*M2*M3;
            y=temp(1,2);
            x=temp(1,1);
            y=round(y);
            x=round(x);
           if(x>=1&&x<=col)&&(y>=1&&y<=row)
               A(j,i,:)=B(y,x,:);
           end
        end
    end
    A=uint8(A);
end
