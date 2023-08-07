clc;
clear;
close all;
addpath('tools');
addpath('tools\PROPACK');
strDir = '..\SIRST\images\';%the root of SIRST dataset
strDir1 = '..\SIRST\images\images0.01\';%results' root
files = dir(strcat(strDir,'*.png'));
img_num = length(files);%获取图像总数量 
for i=1:img_num
    image_name = strcat('Misc_',num2str(i),'.png');% 图像名
    I = imread([strDir image_name]);
    fprintf('%d %d %s\n',img_num,i,strcat(strDir,image_name));% 显示正在处理的图像名
    I=I(:,:,1);%.bmp文件使用
    I=imnoise(I, 'gaussian', 0, 0.01);%添加高斯噪声
    imwrite(I, [strDir1 image_name]);
end