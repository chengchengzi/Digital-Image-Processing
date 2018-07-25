function H = lpfilter(type,M,N,D0,n)
%   函数lpfilter生成理想低通滤波器、巴特沃斯滤波器、高斯滤波器
%
%   参数值列表:type、D0、n
%   'ideal' 理想低通滤波器D0、n不是必须提供的，但D0必须是正数
%   'btw'   巴特沃斯低通滤波器(ButterWorth lowpass filter），n默认值是1.0，D0必须是正数
%   'gaussian'  高斯低通滤波器,n不必须提供，D0必须是正数

%   使用函数dftuv创建用于计算距离的网格数组
[U,V] = dftuv(M,N);

%   计算距离
D = hypot(U,V);

%   滤波器
switch type
    case 'ideal'
        H = single(D <= D0);
    case 'btw'
        if(nargin == 4)
            n = 1;
        end
        H = 1./(1 + (D./D0).^(2*n));
    case 'gaussian'
        H = exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('Unknow filter type.')
end