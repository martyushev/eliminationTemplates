% relative error
function [errf,c] = rel_error(ff,f0)
    errf = 1000;
    c = 0;
    for i = 1:length(ff)
        t = abs((ff(i)-f0)/f0);
        if t < errf; errf = t; c = i; end
    end
end