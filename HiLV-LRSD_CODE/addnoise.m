clc;
clear;
close all;
addpath('tools');
addpath('tools\PROPACK');
strDir = '..\SIRST\images\';%the root of SIRST dataset
strDir1 = '..\SIRST\images\images0.01\';%results' root
files = dir(strcat(strDir,'*.png'));
img_num = length(files);%��ȡͼ�������� 
for i=1:img_num
    image_name = strcat('Misc_',num2str(i),'.png');% ͼ����
    I = imread([strDir image_name]);
    fprintf('%d %d %s\n',img_num,i,strcat(strDir,image_name));% ��ʾ���ڴ����ͼ����
    I=I(:,:,1);%.bmp�ļ�ʹ��
    I=imnoise(I, 'gaussian', 0, 0.01);%��Ӹ�˹����
    imwrite(I, [strDir1 image_name]);
end