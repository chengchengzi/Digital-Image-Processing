# 《Digital Image Processing Using MATLAB Second Edition》

	冈萨雷斯《数字图像处理matlab版》第二版 

	为了学习基本的图像处理知识，将本书与《Digital Image Processing，Third Edition》结合学习使用

	选学了其中的数字图像基础、灰度变换与空间滤波、频率域滤波以及图像分割等章节

	以下是数字图像处理的一些matlab程序

## Compiler

	* Win 10
	* matlab2014  

### Contents 

- Chpter 01  绪言
	
	- [图像的输入输出和显示](CH01/function_image_input_output_show.m)


- Chpter 02  灰度变换与空间滤波

	- [灰度变换函数imadjust和stretchlim](CH02/fun_imadjust.m)
	- [用于灰度变换的实用M函数](CH02/intrans.m)
		- 负片变换
		- 对数变换
		- 伽马变换
		- 对比拉伸变换
	- [直方图均衡](CH02/demo_histeq.m)
	- [直方图匹配](CH02/manualhist.m)
	- [线性空间滤波](CH02/demo_imfilter.m)
	- [使用拉普拉斯滤波器滤波](CH02/demo_fpspecial.m)

- Chpter 03 频率域滤波

	- [填充函数](CH03/paddedsize.m)
	- [低通滤波器](CH03/lpfilter.m)
	- [高通滤波器](CH03/hpfilter.m)
	- [滤波函数](CH03/dftfilt.m)
	- [例子：高斯低通滤波器滤波&高斯高通滤波器滤波](CH03/demo_guassian_lowpass&highpass_filter.m)

- Chpter 07 图像分割

	- [例子：使用霍夫变换进行线检测](CH07/demo_hough.m)
	- 阈值处理
		- [例子：基本全局阈值处理](CH07/demo_global_thresh.m)
		- [基于局部统计的可变阈值处理](CH07/localthresh.m)
		- [使用移动平均的图像阈值处理](CH07/movingthresh.m)
	- 基于区域的分割
		- [区域生长](CH07/regiongrow.m)
		- [区域分离与聚合](CH07/splitmerge.m)
	- [例子:使用分水岭变换的分割](CH07/demo_watershed.m)


	
