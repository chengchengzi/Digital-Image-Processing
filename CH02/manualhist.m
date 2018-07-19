function p = manualhist
%  函数p = manualhist使用函数twomodegauss绘制最终的高斯函数
%  返回最终计算所得的直方图

%  初始化
% x 用来停止绘制
repeats = true;
quitnow = 'x'

% 计算默认的直方图
p = twomodegauss(0.15,0.05,0.75,0.05,1,0.07,0.002);

% 循环输入参数直到遇到停止符'x'
while repeats
    s = input('Enter m1, sig1,m2, sig2, A1, A2, k or x to quit','s');
    if strcmp(s, quitnow)
        break
    end
    
    % 将输入的string 转换为一个向量的数字值并且验证输入的数字
    v = str2num(s);
    if numel(v) ~= 7
        disp('Incorrect number of imputs.')
        continue
    end
    
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5),v(6),v(7));
    figure, plot(p)
    xlim([0 255])
end


