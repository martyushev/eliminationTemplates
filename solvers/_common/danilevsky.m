% Danilevsky's method of finding real eigenvectors of square matrix A
function v = danilevsky(A)
    n = size(A,1);
    I = eye(n);
    S = I;
    for k=1:n-1
        T = [I(1:n-k-1,:); -A(n-k+1,:)./A(n-k+1,n-k); I(n-k+1:n,:)];
        T(n-k,n-k) = -T(n-k,n-k)/A(n-k+1,n-k);
        iT = [I(1:n-k-1,:); A(n-k+1,:); I(n-k+1:n,:)];
        S = S*T;
        A = iT*A*T;
    end
    p = [1 -A(1,:)];
    r = roots(p);
    r = r(imag(r)==0);
    u = r.^(n:-1:1);
    v = S*u.';
    v = v./v(n,:);
end