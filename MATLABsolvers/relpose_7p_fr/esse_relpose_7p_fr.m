function [F,E] = esse_relpose_7p_fr(f,w,x,y,z,M)

    n = length(f);
    F = zeros(9,n);
    E = zeros(9,n);

    for i = 1:n
        m = [w(i); w(i)*z(i); x(i); x(i)*z(i); y(i); y(i)*z(i); z(i); 1];
        ff = -M(1:5,:)*m;
        F0 = [ff(1) ff(3) x(i); ff(2) ff(4) y(i); ff(5) w(i) 1];
        F(:,i) = reshape(F0,9,1);
        F(:,i) = F(:,i)/norm(F(:,i),'fro');
        K = diag([f(i) f(i) 1]);
        E0 = K.'*F0*K;
        E(:,i) = reshape(E0,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end