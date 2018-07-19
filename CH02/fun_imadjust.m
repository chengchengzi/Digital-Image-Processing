g = imread('Fig0203(a).tif');%读取原始图像
imshow(g);

g1 = imadjust(g,[0 1],[1 0],1);%对灰度级图像进行灰度变换
%figure,imshow(g1);

g2 = imcomplement(g); %imcomplement函数同意可获取图像的负片
%figure,imshow(g2);

g2 = imadjust(g,[0.5 0.75],[0 1]); %将0.5到0.75之间的灰度扩展到[0 1]
g3 = imadjust(g,[ ],[ ],2); %压缩灰度级的低端并扩展到高端
%figure,imshow(g3);

g4 = imadjust(g,stretchlim(g),[]); %stretchlim函数获取图像的低参数和高参数
%figure,imshow(g4);


