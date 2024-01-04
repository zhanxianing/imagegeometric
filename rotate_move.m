imagedata = imread('Fig3.tif');
%figure
%imshow(imagedata);
%[m,n]=size(imagedata);

%补充:变换矩阵translationM，旋转角度为30°=pi/6
init = imread('Fig3.tif'); % 读取图像
[R, C] = size(init); % 获取图像大小 
res1 = zeros(R, C); % 构造结果矩阵。每个像素点默认初始化为0（黑色） 
delX = -50; % 平移量X 
delY = -50; % 平移量Y 
tras = [1 0 delX; 0 1 delY; 0 0 1]; % 平移的变换矩阵
for i = 1 : R 
    for j = 1 : C 
        temp = [i; j; 1]; 
        temp = tras * temp; % 矩阵乘法 
        x = temp(1, 1); 
        y = temp(2, 1); % 变换后的位置判断是否越界 
        if (x <= R) & (y <= C) & (x >= 1) & (y >= 1) 
            res1(x, y) = init(i, j); 
        end
    end
end; 
imshow(uint8(res1)); % 显示图像
title('平移图像');
























