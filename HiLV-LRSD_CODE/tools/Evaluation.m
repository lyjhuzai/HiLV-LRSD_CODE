%% This code implements the evaluation of the performance of the Infrared Small Target Detection algorithm
function [TR,TPR,FPR,A_BSF,A_SCRG,F,AUC,TRN,N]=Evaluation(E,I,filename)
if size(strfind(filename, '.'),2) == 0
name =filename;
else
name = extractBefore(filename,'.');
end
%% %SIRST
strDir1 = ['..\SIRST\label\',name,'_x_cordinates.xlsx'];
strDir2 = ['..\SIRST\label\',name,'_y_cordinates.xlsx'];
%% %Get the number of real small targets
[Type Sheet Format]=xlsfinfo(strDir1);
sheet_num=size(Sheet,2);
%% %Initialization parameters
e=0.0000000001;
E_0=double(E)+e;
TPN = 0;
TN = 0;
[m,n]=size(E);
im = cat(3,E,E,E);
SY=zeros(m,n);
predict =  E;
TTN = 0;
sum_BSF = 0;
sum_SCRG = 0;
%% %Evaluate each target separately
for z = 1:sheet_num
    a=strcat('sheet',num2str(z));
    x=xlsread(strDir1,a);
    y=xlsread(strDir2,a);
    TTN = TTN + size(x,1);
    %% % Mark the target, the green box represents detected, the red box represents not detected
    [L,num] = bwlabel(E,8);
    sgn_L = 0;
    for i = 1:size(x,1)
       if E(y(i),x(i))>0
           if sgn_L(end) > 0 && sgn_L(end) ~= L(y(i),x(i))
               sgn_L = [sgn_L,L(y(i),x(i))];
           else
               sgn_L(end) = L(y(i),x(i));  
           end
       end
    end
    row = [];
    col = [];
    if sgn_L ~= 0
        for i = 1:size(sgn_L,2)
            [row1,col1]=find(L == sgn_L(i));
            row = [row',row1']';
            col = [col',col1']';
        end
    end
    T=zeros(size(row,1),1);
    if sgn_L ~= 0
        for i = 1:size(row,1)
            SY(row(i),col(i))=1;  
            T(i) = E(row(i),col(i));
        end
    end
    if isempty(T)
        T = 0;
    end
    if sum(T(:))~=0
        im = redrectangle_1(im,fix(median(x)),fix(median(y)),1);
        TPN=TPN+1;
    else
        im = redrectangle_1(im,fix(median(x)),fix(median(y)),0);
        TPN=TPN+0;
    end
    imshow(im);
    %% %SCRG
    r  = 15;

    b1 = max(fix(median(y))-r,1);
    b2 = min((fix(median(y))+r-1),m);
    b3 = max(fix(median(x))-r,1);
    b4 = min((fix(median(x)))+r-1,n);

    I0=I;
    e1 = 0.000001;
    T0=double(zeros(size(x,1),1))+e;
    for i = 1:size(x,1)
       T0(i) = I(y(i),x(i));
       I0(y(i),x(i)) = 0;
       if E_0(y(i),x(i))>e
           TN = TN +1;
       end
    end
    B0=I0(b1:b2,b3:b4);
    B0 = B0((B0>0));
    gB0 = mean(B0(:));
    SCR_1 = abs(double((mean(T0(:)))-gB0))/double(std2(B0)+e1);
    for i = 1:size(row,1)
        E_0(row(i),col(i)) = 0;
    end
    B1=E_0(b1:b2,b3:b4);
    B1 = B1((B1>0));
    gB1 = mean(B1(:));
    SCR_2 = abs(double((mean(T(:)))-gB1))/double(std2(B1)+e1);
    SCRG = SCR_2/SCR_1;
    %% %BSF
    BSF = std2(B0)/(std2(B1)+e1);

    sum_BSF = sum_BSF + BSF;
    sum_SCRG = sum_SCRG + SCRG;
end
%% Calculate the average BSF and SCRG
A_SCRG = sum_SCRG/sheet_num;
A_BSF  = sum_BSF/sheet_num;
fprintf('A_BSF=%d\n', A_BSF)
fprintf('A_SCRG=%d\n', A_SCRG)
%% %F, FPR and TPR
F=sum(E_0(:)>=1);
disp('The number of false alarm noise pixels is£º');
disp(F);
disp('The average number of false alarm noise pixels per target is£º');
disp(F/TPN);
TPR=TPN/sheet_num;
FPR=F/(m*n-size(T(:),1));
TR=TN/TTN;
fprintf('FPR=%d\n', FPR)
fprintf('TPR=%d\n', TPR)
fprintf('TR=%d\n', TR)

%% %ROC cruve and AUC
ground_truth = SY(:);
predict = predict(:);
AUC = plot_roc2(predict,ground_truth); 
fprintf('AUC=%d\n', AUC)
%% %Save some parameters
TRN=TPN;
N=sheet_num;
