% Input: coefficient matrix C of size 3x10

function [x,y,z] = std_14x22_colpiv_toy(C)

    i_dx = [1,1,1,1,2,2,2,2,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10,10,11,11,11,11,12,12,12,13,13,14,14,14];
    j_dx = [2,5,10,14,7,10,16,19,3,11,15,8,11,17,20,10,12,18,21,14,17,21,22,1,2,13,4,5,16,6,8,19,7,9,12,20,13,15,18,22,1,3,19,4,21,6,9,22];
    C_dx = [13,19,25,28,13,19,25,28,13,25,28,13,19,25,28,13,19,25,28,13,19,25,28,11,17,29,11,17,29,11,17,29,11,17,23,29,11,17,23,29,3,6,30,3,30,3,6,30];
    M = sparse(i_dx,j_dx,C(C_dx),14,22);

    [L,~,Pi] = lu(M(:,1:6));
    Pi = Pi';
    M = [Pi*L Pi(:,7:end)]\M(:,7:end);
    M = full(M(7:end,:));

    [L,UR,Pi] = lu(M(:,1:6));
    Pi = Pi';
    M = [Pi*L Pi(:,7:end)]\M(:,7:end);
    MP = M(1:6,:);
    NP = M(7:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-4));
    A = UR\[MP(:,1:end-4)*Pi MP(:,end-3:end)];
    B = U(:,1:2)\[U(:,3:end) Q'*NP(:,end-3:end)];
    M = [-A(:,end-7:end)+A(:,1:end-8)*B; -B];

    xP = [11,12,13,14,15,16,2,3,5,8];
    P1 = [(1:6)*Pi 7:10];
    T = getT(M,[11:16 P1(1:end-8)],P1(end-7:end),xP);

    [V,D] = eig(T);
    sol = [V([5,7],:)./repmat(V(8,:),2,1); diag(D).'];

    I = find(not(isnan(sol(1,:))) & not(isinf(sol(1,:))));
    %I = I(not(imag(sol(1,:)))); % uncomment this line for real roots only
    x = sol(1,I);
    z = sol(2,I);
    y = sol(3,I);

end