function [ b, c, d ] = my_spline( x, y )
%MY_SPLINE  
%   Using the algorithm on Textbook pg 147
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
end

% STEP 3
l=zeros(1, n);
l(1) = 1; 
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
c(n)=0;

% STEP 6
for j = (n-1):-1:1
   % display('j:');
   % display(n);
    c(j)=z(j)-(mu(j)*c(j+1));
    b(j)=(y(j+1)-y(j))/(h(j)-((h(j)*(c(j+1)+(2*c(j))))/3));
    d(j)=(c(j+1)-c(j))/(3*h(j));
end

% STEP 7
% Note that the cubic spline can be created using the following arrays of
% values. 
%display(x);% x(j)
display(y, 'a(j)');% a(j)
display(b, 'b(j)');% b(j)
display(c, 'c(j)');% c(j)
display(d, 'd(j)');% d(j)

% the following were used in debugging
% display(alpha);
% display(h);


return;

end
