%% This code is an implementation of HiLV-LRSD model for Infrared Small Target Dection
clc;
clear;
close all;
addpath('tools');
addpath('tools\PROPACK');
strDir = '..\SIRST\images\';%the root of SIRST dataset
% strDir = '..\SIRST\images0.005\';%the root of SIRST dataset (added noise)
strDir1 = 'results\';%results' root
%% Sliding window parameter settings
opt.dw = 45;
opt.dh = 45;
opt.x_step = 20;
opt.y_step = 20;
%% %Get all images in the dataset
files = dir(strcat(strDir,'*.png'));
%% %Get part images in the dataset
% files = {'Misc_1'};
%% %Initialization of evaluation parameters
img_num = length(files);
TR = zeros(img_num,1);
TPR = zeros(img_num,1);
FPR = zeros(img_num,1);
BSF = zeros(img_num,1);
SCRG = zeros(img_num,1);
F = zeros(img_num,1);
AUC = zeros(img_num,1);
Iterations = zeros(img_num,1);
TRN = zeros(img_num,1);
N = zeros(img_num,1);
%% %

for i=1:img_num
    
    %% %All images' image_name set
    image_name = strcat('Misc_',num2str(i),'.png');% image name 
    %% %Part images' image_name set
%     image_name = strcat(files{i},'.png');% image name 
    %% %Read image
    I = imread([strDir image_name]);
    fprintf('%d %d %s\n',img_num,i,strcat(strDir,image_name));
    I=I(:,:,1);
    maxv = max(max(double(I)));
    %% %The part of the LRLVSD model
    tic;
    [A, E, Iterations(i)] = HiLV_LRSD_main(I, opt);
    A = uint8( mat2gray(A) * maxv );
    E = uint8( mat2gray(E) * 255 );
    toc;
    %% %Show results
%     hold on;
%     p = strcat('Image-',num2str(k));
%     subplot(3, length(files), k), imshow(I), title(p);
%     if k==1
%         ylabel('Original Image');
%     end
%     subplot(3, length(files), length(files)+k), imshow(A);
%     if k==1
%         ylabel('Background Image');
%     end
%     subplot(3, length(files), 2*length(files)+k), imshow(E,[]) ;
%     if k==1
%         ylabel('Target Image');
%     end
%     figure;
%     Draw3DGrayGraph(E, 0);
    %% %Evaluation
    filename = image_name;
%     figure;
    [TR(i),TPR(i),FPR(i),BSF(i),SCRG(i),F(i),AUC(i),TRN(i),N(i)]=Evaluation(E,I,filename);
    %% %save into files
    imwrite(E, [strDir1 'T/' image_name]);
    imwrite(A, [strDir1 'B/' image_name]);
end
%% %Show Evaluation results
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
fprintf('Display results');
AUC(AUC==0)=NaN;
AUC = nanmean(AUC);
fprintf('AUC=%d\n', AUC);
fprintf('TR=%d\n', mean(TR));
fprintf('TPR=%d\n', sum(TRN)/sum(N));
fprintf('FPR=%d\n', mean(FPR));
fprintf('A-iter=%d\n', mean(Iterations));
