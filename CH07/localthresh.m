function g = localthresh(f,nhood,a,b,meantype)
%   函数localthresh执行局部阈值处理
f = tofloat(f);
SIG = stdfilt(f,nhood);
if nargin == 5 && strcmp(meantype,'global')
    MEAN = mean2(f);
else
    MEAN = localmean(f,nhood);
end

%   获得分割图像
g = (f > a*SIG) & (f > b*MEAN);
