function X_kp1_E=WL1(G_k_E,C,oureps,lambda)
[m,n]=size(G_k_E);
X_kp1_E=zeros(m,n);
for i=1:m
    for j=1:n   
        X_kp1_E(i,j)=G_k_E(i,j)-lambda*C/(G_k_E(i,j)+oureps);
    end
end
end