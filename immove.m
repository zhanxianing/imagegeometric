%图像平移，自写平移函数immove.m
function outImage=immove(inImage,Tx,Ty)
[m, n] = size(inImage);%计算图象大小
outImage = uint8(zeros(m+abs(Ty), n+abs(Tx)));
if(Tx>0&&Ty>0) %往右下角平移的情况
outImage(1+Ty:m+Ty,1+Tx:n+Tx) = inImage;
   else if(Tx<0&&Ty<0) %往左上角平移的情况
      outImage(1:m,1:n) = inImage;
         else if (Tx<0&&Ty>0)  %往左下角平移的情况
            outImage(1+Ty:m+Ty,1:n) = inImage;
                else % 往右上角平移的情况
                   outImage(1:m,1+Tx:n+Tx) = inImage;
             end
       end
end
