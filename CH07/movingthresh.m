function g = movingthresh(f,n,K)
%   函数movingthersh使用移动平均阈值分割图像
%   像素K必须在[0,1]之间

%   检查输入的数据
f = tofloat(f);
[M,N] = size(f);
if (n < 1) || (rem(n,1) ~= 0)
    error('n must be in integer >= 1.')
end
if K < 0 || K > 1
    error('K must be a fraction in the range [0,1]')
end

%   转换图像为向量
f(2:2:end,:) = fliplr(f(2:2:end,:));
f = f';
f = f(:)';

%   计算移动平均值
maf = ones(1,n)/n;
ma = filter(maf,1,f);

%   阈值处理
g = f > K * ma;

%   图像格式化
g = reshape(g,N,M)';

g(2:2:end, :) = fliplr(g(2:2:end, :));