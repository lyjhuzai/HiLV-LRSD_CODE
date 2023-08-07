function  auc = plot_roc2( predict, ground_truth )  
% INPUTS  
%  predict       - 分类器对测试集的分类结果  
%  ground_truth - 测试集的正确标签,这里只考虑二分类，即0和1  
% OUTPUTS  
%  auc            - 返回ROC曲线的曲线下的面积  
  
%初始点为（1.0, 1.0） 
% neg_num1 = sum(ground_truth==0); 

%计算出ground_truth中正样本的数目pos_num和负样本的数目neg_num 
%首先对predict中的分类器输出值按照从小到大排列  
[predict,index] = sort(predict);  
ground_truth = ground_truth(index); 
len = size(predict);
pos_num = sum(ground_truth==1);  
neg_num = sum(ground_truth==0);  
%根据该数目可以计算出沿x轴或者y轴的步长  

x_step = 1.0/neg_num;  
y_step = 1.0/pos_num;  

%% %为了更清晰看出ROC曲线的优劣只取灰度前100的像素，AUC面积只计算前100个像素
%%
% ground_truth = ground_truth(len-199:end); 
neg_num1 = sum(ground_truth==0); 
y = 1.0; 
x = 1.0*neg_num1/neg_num; 
%对predict中的每个样本分别判断他们是FP或者是TP  
%遍历ground_truth的元素，  
%若ground_truth[i]=1,则TP减少了1，往y轴方向下降y_step  
%若ground_truth[i]=0,则FP减少了1，往x轴方向下降x_step  
for i=1:length(ground_truth)  
    if ground_truth(i) == 1  
        y = y - y_step;  
    else  
        x = x - x_step;  
    end  
    X(i)=x;  
    Y(i)=y;  
end  
%% %画出图像 

% figure('color','white');%要单独显示一张图像的ROC曲线时解除本行注释
% plot(X,Y,'-r','LineWidth',2,'MarkerSize',3);  
% xlim([0,0.002]);%只显示0到0.001的横坐标
% ylim([0,1]);%只显示0到1的纵坐标
% xlabel('虚警率');  
% ylabel('检测率');  
% title('ROC曲线图');  
% hold on;

%% %计算AUC面积
%计算小矩形的面积,返回auc  
if all(Y==1)
    auc = NaN;
else 
    auc = -trapz(X,Y);
    auc = (1 - auc)*10000;
end       
end  