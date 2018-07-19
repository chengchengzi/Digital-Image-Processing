function p = twomodegauss(m1,sig1,m2,sig2,A1,A2,k)
% twomodeguass计算一个归一化到单位区域的双模态高斯函数
% p是256元素的向量，sum(p) = 1
% 模型的均值和标准差是(m1,sig1）和(m1,sig2)
% A1,A2是双模态的振幅
% k是一个提升函数“层面”的补偿值
% 一个好的设置值如下：
% m1 = 0.15,sig1 = 0.05,m2 = 0.75,sig2 = 0.05,A1 = 1,A2 = 0.07,k = 0.02

c1 = A1 * (1 / ((2 * pi)^0.5) * sig1);
k1 = 2 * (sig1 ^ 2);
c2 = A2 * (1 / ((2 * pi)^0.5) * sig2);
k2 = 2 * (sig2 ^ 2);
z = linspace(0,1,256);
p = k + c1 * exp(-((z - m1).^2)./ k1) + c2 * exp(-((z - m2) .^ 2) ./ k2);

p = p ./ sum(p(:));