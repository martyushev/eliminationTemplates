% Input: coefficient matrix C of size 3x10
% Output: solution matrix S of size 3x8

function S = red_14x22_toy(C)

    M = sparse([1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,9,9,9,10,10,10,10,11,11,11,12,12,13,13,13,14,14,14],[9,12,13,13,14,19,21,6,7,8,10,11,13,16,18,3,17,21,22,2,10,12,16,6,11,14,20,5,8,19,4,7,16,2,15,18,22,1,3,12,5,20,4,9,17,1,14,15],C([25,13,19,25,28,13,19,13,25,28,19,25,28,13,19,13,19,25,28,13,25,28,19,11,23,29,17,11,29,17,11,29,17,11,17,23,29,11,17,29,3,6,3,30,6,3,30,6]),14,22);

    [L,~,p] = lu(M(:,1:9),'vector');
    M = M(p(end-4:end),10:end)-L(end-4:end,:)*(L(1:9,:)\M(p(1:9),10:end));
    %[M,~] = qr(M(:,1:9),M(:,10:end));
    %M = M(end-4:end,:);

    T0 = zeros(8);
    T0([2,4,5,7,8],:) = -M(:,6:end);
    T0([41,51,62]) = 1;
    T1 = zeros(8);
    T1([2,4,5,7,8],[2,4,5,7,8]) = M(:,1:5);
    T1([1,19,46]) = 1;

    [V,~] = eig(T0,T1);
    S = V(5:7,:)./repmat(V(8,:),3,1);
    S = S(:,all(isfinite(S)));

end