function [U,V] = dftuv(M,N)
%   函数[u,v] = dftuv(M,N)提供距离计算及其他类似所需的网格数组
%   u,v，M,N是单一类型

%   建立单一变量
u = single(0:(M - 1));
v = single(0:(N - 1));

%   计算在meshgrid中使用的索引
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;

%   计算网格数组
[V,U] = meshgrid(v,u);
