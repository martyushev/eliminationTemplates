function C = coefs_stitching(data)

    a = data{1};
    b = data{2};

    C = zeros(2,16);
    C([1,3,5,7,9,11,13,15,19,17,21,25,23,27,29,31]) = a(1:16);
    C([2,4,6,8,10,12,14,16,20,18,22,26,24,28,30,32]) = b(1:16);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

end