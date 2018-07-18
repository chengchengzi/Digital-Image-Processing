f = imread('Fig0101.tif'); %读取图片
imshow(f);  %显示图片
g = imread('Fig0104.tif');
figure,imshow(g);   %同时输出两幅图像
imwrite(f,'Fig0101_copy.tif'); %写入图片到当前目录

