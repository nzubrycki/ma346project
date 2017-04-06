function [ b, c, d ] = my_spline( x, y )
%MY_SPLINE  
%   Textbook pg 147
% Calculates the natural cubic spline

% error checking
if (length(x) ~= length(y) || length(x) <= 0)
    print('x and y must have an equal number of terms');
    return;
end

n = length(x);
alpha=zeros(1, n);
h=zeros(1, n);

% STEP 1
for i = 1:(n-1)
    h(i)=(x(i+1)-x(i));
end

%STEP 2
for i = 2:(n-1)
    alpha(i)=((3/(h(i)))*(y(i+1)-y(i))) - ((3/h(i-1))*(y(i)-y(i-1)));
    % I think I read the algorithm wrong, instead of some of these being
    % alpha, they may be a's which are the values of the function
    % CHECK => change alpha to y
end

% STEP 3
l=zeros(1, n);
mu=zeros(1, n);
z=zeros(1, n);

%STEP 4
for i = 2:(n-1)
    l(i)=2*(x(i+1)-x(i-1)) - h(i-1)*mu(i-1);
    mu(i)= h(i)/l(i);
    z(i)=(alpha(i)-(h(i-1)*z(i-1)))/l(i);
end

% STEP 5
l(n)=1;
z(n)=0;
c=zeros(1, n);
b=zeros(1, n);
d=zeros(1, n);

% STEP 6
for j = (n-1):1
    c(j)=z(j)-(mu(j)*c(j+1));
    b(j)=(y(j+1)-y(j))/h(j)-(h(j)*(c(j+1)+(2*c(j))))/3;
    d(j)=(c(j+1)-c(j))/(3*h(j));
end

% STEP 7
display(b);
display(c);
display(d);
display(alpha);
display(h);

return;

end