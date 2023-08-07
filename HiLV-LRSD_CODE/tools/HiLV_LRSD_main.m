function [A_hat, E_hat, Iterations] = HiLV_LRSD_main(I, opt)
if size(I, 3) == 3
    I = rgb2gray(I);
end
[m, n] = size(I);
dw = opt.dw;
dh = opt.dh;
x_step = opt.x_step;
y_step = opt.y_step;
C = zeros(m, n);
I1 = I ; 
D = [];
i=1;
%% Construction
while i <= m-dh+1
    j=1;
    while j <= n-dw+1
        temp = I1(i:i+dh-1, j:j+dw-1);
        D = [D, temp(:)];

        if j + x_step>n-dw+1  && j ~= n-dw+1
           j = n-dw+1;
        else
            j = j+x_step;
        end
    end
    if i+y_step>m-dh+1 && i ~= m-dh+1
        i = m-dh+1;
    else
        i = i+y_step;
    end
end
D = mat2gray(D);
%% IR_ADMM
lambda = 1/ sqrt(max(m, n));
[A1, E1, Iterations] = IR_ADMM(D, lambda);
AA = zeros(m, n, 50);
EE = zeros(m, n, 50);
temp = zeros(dh, dw);
temp1 = zeros(dh, dw);

index = 0;
e=0.00000000000000000000001;


%% Reconstruction
i =1;
while i <= m-dh+1
    j=1;
    while j <= n-dw+1
        index = 1+index;
        temp(:) = A1(:, index);
        C(i:i+dh-1, j:j+dw-1) = C(i:i+dh-1, j:j+dw-1)+1;
        temp1(:) = E1(:, index);
        for ii = i:i+dh-1
            for jj = j:j+dw-1
                AA(ii,jj, C(ii,jj)) = temp(ii-i+1, jj-j+1)+e;
                EE(ii,jj, C(ii,jj)) = temp1(ii-i+1, jj-j+1)+e;
            end
        end
        if j + x_step>n-dw+1  && j ~= n-dw+1
           j = n-dw+1;
        else
            j = j+x_step;
        end
    end
    if i+y_step>m-dh+1 && i ~= m-dh+1
        i = m-dh+1;
    else
        i = i+y_step;
    end
end

AA(AA==0)=NaN;
EE(EE==0)=NaN;
A_hat = nanmedian(AA,3);
E_hat = nanmedian(EE,3);
E_hat(isnan(E_hat)==1) = 0;