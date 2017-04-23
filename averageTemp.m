function [ result ] = averageTemp()

    a = [58, 59, 59, 58, 57, 58, 57, 58, 60, 64, 63, 68];
    b = [0, 0.8265, 0, -0.6804, -1.8487, 2.7280, -0.5018, -2.9601, 5.5792, 4.4252, -0.3305, -1.6626];
    c = [0, -0.6299, -0.4804, -0.4484, 2.2741, -2.6478, 2.3172, -0.6209, 3.1663, -6.0443, 6.0111, 0];
    d = [0, -0.2100, 0.0498, 0.0107, 0.9075, -1.6406, 1.6550, -0.9793, 1.2624, -3.0702, 4.0185, -2.0037];
    
%     display(length(a));
%     display(length(b));
%     display(length(c));
%     display(length(d));
    
for i = 1:12
    p = [d(i) c(i) b(i) a(i)]; 
    q = polyint(p);
    %display(q);
    integrals(i) = (1/11)*diff(polyval(q, [1 12]));
end

    result = mean(integrals);
    display(result);

end

