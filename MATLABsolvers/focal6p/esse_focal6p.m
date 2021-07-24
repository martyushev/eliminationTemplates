function E = esse_focal6p(ff,uu,vv,ns)

    n = length(ff);
    E = zeros(9,n);
    F = ns(:,1)*ones(1,n) + ns(:,2)*uu + ns(:,3)*vv;

    for i = 1:n
        K = diag([ff(i) ff(i) 1]);
        E(:,i) = reshape(K*reshape(F(:,i),3,3)*K,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end