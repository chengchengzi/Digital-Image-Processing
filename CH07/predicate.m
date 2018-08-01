function flag = predicate(region)
%   函数predicate被用于函数splitmerge中估计一个predicate

sd = std2(region);
m = mean2(region);
flag = (sd > 10) & (m > 0) & (m < 125);
