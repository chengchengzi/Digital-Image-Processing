function PQ = paddedsize(AB,CD,PARAM)
%   函数paddedsize计算填充大小，适用于基于FFT的过滤器
%   PQ = paddedsize(AB),计算PQ = 2*AB，AB是两个元素大小的向量
%   
%   PQ = paddedsize(AB,'PWR2') 计算 PQ(1) = PQ(2) = 2^nextpow(2*m),m是MAX（AB）
%
%   PQ = （AB,CD)，计算两个元素大小的PQ,PQ = AB + CD - 1
%
%   PQ = （AB,CD,'PWR2')计算向量PQ = PQ(1)=PQ(2)=2^nextpow2(2*m),m是MAX（[AB CD]）

if nargin == 1
    PQ = 2*AB;
elseif nargin == 2 && ~ischar(CD)
        PQ = AB + CD - 1;
        PQ = 2 * ceil(PQ / 2);
elseif nargin == 2
        m = max(AB);
        P = 2^nextpow(2*m);
        PQ = [P,P];
elseif (nargin == 3) && strctmpi(PARAM,'pwr2')
    m = max([AB CD]);
    P = 2^nextpow2(2*m);
    PQ = [P,P];
else
    erroe('Wrong number of inputs.')
end
        
        