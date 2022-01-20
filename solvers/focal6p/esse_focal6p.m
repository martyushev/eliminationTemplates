function [F,E] = esse_focal6p(ff,uu,vv,M)

    n = length(ff);
    E = zeros(9,n);
    ns = [-M;eye(3)];
    F = ns(:,3)*ones(1,n) + ns(:,2)*uu + ns(:,1)*vv;

    for i = 1:n
        K = diag([ff(i) ff(i) 1]);
        F(:,i) = F(:,i)/norm(F(:,i),'fro');
        E(:,i) = reshape(K*reshape(F(:,i),3,3)*K,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end