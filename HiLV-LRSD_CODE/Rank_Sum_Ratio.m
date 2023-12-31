clc,clear
%% 总实验Ⅲ
% data=[0.896	67.00	1.000	10.65
%    0.763	50.00	0.878	10.37
%    0.934	17.00	0.991	1.968
%    0.543	2278	0.914	1194
%    0.719	107.0	0.929	8.663
%    0.537	0.319	0.916	0.225
%    0.471	1.099	0.985	0.315
%    0.567	4.134	0.996	0.421
%    0.733	1.094	0.929	0.372
%    0.800	654.0	0.921	303.2
%    0.872    1.634   1.000   0.378];
%% 实验IV
%% a
% data=[1 1   1.000 96.00 70.17
%       0 0   0.000 4.354 0.000
%       1 1   1.000 4.679 1.851
%       1 0.9 1.000 0.323 0.269
%       1 1   0.714 0.000 0.161
%       1 1   1.000 1.774 0.581
%       0 0   0.000 2.258 0.000
%       1 1   1.000 0.484 0.176];
%% b
% data=[1   1   1.000 90.89 46.14
%       0   0   0.000 5.757 0.000
%       0   0   0.000 0.000 0.000
%       0.8 0.5 0.857 9.100 0.217
%       1   1   0.857 1.672 0.310
%       1   1   1.000 29.16 0.716
%       1   1   1.000 21.18 4.992
%       1   1   1.000 0.557 0.248];
%% c
% data=[0.6 0.6 1.000 90.66 7.174
%       1   1   1.000 62.49 6.313
%       1   1   0.925 28.76 4.590
%       1   0.9 0.750 1.053 0.201
%       1   1   0.050 2.106 1.053
%       1   1   0.325 5.117 0.833
%       0   0   0.000 1.849 0.000
%       1   1   0.600 0.301 0.157];
%% d
% data=[1   1   1.000 41.04 32.18
%       1   1   1.000 122.7 30.51
%       1   1   1.000 28.67 6.738
%       1   0.9 0.900 7.552 0.959
%       0   0   0.000 0.000 0.000
%       1   1   0.100 0.462 0.616
%       0   0   0.000 1.849 0.000
%       1   1   1.000 0.154 0.168];
%% e
% data=[0.5 0.5 1.000 50.89 0.834
%       0   0   0.000 0.000 0.000
%       0.5 0.5 0.731 39.61 17.55
%       1   0.9 0.577 52.43 8.861
%       0   0   0.000 3.418 0.000
%       1   1   0.231 1.709 1.092
%       0   0   0.000 2.563 0.000
%       1   1   0.385 0.285 0.142];
%% f
% data=[1   1   1.000 90.46 8.446
%       1   1   0.690 1.153 0.179
%       1   1   0.966 23.93 4.341
%       1   0.9 0.241 1.441 0.330
%       0   0   0.000 0.000 0.000
%       1   1   0.172 1.441 1.384
%       1   1   0.931 1.730 0.786
%       1   1   0.483 0.000 0.144];
%% 实验V
% data=[0.784 0.438 0.977 0.252
%       0.840 0.717 0.991 0.263
%       0.872 1.634 1.000 0.378
%       0.895 5.528 1.000 0.808
%       0.884 12.00 0.998 2.073
%       0.888 4.179 0.992 0.678
%       0.894 3.290 0.998 0.593
%       0.848 0.972 0.989 0.321
%       0.804 0.637 0.987 0.274];
%% 实验VI
% data=[1.000 4700  1.000 1166
%       0.970 24.70 1.000 71.47
%       0.924 7.200 1.000 1.307
%       0.872 1.634 1.000 0.378
%       0.801 0.550 0.987 0.248
%       0.610 0.204 0.908 0.194
%       0.413 0.215 0.773 0.179
%       0.274 0.451 0.585 0.227];
%% 实验VII
% data=[0.947 9.937 1.000 1.342
%       0.917 3.880 1.000 0.633
%       0.872 1.634 1.000 0.378
%       0.820 7.302 0.987 0.270
%       0.766 0.361 0.976 0.218
%       0.347 1.067 0.692 0.168
%       0.780 0.433 0.979 0.226
%       0.925 4.870 1.000 0.717
%       0.965 23.00 1.000 3.366];
%% 实验VIII
% data=[0.803    0.518   0.991   0.251   28.46
%       0.855    1.182   0.996   0.330   14.57
%       0.868    1.463   0.998   0.360   13.66
%       0.872    1.634   1.000   0.378   13.30
%       0.875    1.860   1.000   0.435   12.82
%       0.869    2.119   0.998   0.397   12.26
%       0.853    2.293   0.992   0.423   11.59
%       0.793    2.205   0.977   0.431   10.53];
%% 实验IX
% data=[0.627    0.129   0.927   0.188   50.00
%       0.683    0.192   0.968   0.217   60.09
%       0.803    0.518   0.991   0.251   28.46
%       0.872    1.634   1.000   0.378   13.30];
%% 实验X
% data=[0.67     5.5     0.995   1.036
%       0.872    1.634   1.000   0.378];
%% 噪声实验Ⅺ
% data=[0.873 90.00 0.994 13.2
%       0.540 9.454 0.827 1.984
%       0.681 12.00 0.976 1.522
%       0.135 0.013 0.694 0.164
%       0.217 1.392 0.694 0.464
%       0.263 2.121 0.863 0.304
%       0.700 3.311 0.944 1.112
%       0.600 3.055 0.955 0.634];%0.001
%  data=[0.848 91.00 0.991 15.09
%       0.430 6.670 0.779 1.461
%       0.550 15.00 0.959 2.330
%       0.075 0.006 0.531 0.164
%       0.086 1.651 0.405 0.718
%       0.184 2.152 0.764 0.384
%       0.658 9.691 0.937 3.739
%       0.501 5.830 0.938 1.330];%0.002
 data=[0.737 93.00 0.972 18.97
      0.264 4.21 0.685 1.105
      0.365 18.00 0.878 3.670
      0.026 0.002 0.289 0.168
      0.006 0.651 0.045 0.857
      0.095 2.370 0.585 0.474
      0.552 32.01 0.916 13.90
      0.364 14.00 0.869 3.222];%0.005

%% 手动设置权值，处理成本型和效益型数据
%%
data(:,[2,4]) = -data(:,[2,4]);%数据预处理，将成本型指标转换为效益性
weight = [0.25 0.15 0.35 0.25];%各指标的权重
%%
% data(:,[2,4,5]) = -data(:,[2,4,5]);%实验VIII，IX
% weight = [0.2 0.15 0.25 0.2 0.2];%各指标的权重
%%
% data(:,[4,5]) = -data(:,[4,5]);%实验IV
% weight = [0.15 0.15 0.25 0.2 0.25];%各指标的权重
%%
ra = tiedrank(data)%编秩，即对每个指标各自进行排序
[row,col] = size(data);% 获取数据的维度信息
RSR = mean(ra, 2)/row;% 计算秩合比
W = repmat(weight, [row,1]);
WRSR = sum(ra.*W, 2)/row;%计算加权秩和比
[sWRSR, ind] = sort(WRSR);%对加权秩合比排序

p = [1:row] / row; %计算累计频率
p(end) = 1 - 1 / (4 * row) %修正最后一个累计频率，最后一个累计频率按1-1/（4n）估计
probit = norminv(p,0,1) + 5 % 计算标准正太分布的p分位数+5


x = [ones(row,1),probit'];% 构造一元线性回归分析的数据矩阵
[ab, abint, r, rint, stats] = regress(sWRSR,x)
WRSRfit = ab(1) + ab(2) * probit; % 计算WRSR的估计值
WRSRfit'
y = [1:11];
y(ind)'


