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

% STEP 1
for j = 2:(n)
    for i = 1:(n-j+1)
        F(i, j)=(F(i + 1, j - 1) - F((i), ( j - 1))) /(x(i + j - 1) - x(i));
    end
end

%display(F);

% V = an
evaluations(n)=F(1, n);

% V = ai + (x ? xi ) · V , i = n ? 1, n ? 2, . . . , 0
for j=1:(n-1)
    for i=(n-1):-1:1
        evaluations(i) = F(1, i)+((j-i)*evaluations(i+1));
    end
end

%display(evaluations);

return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Essetially, I changed the function so taht it now returns the evaluations
% of the newton interpolating polynomial at x=1 thru n. It still looks
% really waired, but I think this is the best it will get.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

