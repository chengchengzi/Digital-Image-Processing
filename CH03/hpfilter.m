function H = hpfilter(type,M,N,D0,n)
%   函数hpfilter可生成三种高通滤波器，D0必须位正数
%   'ideal' 理想高通滤波器
%   'btw'   巴特沃斯高通滤波器
%   'gaussian'  高斯高通滤波器

if nargin == 4
    n = 1;
end
Hlp = lpfilter(type,M,N,D0,n);
H = 1 - Hlp;
