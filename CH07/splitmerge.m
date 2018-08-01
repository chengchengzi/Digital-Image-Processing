function g = splitmerge(f,mindim,fun)
%   函数splitmerge实现区域分割合并算法
%   如有必要，该函数会将图像填充为正方形，以便qtdecomp将区域分裂为1*1的单个像素
%   图像首先由函数qtdecomp分块，函数split_test用predicate确定一个区域是否应该分离。
%   
%   参数mindim定义分解中允许的最小快的尺寸
%   fun使用@predicate
%
%   function flag = predicate(region)
%   sd = std2(region);
%   m = mean2(region);
%   flag = (sd > 10) & (m > 0) & (n < 125);

%   填充图像为正方形
Q = 2^nextpow2(max(size(f)));
[M,N] = size(f);
f = padarray(f,[Q - M,Q - N],'post');

%   将图像分块,然后执行合并
Z = qtdecomp(f,@split_test,mindim,fun)

%   首先取得分快后的最大块
Lmax = full(max(Z(:)));

%   然后将输出图像置0,MAKER数组稍后用来实现关联
g = zeros(size(f));
MARKER = zeros(size(f));

%   开始实现合并
for K = 1:Lmax
    [vals,r,c] = qtgetblk(f,Z,K);
    if ~isempty(vals)
        for I = 1:length(r)
            xlow = r(I);ylow = c(I);
            xhigh = xlow + K - 1;yhigh = ylow + K - 1;
            region = f(xlow:xhigh,ylow:yhigh);
            flag = fun(region);
            if flag
                g(xlow:xhigh,ylow:yhigh) = 1;
                MARKER(xlow,ylow) = 1;
            end
        end
    end
end

%   最后使用函数bwlabel获得每一个连接区域和标签
g = bwlabel(imreconstruct(MARKER,g));

g = g(1:M,1:N);

%------------------------------------------------------------------------%
function v = split_test(B,mindim,fun)
%   函数split_test确定一个区域是否应该被分离
%   logical 1s(TRUE) 则该区域应该被分离
%   logical 0s(FALSE) 不分离

%   k获取区域B中的数量
k = size(B,3);

v(1:k) = false;
for I = 1:k
    quadregion = B(:,:,I);
    if size(quadregion,1) <= mindim
        v(I) = false;
        continue
    end
    flag = fun(quadregion);
    if flag
        v(I) =  true;
    end
end

