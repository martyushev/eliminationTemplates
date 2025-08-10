function [C,U,dU] = coefs_toy(data)

    A = data{1};

    C = zeros(3,10);

    C([3,6,9,11,13,17,19,23,25]) = 1;
    C(28) = A(1);
    C(29) = A(2);
    C(30) = A(3);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(S,n)[S(1,:).^3;S(2,:).^3;S(3,:).^2.*S(1,:);S(1,:).^2;S(2,:).*S(1,:);S(2,:).^2;S(2,:).*S(3,:);S(3,:).^2;S(3,:);ones(1,n)];
    dU = @(S,n)[[3.*S(1,:).^2;zeros(1,n);S(3,:).^2;2.*S(1,:);S(2,:);zeros(1,n);zeros(1,n);zeros(1,n);zeros(1,n);zeros(1,n)],[zeros(1,n);3.*S(2,:).^2;zeros(1,n);zeros(1,n);S(1,:);2.*S(2,:);S(3,:);zeros(1,n);zeros(1,n);zeros(1,n)],[zeros(1,n);zeros(1,n);2.*S(1,:).*S(3,:);zeros(1,n);zeros(1,n);zeros(1,n);S(2,:);2.*S(3,:);ones(1,n);zeros(1,n)]];

end