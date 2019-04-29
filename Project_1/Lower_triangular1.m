function [x]=Lower_triangular1(A,b)
% [x]=Lower_triangular1(A,b)
% x is the solution of Ax=b, where A is lower triangular

[m,n]= size(A);
x=zeros(n,1);

if m~=n,
    disp('m should be equal to n');
    return;
end

if norm(A-tril(A),'fro')>0
    disp('A is not lower triangular!');
    return;
end

d=diag(A);

if ~all(d),
    disp('Diagonal element of A  equals  0');
    return;
end

x(1)=b(1)/A(1,1);

for i=2:n,
    s=b(i);
    for j=1:i-1,
        s=s-A(i,j)*x(j);
    end
    x(i)=s/A(i,i);
end
end
