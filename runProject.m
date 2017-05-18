% Nicholas Zubrycki
% MA 346
% Project 1
% I pledge my honor that I have abided by the Stevens Honor System.

time = 1:12;
degrees = [58, 59, 59, 58, 57, 58, 57, 58, 60, 64, 63, 68];

% my implementation of the cubic spline
mySpline = my_spline(time, degrees);

% my implementation of the Newton Interpolating Polynomial
myNewton = my_interp(time, degrees);

% plot of the time (as x) vs the degrees (as y)
plot(time, degrees, 'o', time, myNewton, '-', time, mySpline, '-.b');
legend('Data', 'Newton', 'Spline', 'Location', 'northwest');

% Average Temperature calculation
averageTemperature = averageTemp();