%%
f = imread('Fig0208(a).tif');
imshow(f);
figure,imhist(f);  %  显示直方图
ylim('auto')
%%
g = histeq(f,256); %  直方图均衡
figure,imshow(g);
figure,imhist(g);
ylim('auto')
