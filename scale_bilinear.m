init = imread('Fig3.tif');
figure
imshow(imagedata);
[m,n]=size(imagedata);

%补充变换矩阵

%补充:图像放大后的空间坐标位置C
%要求Y方向放大2倍和X方向放大1.5倍


%补充：显示放大或缩小后的结果
% 读取图像
[R, C] = size(init); % 获取图像大小 
res = zeros( R, C); % 构造结果矩阵。每个像素点默认初始化为0（黑色） 
alfa = -15 * 3.1415926 / 180.0; % 旋转角度 
tras = [cos(alfa) sin(alfa) 0; -sin(alfa) cos(alfa) 0; 0 0 1]; % 旋转的变换矩阵 
for i = 1 : R 
    for j = 1 : C 
        temp = [i; j; 1]; 
        temp = tras * temp;% 矩阵乘法 
        x = uint16(temp(1, 1)); 
        y = uint16(temp(2, 1)); % 变换后的位置判断是否越界 
        if (x <= R) & (y <= C) & (x >= 1) & (y >= 1) 
            res(i, j) = init(x, y); 
        end
    end
end; 
imshow(uint8(res)); % 显示图像
title('旋转变换图像');
