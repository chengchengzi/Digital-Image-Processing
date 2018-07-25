function g = dftfilt(f,H,classout)
%   函数dftfilt接受输入图像，处理所有过滤细节，并输出滤波后的结果以及修剪图像
%   classout的参数如下：
%   'original'    classout的默认值，输出图像与输入图像类型一样
%   'fltpoint' 输出图像是浮点类型，当f和H都是double类型时，输出图像也是double类型

%   将输入图像变换为浮点类型
[f,revertClass] = tofloat(f);

%   获取填充输入的FFT
F = fft2(f,size(H,1),size(H,2));

%   进行滤波后反变换
g = ifft2(H.*F);

%   裁剪到原来的大小
g = g(1:size(f,1),1:size(f,2));

%   如果classout有值，根据变量的值转换输出图像
if nargin == 2 || strcmp(classout,'original')
    g = revertClass(g);
elseif strcmp(classout,'fltpoint')
    return
else
    error('Undefined class for the output image.')
end