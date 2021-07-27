% find 3x3 matrix relative error
function [errE,c] = mat_rel_error(E,E0)
    errE = 1000;
    c = 0;
    e0 = reshape(E0,9,1);
    e0 = e0/norm(e0,'fro');
    for i = 1:size(E,2)
        t1 = norm(E(:,i)-e0,'fro');
        t2 = norm(E(:,i)+e0,'fro');
        t = min(t1,t2);
        if t < errE; errE = t; c = i; end
    end
end