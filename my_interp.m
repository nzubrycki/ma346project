function [ output_args ] = my_interp( x, y )
%MY_INTERP 
%   Textbook page 124
% Calculates the Newton Interpolating Polynomial via the divided
% difference algorithm

if (length(x) ~= length(y) || length(x) <= 0)
    print('x and y must have an equal number of terms');
    return;
end

n=length(x);
f=zeros(1, n);

% STEP 1
for i = 1:n
    for j = 1:i
        f(i,j)=(f(i,j-1)-f(i-1,j-1))/(x(i)-x(i-j));
    end
end

% STEP 2
display(f);

return

end

