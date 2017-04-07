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
for i=1:(n)
    F(i,1)=y(i);
end
%display('F:');
%display(F);

% STEP 1
for i = 2:(n)
    for j = 2:(i-1)
        F(i, j)=(y(i)-y(i-j))/(x(i)-x(i-j));
    end
end

% STEP 2
display(F);

return;

end

