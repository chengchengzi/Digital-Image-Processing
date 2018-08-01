function [g,NR,SI,TI] = regiongrow(f,S,T)
%   函数regingrow实现基本的区域生长分割
%   f是输入待分割的图像
%   S是单一种子值
%   T是包含了阈值的数组，也可以是全局阈值
%   S和T中所有的值必须在[0,1]之间
%   
%   g是分割后的图像
%   NR是所找到的区域的数量
%   SI是包含种子点的一副图像
%   TI是包含处理连接性之前就已通过阈值测试的像素的一副图像

f = tofloat(f);
%   如果S是标量，包含种子图像
if numel(S) == 1
    SI = f == S;
    S1 = S;
else
    %   S是数组
    SI = bwmorph(S,'shrink',Inf);
    S1 = f(SI);
end

TI = false(size(f));
for K = 1 : length(S1)
    seedvalue = S1(K);
    S = abs(f - seedvalue) < T;
    TI = TI | S;
end

[g,NR] = bwlabel(imreconstruct(SI,TI));