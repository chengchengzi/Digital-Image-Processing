%%
% 计算全局阈值
f = imread('Fig1013(a).tif')
imshow(f);
count = 0;
T = mean2(f);
done = false;
while ~done
    count = count + 1;
    g = f > T;
    Tnext = 0.5 * (mean(f(g)) + mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end
g = im2bw(f,T/255);
figure,imhist(f);
figure,imshow(g);

%%
%   使用Otsu方法进最佳行全局阈值处理
f = imread('Fig1014(a).tif');
imshow(f);
[T,SM] = graythresh(f);
g = im2bw(f,T);
figure,imshow(g);

%%
%   使用图像平滑进行全局阈值处理
f = imread('Fig1015(a)[noiseless].tif');
imshow(f);
%   生成带噪图像
fn = imnoise(f,'gaussian',0,0.038);
figure,imshow(fn);

%   使用5*5的均值模板平滑图像
w = fspecial('average',5);
fa = imfilter(fn,w,'replicate');
figure,imshow(fa);

%   使用Otsu方法分割
Ta = graythresh(fa);
ga = im2bw(fa,Ta);
figure,imshow(ga);

%%
%   使用拉普拉斯算子边缘信息改进全局阈值处理
f = imread('Fig1017(a).tif');
imshow(f);
f = tofloat(f);
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
lap = abs(imfilter(f,w,'replicate'));
lap = lap/max(lap(:));
h = imhist(lap);
Q = percentile2i(h,0.995);
markerImage = lap > Q;
fp = f.*markerImage;
figure,imshow(fp);
hp = imhist(fp);
hp(1) = 0;
figure,bar(hp,0);
T = graythresh(hp);
g = im2bw(f,T);
figure,imshow(g);
