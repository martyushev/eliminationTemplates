function C = coefs_toy(data)

    A = data{1};

    C = zeros(3,10);

    C([3,6,9,11,13,17,19,23,25]) = 1;
    C(28) = A(1);
    C(29) = A(2);
    C(30) = A(3);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end