function  auc = plot_roc2( predict, ground_truth )  
% INPUTS  
%  predict       - �������Բ��Լ��ķ�����  
%  ground_truth - ���Լ�����ȷ��ǩ,����ֻ���Ƕ����࣬��0��1  
% OUTPUTS  
%  auc            - ����ROC���ߵ������µ����  
  
%��ʼ��Ϊ��1.0, 1.0�� 
% neg_num1 = sum(ground_truth==0); 

%�����ground_truth������������Ŀpos_num�͸���������Ŀneg_num 
%���ȶ�predict�еķ��������ֵ���մ�С��������  
[predict,index] = sort(predict);  
ground_truth = ground_truth(index); 
len = size(predict);
pos_num = sum(ground_truth==1);  
neg_num = sum(ground_truth==0);  
%���ݸ���Ŀ���Լ������x�����y��Ĳ���  

x_step = 1.0/neg_num;  
y_step = 1.0/pos_num;  

%% %Ϊ�˸���������ROC���ߵ�����ֻȡ�Ҷ�ǰ100�����أ�AUC���ֻ����ǰ100������
%%
% ground_truth = ground_truth(len-199:end); 
neg_num1 = sum(ground_truth==0); 
y = 1.0; 
x = 1.0*neg_num1/neg_num; 
%��predict�е�ÿ�������ֱ��ж�������FP������TP  
%����ground_truth��Ԫ�أ�  
%��ground_truth[i]=1,��TP������1����y�᷽���½�y_step  
%��ground_truth[i]=0,��FP������1����x�᷽���½�x_step  
for i=1:length(ground_truth)  
    if ground_truth(i) == 1  
        y = y - y_step;  
    else  
        x = x - x_step;  
    end  
    X(i)=x;  
    Y(i)=y;  
end  
%% %����ͼ�� 

% figure('color','white');%Ҫ������ʾһ��ͼ���ROC����ʱ�������ע��
% plot(X,Y,'-r','LineWidth',2,'MarkerSize',3);  
% xlim([0,0.002]);%ֻ��ʾ0��0.001�ĺ�����
% ylim([0,1]);%ֻ��ʾ0��1��������
% xlabel('�龯��');  
% ylabel('�����');  
% title('ROC����ͼ');  
% hold on;

%% %����AUC���
%����С���ε����,����auc  
if all(Y==1)
    auc = NaN;
else 
    auc = -trapz(X,Y);
    auc = (1 - auc)*10000;
end       
end  