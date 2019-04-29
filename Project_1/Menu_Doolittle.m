% MENU
clear
clc
finish=7;  
control=1;

%default data %
A=[1,-3,2;-3,10,-5;2,-5,6];
b=[3;-8;8];

while control~=finish 

    control=menu('Menu', 'Input matrix A', 'Input vactor b',...
                 'Display variables','Calculate determinant of A',...
                 'Compute Ax=b', 'Calculate Errors', 'FINISH');

    switch control
        case 1
            A=input('A=');

        case 2
            b=input('b=');

        case 3
            disp('A=');disp(A)
            disp('b=');disp(b)

        case 4
            [L, U] = Doolittle(A);
            u = diag(U);
            det_A = prod(u);
            disp('Determinant of A=');disp(det_A)
            
        case 5
            [L, U] = Doolittle(A);
            y=Lower_triangular1(L,b);
            x=Upper_triangular1(U,y);
            disp('x=');disp(x)

        case 6
            DoolittleErrors;
            
        case 7
            disp('FINISH')
    end
end
