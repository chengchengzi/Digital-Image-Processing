function g = intrans(f,method,varargin)
%intrans函数是自定义的灰度变换函数，可实现：负片变换、对数变换、伽马变换、对比拉伸
% g = intrans(f,'neg')实现图像f的负片变换
%
% g = intrans(f,'log',c,class) 对数变换，计算连续的c * log(1 + f) 和 乘上结果。
% 如果后两个参数为写，则c默认是1. 输出的class和出入的一样
%
% g = intrans(f,'gamma',gam)在使用参数gam的输入图像上执行参数gamma的变换
% 也就伽马变换，若gamma < 1,则映射被加权至较高的输出值，若gamma > 1, 则映射
% 被加权至较低的输出值，若gamma = 1，则为线性映射
% 
% g = intrans(f,'stretch',m,e)对比拉伸变换，使用表达式1./(1 + m./f).^e)计算
% 变换.参数m范围是[0,1],m的默认值是mean2(tofloat(f)),e的默认值是4.
%
% 检验输入的参数数量是否正确
narginchk(2,4)

if strcmp(method,'log')
    %对数变换需要返回一个对数变换功能的函数句柄
    g = logTransform(f,varargin{:});
    return;
end

if isfloat(f) && (max(f(:)) > 1 || min(f(:)) < 0)
    %如果f是float point,就检查是否在[0,1]内，不在则使用mat2gray函数
    f = mat2gray(f);
end
[f,revertclass] = tofloat(f); %存储class f以便后续使用，revertclass是函数句柄

switch method
    case 'neg'
        g = imcomplement(f);
    case 'gamma'
        g = gammaTransform(f,varargin{:});  %varargin是可变输入参量
    case 'stretch'
        g = stretchTransform(f,varargin{:});
    case 'specified'
        g = specifiedTransform(f,varargin{:});
    otherwise 
        error('Unknown enhancement method')
end

%转换成输入图像class
g = revertclass(g);



%-----------------------------------------------------%
%伽马变换
function g = gammaTransform(f,gamma)
g = imadjust(f,[ ],[ ],gamma);
%-----------------------------------------------------%

%-----------------------------------------------------%
%对比拉伸变换
function g = stretchTransform(f,varargin)
if isempty(varargin)
    m =mean2(f);
    E = 4.0;
elseif length(varargin) == 2
    m = varargin{1};
    E = varargin{2};
else
    error('Incorrect number of input the stretch method')
end
g = 1./(1 + (m./f).^E);
%-----------------------------------------------------%

%------------------------------------------------------%
function g = logTransform(f,varargin)
[f,revertclass] = tofloat(f);
if numel(varargin) >= 2
    if strcmp(varargin{2},'uint8')
        revertclass = @im2unit8;
    elseif strcmp(varargin{2},'uint16')
        revertclass = @im2uint16;
    else
        error('Unsupported CLASS option for log method')
    end
end
if numel(varargin) < 1
    C = 1;
else
    C = varargin{1};
end
g = C * (log(1 + f));
g = revertclass(g);



