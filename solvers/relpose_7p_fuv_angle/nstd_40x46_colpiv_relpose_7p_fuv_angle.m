% Input: coefficient matrix C of size 7x22

function S = nstd_40x46_colpiv_relpose_7p_fuv_angle(C)

    i_dx = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40];
    j_dx = [1,2,5,8,10,11,14,15,16,19,20,21,25,26,27,31,36,37,40,2,3,6,9,11,12,15,16,17,20,21,22,27,28,32,37,38,41,8,9,12,19,21,22,26,27,28,31,32,34,36,37,38,39,40,41,43,3,4,7,10,12,13,16,17,18,21,22,23,24,28,29,33,38,42,9,10,13,20,22,23,24,27,28,29,30,32,33,35,37,38,41,42,44,19,20,23,26,28,29,31,32,33,34,35,40,41,42,43,44,45,46,1,3,5,8,10,11,14,16,19,20,21,25,26,27,31,36,37,40,2,4,6,9,11,12,15,17,20,21,22,27,28,32,37,38,41,8,10,12,19,21,22,26,27,28,31,32,34,36,38,39,40,41,43,3,5,7,10,12,13,16,18,21,22,23,24,28,29,33,38,42,9,11,13,20,22,23,24,27,28,29,30,32,33,35,37,41,42,44,19,21,23,26,28,29,31,32,33,34,35,40,42,43,44,45,46,1,4,5,8,10,11,14,15,16,19,20,21,25,26,27,31,36,37,40,2,5,6,9,11,12,15,16,17,20,21,22,27,28,32,37,38,41,8,11,12,19,21,22,26,27,28,31,32,34,36,37,38,39,40,41,43,3,6,7,10,12,13,16,17,18,21,22,23,24,28,29,33,38,42,9,12,13,20,22,23,24,27,28,29,30,32,33,35,37,38,41,42,44,19,22,23,26,28,29,31,32,33,34,35,40,41,42,43,44,45,46,26,27,28,29,31,32,33,34,35,40,42,43,44,45,46,19,20,21,22,26,27,28,31,32,34,36,38,39,40,41,43,20,21,22,23,24,27,28,29,30,32,33,35,37,41,42,44,9,10,11,12,15,17,20,21,22,27,28,32,37,38,41,8,9,10,11,14,16,19,20,21,25,26,27,31,36,37,40,10,11,12,13,16,18,21,22,23,24,28,29,33,38,42,26,29,31,32,33,34,35,40,42,43,44,45,46,19,22,26,27,28,31,32,34,36,38,39,40,41,43,20,23,24,27,28,29,30,32,33,35,37,41,42,44,9,12,15,17,20,21,22,27,28,32,37,38,41,8,11,14,16,19,20,21,25,26,27,31,36,37,40,10,13,16,18,21,22,23,24,28,29,33,38,42,27,29,31,32,33,34,35,44,46,20,22,26,27,28,31,32,34,41,43,21,23,27,28,29,32,33,35,42,44,4,6,10,11,12,17,21,22,28,38,10,12,20,21,22,27,28,32,38,41,3,5,9,10,11,16,20,21,27,37,2,4,8,9,10,15,19,20,26,36,5,7,11,12,13,18,22,23,24,29,9,11,19,20,21,26,27,31,37,40,11,13,21,22,23,24,28,29,33,42];
    C_dx = [1,8,29,36,50,57,64,71,78,85,92,99,120,127,134,148,106,113,141,1,8,29,36,50,57,64,71,78,85,92,99,127,134,148,106,113,141,1,8,29,36,50,57,85,92,99,127,134,148,64,71,78,120,106,113,141,1,8,29,36,50,57,64,71,78,85,92,99,113,127,134,148,106,141,1,8,29,36,50,57,78,85,92,99,120,127,134,148,64,71,106,113,141,1,8,29,36,50,57,85,92,99,127,134,64,71,78,106,113,120,141,2,16,30,37,51,58,65,79,86,93,100,121,128,135,149,107,114,142,2,16,30,37,51,58,65,79,86,93,100,128,135,149,107,114,142,2,16,30,37,51,58,86,93,100,128,135,149,65,79,121,107,114,142,2,16,30,37,51,58,65,79,86,93,100,114,128,135,149,107,142,2,16,30,37,51,58,79,86,93,100,121,128,135,149,65,107,114,142,2,16,30,37,51,58,86,93,100,128,135,65,79,107,114,121,142,3,24,31,38,52,59,66,73,80,87,94,101,122,129,136,150,108,115,143,3,24,31,38,52,59,66,73,80,87,94,101,129,136,150,108,115,143,3,24,31,38,52,59,87,94,101,129,136,150,66,73,80,122,108,115,143,3,24,31,38,52,59,66,73,80,87,94,101,115,129,136,150,108,143,3,24,31,38,52,59,80,87,94,101,122,129,136,150,66,73,108,115,143,3,24,31,38,52,59,87,94,101,129,136,66,73,80,108,115,122,143,39,46,53,60,88,95,102,130,137,67,81,109,116,123,144,39,46,53,60,88,95,102,130,137,151,67,81,123,109,116,144,39,46,53,60,81,88,95,102,123,130,137,151,67,109,116,144,39,46,53,60,67,81,88,95,102,130,137,151,109,116,144,39,46,53,60,67,81,88,95,102,123,130,137,151,109,116,144,39,46,53,60,67,81,88,95,102,116,130,137,151,109,144,40,61,89,96,103,131,138,68,82,110,117,124,145,40,61,89,96,103,131,138,152,68,82,124,110,117,145,40,61,82,89,96,103,124,131,138,152,68,110,117,145,40,61,68,82,89,96,103,131,138,152,110,117,145,40,61,68,82,89,96,103,124,131,138,152,110,117,145,40,61,68,82,89,96,103,117,131,138,152,110,145,48,62,90,97,104,132,139,118,146,48,62,90,97,104,132,139,153,118,146,48,62,90,97,104,132,139,153,118,146,48,62,90,97,104,118,132,139,153,146,48,62,90,97,104,132,139,153,118,146,48,62,90,97,104,118,132,139,153,146,48,62,90,97,104,118,132,139,153,146,48,62,90,97,104,118,132,139,146,153,48,62,90,97,104,132,139,153,118,146,48,62,90,97,104,118,132,139,153,146];
    M = sparse(i_dx,j_dx,C(C_dx),40,46);

    [L,~,Pi] = lu(M(:,1:35));
    Pi = Pi';
    M = [Pi*L Pi(:,36:end)]\M(:,36:end);
    M = full(M(36:end,:));

    [L,UR,Pi] = lu(M(:,1:4));
    Pi = Pi';
    M = [Pi*L Pi(:,5:end)]\M(:,5:end);
    MP = M(1:4,:);
    NP = M(5:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-4));
    A = UR\[MP(:,1:end-4)*Pi MP(:,end-3:end)];
    B = U(:,1:1)\[U(:,2:end) Q'*NP(:,end-3:end)];
    M = [-A(:,end-5:end)+A(:,1:end-6)*B; -B];

    xP = [8,9,10,1,2,11,4];
    P1 = [(1:3)*Pi 4:7];
    T = getT(M,[8:11 P1(1:end-6)],P1(end-5:end),xP);

    [V,~] = eig(T);
    S = V(3:5,:)./repmat(V(6,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end