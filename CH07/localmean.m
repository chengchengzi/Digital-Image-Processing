function mean = localmean(f,nhood)
%   函数localmean计算局部平均值

if nargin == 1
    nhoog = ones(3)/9;
else
    nhood = nhood / sum(nhoog(:));
end
mean = imfilter(tofloat(f),nhood,'replicate');
