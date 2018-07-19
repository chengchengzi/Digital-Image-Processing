%%
%  fspacial应用
%  生成拉普拉斯算子
w = fspecial('laplacian',0);

f = imread('Fig0217(a).tif');
imshow(f);
g1 = imfilter(f,w,'replicate');
figure,imshow(g1,[ ]);


 f2 = tofloat(f);
 g2 = imfilter(f2,w,'replicate');
 
 g = f2 - g2;
 figure,imshow(g);

 %%
 f = imread('Fig0217(a).tif');
 w4 = fspecial('laplacian',0);
 w8 = [1 1 1;1 -8 1;1 1 1];
 f = tofloat(f);
 g4 = f - imfilter(f,w4,'replicate');
 g8 = f - imfilter(f,w8,'replicate');
 imshow(f);
 figure,imshow(g4);
 figure,imshow(g8);
