%-------------------------------------------%
%tofloat函数
function [out,revertclass] = tofloat(in)
%tofloat将图像转换成floating point

identity = @(x) x;
tosingle = @im2single;
table = {'uint8',  tosingle, @im2uint8
    'uint16',  tosingle, @im2uint16
    'int16',  tosingle, @im2int16
    'logical',  tosingle, @logical
    'double',  identity, identity
    'single',  identity, identity};
classIndex = find(strcmp(class(in),table(:,1)));
if isempty(classIndex)
    error('Unsupported input image class');
end

out = table{classIndex,2}(in);
revertclass = table{classIndex,3};
%-----------------------------------------------%

