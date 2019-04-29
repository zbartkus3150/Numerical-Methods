function DoolittleErrors
%Doolittle algorythm Error check
clear
clc
in = input('Choose example(1 - pascal(10), 2 - pascal(15)',...
    'or 3 - hilb(10))');
if(in==1)
    %Example 1
    A=pascal(10);
    z=10*ones(10,1);
elseif(in==2)
    %Example 2
    A=pascal(15);
    z=15*ones(15,1);
else
    %Example3
    A=hilb(10);
    z=ones(10,1);
end

b=A*z;
[L, U] = Doolittle(A);
y=Lower_triangular1(L,b);
x=Upper_triangular1(U,y);

if(eps*cond(A) > 1)
    disp('eps*cond(A) > 1')
    return
end
e1=norm(x-z)/norm(z);
e2=norm(x-z)/(norm(z)*cond(A));
e3=norm(b-A*x)/(norm(A)*norm(x));
disp('relative error =');disp(e1)
disp('forward stability error =');disp(e2)
disp('backward stability error =');disp(e3)
end