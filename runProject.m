% Nicholas Zubrycki
% MA 346
% Project 1
% I pledge my honor that I have abided by the Stevens Honor System.

time = 1:12;
degrees = [58, 59, 59, 58, 57, 58, 57, 58, 60, 64, 63, 68];
%yList = [y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12];

% calculation of the real spline
realSpline = spline(time, degrees);
display(realSpline);

% my implementation of the cubic spline
mySpline = my_spline(time, degrees);

% calculation of the Newton Interpolating polynomial  
realNewton = intrplon(time, degrees, 12, 'linear');
display(realNewton);

% my implementation of the Newton Interpolating Polynomial
%myNewton = my_interp(time, degrees);

% plot of the time (as x) vs the degrees (as y)
plot(time, degrees);