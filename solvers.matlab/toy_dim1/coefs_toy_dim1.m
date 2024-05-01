function [C,U,dU] = coefs_toy_dim1(data)

    A = data{1};

    C = zeros(3,33);
    C([3,6,9,11,13,17,19,23]) = 1;
    C(31) = A(1);
    C(32) = A(2);
    C(33) = A(3);
    C([61,64]) = 1;
    C([93,98]) = 1;

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));
    C = mat2cell(C,3,repmat(11,1,3));

    U = @(w,x,y)[x^3,w^2*y,y^3,w^2,x*w,x^2,x*y,y^2,x,y,1];
    dU = @(w,x,y)[[0,2*w*y,0,2*w,x,0,0,0,0,0,0];[3*x^2,0,0,0,w,2*x,y,0,1,0,0];[0,w^2,3*y^2,0,0,0,x,2*y,0,1,0]];

end