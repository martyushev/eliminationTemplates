function [C,U,dU] = coefs_toy(data)

    A = data{1};

    C = zeros(3,10);

    C([3,6,9,11,13,17,19,23,25]) = 1;
    C(28) = A(1);
    C(29) = A(2);
    C(30) = A(3);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(x,y,z)[x^3,y^3,z^2*x,x^2,y*x,y^2,y*z,z^2,z,1];
    dU = @(x,y,z)[[3*x^2,0,z^2,2*x,y,0,0,0,0,0];[0,3*y^2,0,0,x,2*y,z,0,0,0];[0,0,2*x*z,0,0,0,y,2*z,1,0]];

end