function [ evaluations ] = my_interp( x, y )
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
F(:, 1) = y';
%display('F:');
%display(F);

% STEP 1
for j = 2:(n)
    for i = 1:(n-j+1)
        F(i, j)=(F(i + 1, j - 1) - F((i), ( j - 1))) /(x(i + j - 1) - x(i));
    end
end

evaluations(n)=F(n, 1);
for i=(n-1):-1:1
    for j=1:n
        evaluations(i) = F(n, 1)+((j-i)*evaluations(i+1));
    end
end

display(evaluations);

return;

end

