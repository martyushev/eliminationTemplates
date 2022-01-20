function E = esse_relpose_6p_rad(w,x,y,z,M)

    n = length(w);
    E = zeros(9,n);

    for i = 1:n
        m = [w(i); w(i)*z(i); x(i); x(i)*z(i); y(i); y(i)*z(i); z(i)^2; z(i); 1];
        ee = -M(1:5,:)*m;
        E0 = [ee(1) ee(3) x(i); ee(2) ee(4) y(i); ee(5) w(i) 1];
        E(:,i) = reshape(E0,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end