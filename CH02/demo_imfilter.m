%%
%  函数imfilter的应用
f = imread('Fig0216(a).tif');
imshow(f);

w = ones(31);  %  生成滤波模板
gd = imfilter(f,w);
figure,imshow(gd,[ ])

gr = imfilter(f,w,'replicate');
figure,imshow(gr,[ ])

gs = imfilter(f,w,'symmetric');
figure,imshow(gs,[ ])

gc = imfilter(f,w,'circular');
figure,imshow(gc,[ ])

f8 = im2uint8(f);
g8r = imfilter(f,w,'replicate');
figure,imshow(g8r,[ ])
















