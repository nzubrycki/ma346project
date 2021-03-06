function [ result ] = averageTemp()

    a = [58, 59, 59, 58, 57, 58, 57, 58, 60, 64, 63, 68];
    b = [0.8265, 0, -0.6804, -1.8487, 2.7280, -0.5018, -2.9601, 5.5792, 4.4252, -0.3305, -1.6626, 0];
    c = [0, -0.6299, -0.4804, -0.4484, 2.2741, -2.6478, 2.3172, -0.6209, 3.1663, -6.0443, 6.0111, 0];
    d = [-0.2100, 0.0498, 0.0107, 0.9075, -1.6406, 1.6550, -0.9793, 1.2624, -3.0702, 4.0185, -2.0037, 0];
    
for i = 1:12
    p = [d(i) c(i) b(i) a(i)]; 
    q = polyint(p);
    %display(q);
    integrals(i) = diff(polyval(q, [i (i+1)]));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here I changed the integral function so that it computes the spline only
% on the interval for which each spline is defined. The average is now
% closer to what it should be (Was 75, is now 72). I think the remaining
% error is from the computation using only x instead of (x-xi).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    result = (1/11)*sum(integrals);
    display(result);

end

