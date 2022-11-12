function C = coefs_pose_quiver(data)

    N = data{1};

    M = [-N(:,9), 2*N(:,3), 2*N(:,6), N(:,1)-N(:,5), -N(:,9), 2*N(:,6), -2*N(:,3),...
         N(:,9), N(:,9), -N(:,1)+N(:,5), 2*(N(:,2)+N(:,4)), 2*N(:,7), -2*N(:,8),...
         2*N(:,8), 2*N(:,7), -N(:,1)-N(:,5), 2*(N(:,2)-N(:,4)), N(:,1)+N(:,5)];

    M = M(:,1:4)\M(:,11:end);

    C = zeros(4,18);

    C([1,5,10,15,23,28]) = 1;
    C([17,30,40,53]) = -1;
    C(33:36) = M(1:4);
    C(41:44) = M(5:8);
    C(57:60) = M(9:12);
    C(45:48) = M(13:16);
    C(61:64) = M(17:20);
    C(49:52) = M(21:24);
    C(65:72) = M(25:32);

    C = C./(sqrt(sum(C.^2,2))*ones(1,size(C,2)));

end