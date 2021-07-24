% measure relative error in essential matrices
function [errE,c] = errorE(E,Egt)

    errE = 1000;
    c = 0;

    egt = reshape(Egt,9,1);
    egt = egt/norm(egt,'fro');

    for i = 1:size(E,2)
        t1 = norm(E(:,i)-egt,'fro');
        t2 = norm(E(:,i)+egt,'fro');
        t = min(t1,t2);
        if t < errE; errE = t; c = i; end
    end

end