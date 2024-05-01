% iterative refinement by Newton-Raphson method
function [e1,S] = iteref(e,S,C,U,dU)

    warning off; % suppress all warnings
    maxit = 20; % maximum number of iterations
    theta = 1e-14; % threshold
    n = size(S,2);
    e1 = ones(1,n);
    for i = 1:n
        x = S(:,i);
        it = 0;
        while e1(i) > theta
            x1 = num2cell(x);
            m = U(x1{:}).';
            dm = dU(x1{:}).';
            r = C*m;
            dx = (C*dm)\r;
            x = x-dx;
            e1(i) = norm(r,'fro')/norm(m,'fro');
            it = it+1;
            if it == maxit; break; end
        end
        if e1(i) < e(i); S(:,i) = x; else; e1(i) = e(i); end
    end
    warning on;
    
end