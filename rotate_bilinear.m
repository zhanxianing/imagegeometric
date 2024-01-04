init = imread('Fig3.tif'); % ¶ÁÈ¡Í¼Ïñ
[R, C] = size(init);
res4 = zeros(R, C);
for i = 1 : R 
    for j = 1 : C 
        x = i; y = C - j + 1; 
        res4(x, y) = init(i, j); 
    end 
end
imshow(uint8(res4));
title('Ë®Æ½¾µÏñ±ä»»Í¼Ïñ');






















