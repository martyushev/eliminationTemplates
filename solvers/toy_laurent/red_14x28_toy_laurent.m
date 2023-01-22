% Input: coefficient matrix C of size 3x10
% Output: solution matrix S of size 3x14

function S = red_14x28_toy_laurent(C)

    ix = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,14,14,14,14];
    jx = [2,16,20,21,3,4,8,17,6,10,11,27,12,13,24,28,2,7,18,23,6,15,17,27,1,9,11,16,3,10,13,19,9,13,14,25,4,15,17,25,1,8,16,26,3,9,19,23,5,10,22,7,9,11,25];
    kx = [16,10,19,22,16,19,22,10,19,16,22,10,16,22,19,10,5,29,2,23,29,2,5,23,5,23,29,2,5,23,29,2,5,23,29,2,24,9,15,27,15,24,9,27,15,24,9,27,15,24,9,27,15,24,9];
    M = sparse(ix,jx,C(kx),14,28);

    [L,~,P] = lu(M(:,1:7));
    P = P';
    M = [P*L P(:,8:end)]\M(:,8:end);
    M = M(end-6:end,:);

    T = zeros(14);
    T([3,7,12,13,9,14,10],:) = -M(:,1:7)\M(:,8:end);
    T([71,86,102,159,174,120,193]) = 1;

    [V,~] = eig(T);
    S = V(11:13,:)./repmat(V(14,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end