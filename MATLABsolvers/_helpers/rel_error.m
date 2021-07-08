% find relative error in f
function [errf,c] = rel_error(ff,FPXL)
    errf = 1000;
    c = 0;
    for i = 1:length(ff)
        t = abs(ff(i) - FPXL)/FPXL; % relative error
        if t < errf; errf = t; c = i; end
    end
end