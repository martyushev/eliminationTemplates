% 3x3 matrix relative error
function [errE,c] = mat_rel_error(E,E0)
    errE = inf;
    c = 0;
    e0 = E0(:)/norm(E0,'fro');
    for i = 1:size(E,2)
        e = E(:,i)/norm(E(:,i),'fro');
        t1 = norm(e-e0,'fro');
        t2 = norm(e+e0,'fro');
        t = min(t1,t2);
        if t < errE; errE = t; c = i; end
    end
end