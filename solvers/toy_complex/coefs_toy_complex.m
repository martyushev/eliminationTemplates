function C = coefs_toy_complex(data)

    A = data{1};

    C = zeros(3,10);

    C([6,9,11,13,19,23]) = 1;
    C(17) = -I;
    C(25) = I;
    C(3) = 2*I;
    C(28) = A(1);
    C(29) = A(2);
    C(30) = A(3);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end