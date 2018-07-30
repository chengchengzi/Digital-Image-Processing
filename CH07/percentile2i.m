function I = percentile2i(h,P)
%   函数percentile2i计算一个给出的百分位的密度值
%   I，P在[0,1]之间

%   检查p的值
if P < 0 || P > 1
    error('The percentilr must be in the rang [0,1]');
end

%   归一化直方图
h = h /sum(h);

% 累计分布
C = cumsum(h);

idx = find(C >= P,1,'first');
I = (idx - 1)/(numel(h) - 1);