function [L, U]=Doolittle(A)
%function for Doolittle's method for LU-decomposition
clc
[n, m]=size(A);
if(n~=m)
    disp('Error! Matrix sizes are not equal')
    return 
end
L=zeros(size(A));
U=zeros(size(A));
for i=1:n
    %upper
    for k=i:n
        sum=0;
        for j=1:i-1
            sum = sum + L(i,j)*U(j,k);
        end
        U(i,k) = A(i,k) - sum;
    end
    %lower
    for k=i:n
        if(i==k)
            L(i,i)=1;
        else
            sum=0;
            for j=1:i-1
                sum = sum + L(k,j)*U(j,i);
            end
            if(U(i,i)==0)
                disp('Error! Division by 0')
                return 
            end
            L(k,i) = (A(k,i)-sum)/U(i,i);
        end
    end
end
end