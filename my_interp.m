function [ F ] = my_interp( x, y )
%MY_INTERP 
%  Using the algorithm on Textbook page 124
% Calculates the Newton Interpolating Polynomial via the divided
% difference algorithm

if (length(x) ~= length(y) || length(x) <= 0)
    print('x and y must have an equal number of terms');
    return;
end

n=length(x);
F=zeros(n, n);

% establish first column of matrix 
% where f(xo), f(x1)...f(xn) = F0,0 , F1,0 ...Fn,0
for i=1:(n)
    F(i,1)=y(i);
end
%display('F:');
%display(F);

% STEP 1
for i = 2:(n)
    for j = 2:(i-1)
        F(i, j)=(F(i, (j-1))-F((i-1), (j-1)))/(x(i)-x(i-j));
    end
end

% STEP 2
for i=1:n
    display(F(i,i), 'Fi,j');
end

return;

end

