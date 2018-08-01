%%  
%   使用距离和分水岭变换分割二值图像
f = imread('Fig1026(a).tif');
imshow(f);
gc = ~f;
D = bwdist(gc);
L = watershed(-D);
w = L == 0;
g2 = f & ~w;
figure,imshow(g2);

%%  
%   使用梯度的分水岭分割
f = imread('Fig1027(a).tif');
imshow(f);
h = fspecial('sobel');
fd = tofloat(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
figure,imshow(g);
L = watershed(g);
wr = L == 0;
figure,imshow(wr);  %   分割并不理想

