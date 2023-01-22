% Input: coefficient matrix C of size 3x24
% Output: solution matrix S of size 3x59

function S = red_70x129_colpiv_3v_triang_laurent(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70];
    jx = [31,32,38,55,56,57,77,79,80,86,87,94,101,103,104,111,119,11,20,21,32,51,52,57,59,60,65,66,72,77,79,80,87,104,32,33,39,58,77,78,80,81,85,87,88,95,102,104,105,112,120,33,34,40,59,78,79,81,82,86,88,89,96,103,105,106,113,121,34,35,41,60,79,80,82,83,87,89,90,97,104,106,107,114,122,35,36,42,61,80,81,83,84,88,90,91,98,105,107,108,123,126,29,30,38,39,45,56,64,85,87,88,94,95,109,111,112,115,124,40,41,47,66,86,87,89,90,94,96,97,100,111,113,114,116,125,3,14,20,33,57,58,60,61,64,66,67,73,78,80,81,88,105,13,14,16,34,58,59,61,62,65,67,68,74,79,81,82,89,106,2,16,25,35,59,60,62,63,66,68,69,75,80,82,83,90,107,3,11,12,27,39,52,53,64,66,67,72,73,85,87,88,95,112,3,13,23,40,54,64,65,67,68,71,73,74,86,88,89,96,113,2,7,8,28,42,66,67,69,70,73,75,76,88,90,91,98,126,4,5,14,24,32,33,35,36,39,41,42,48,58,60,61,67,81,5,16,19,33,34,36,37,40,42,43,49,59,61,62,68,82,1,2,3,5,7,8,10,14,15,18,20,25,33,35,36,42,61,1,3,6,7,8,9,13,17,23,40,42,43,49,68,36,37,43,62,80,81,83,84,88,89,91,96,105,106,108,113,121,43,44,50,69,88,89,91,92,96,97,99,100,113,114,116,125,127,7,18,25,36,59,60,62,63,66,67,69,73,80,81,83,88,105,6,7,17,43,54,66,67,69,70,73,74,76,88,89,91,96,113,29,32,33,39,55,56,58,77,79,80,85,87,101,102,104,109,117,33,34,40,59,77,78,80,81,85,86,88,93,102,103,105,110,118,34,35,41,60,78,79,81,82,86,87,89,94,103,104,106,111,119,35,36,42,61,79,80,82,83,87,88,90,95,104,105,107,112,120,30,41,42,48,67,86,87,89,90,94,95,97,111,112,114,115,124,3,14,20,33,51,52,53,57,59,60,64,66,77,78,80,85,102,13,14,16,34,57,58,60,61,64,65,67,71,78,79,81,86,103,2,16,25,35,58,59,61,62,65,66,68,72,79,80,82,87,104,3,13,23,26,40,52,53,64,66,67,71,73,85,86,88,93,110,2,7,8,27,42,65,66,68,69,72,73,75,87,88,90,95,112,4,5,14,24,31,32,34,35,38,39,41,45,57,58,60,64,78,5,16,19,32,33,35,36,39,40,42,46,58,59,61,65,79,1,2,3,5,10,11,12,15,16,20,21,25,32,33,35,39,58,1,2,3,7,8,9,11,12,22,23,39,40,42,46,65,31,32,38,55,56,57,77,78,79,86,101,103,36,37,43,62,81,82,83,84,89,91,106,108,43,44,50,69,89,90,91,92,97,99,114,127,11,20,21,32,51,52,57,58,59,65,77,79,7,18,25,36,60,61,62,63,67,69,81,83,6,7,17,43,67,68,69,70,74,76,89,91,12,22,23,26,27,46,53,71,72,73,93,95,8,17,28,49,54,73,74,75,76,96,98,57,58,64,78,101,102,103,104,109,111,117,119,58,59,65,79,102,103,104,105,110,112,118,120,59,60,66,80,103,104,105,106,111,113,119,121,60,61,67,81,104,105,106,107,112,114,120,122,61,62,68,82,105,106,107,108,113,121,123,126,66,67,73,88,111,112,113,114,115,116,124,125,68,69,75,90,113,114,116,125,126,127,128,129,32,33,39,58,77,78,79,80,85,87,102,104,33,34,40,59,78,79,80,81,86,88,103,105,34,35,41,60,79,80,81,82,87,89,104,106,35,36,42,61,80,81,82,83,88,90,105,107,29,38,39,45,56,64,85,86,87,94,109,111,39,40,46,65,85,86,87,88,93,95,110,112,40,41,47,66,86,87,88,89,94,96,111,113,41,42,48,67,87,88,89,90,95,97,112,114,42,43,49,68,88,89,90,91,96,98,113,126,3,14,20,33,57,58,59,60,64,66,78,80,13,14,16,34,58,59,60,61,65,67,79,81,2,16,25,35,59,60,61,62,66,68,80,82,3,11,12,39,52,53,64,65,66,72,85,87,3,13,23,40,64,65,66,67,71,73,86,88,2,7,8,42,66,67,68,69,73,75,88,90,4,5,14,24,32,33,34,35,39,41,58,60,5,16,19,33,34,35,36,40,42,59,61,1,2,3,5,10,14,15,16,20,25,33,35,1,2,3,7,8,9,13,23,40,42];
    kx = [1,4,7,16,34,10,19,25,28,37,40,46,52,55,58,64,70,7,4,1,10,16,34,19,25,28,37,40,46,52,55,58,64,70,1,4,7,10,16,19,25,28,34,37,40,46,52,55,58,64,70,1,4,7,10,16,19,25,28,34,37,40,46,52,55,58,64,70,1,4,7,10,16,19,25,28,34,37,40,46,52,55,58,64,70,1,4,7,10,16,19,25,28,34,37,40,46,52,55,58,70,64,34,46,1,4,7,16,10,19,25,28,37,40,52,55,58,64,70,1,4,7,10,16,19,25,28,34,37,40,46,52,55,58,64,70,7,4,1,10,16,19,25,28,34,37,40,46,52,55,58,64,70,7,1,4,10,16,19,25,28,34,37,40,46,52,55,58,64,70,7,1,4,10,16,19,25,28,34,37,40,46,52,55,58,64,70,4,1,7,46,10,16,34,19,25,28,37,40,52,55,58,64,70,1,4,7,10,46,16,19,25,28,34,37,40,52,55,58,64,70,1,4,7,46,10,16,19,25,28,34,37,40,52,55,58,64,70,7,4,10,1,16,19,25,28,34,37,40,46,52,55,58,64,70,1,10,4,16,19,25,28,34,37,40,46,52,55,58,64,70,7,37,34,10,40,46,1,19,4,28,16,25,52,55,58,64,70,1,16,28,25,37,4,19,40,34,52,55,58,64,70,2,5,8,11,14,17,23,26,32,35,38,44,50,53,56,62,68,2,5,8,11,14,17,23,26,32,35,38,44,50,53,62,68,56,8,5,2,11,14,17,23,26,32,35,38,44,50,53,56,62,68,5,2,8,11,44,14,17,23,26,32,35,38,50,53,56,62,68,44,2,5,8,14,32,11,17,23,26,35,38,50,53,56,62,68,2,5,8,11,14,17,23,26,32,35,38,44,50,53,56,62,68,2,5,8,11,14,17,23,26,32,35,38,44,50,53,56,62,68,2,5,8,11,14,17,23,26,32,35,38,44,50,53,56,62,68,44,2,5,8,11,14,17,23,26,32,35,38,50,53,56,62,68,8,5,2,11,14,32,44,17,23,26,35,38,50,53,56,62,68,8,2,5,11,14,17,23,26,32,35,38,44,50,53,56,62,68,8,2,5,11,14,17,23,26,32,35,38,44,50,53,56,62,68,2,5,8,44,11,14,32,17,23,26,35,38,50,53,56,62,68,2,5,8,44,11,14,17,23,26,32,35,38,50,53,56,62,68,8,5,11,2,14,17,23,26,32,35,38,44,50,53,56,62,68,2,11,5,14,17,23,26,32,35,38,44,50,53,56,62,68,8,38,35,11,2,32,44,5,23,17,14,26,50,53,56,62,68,2,23,17,26,38,5,14,32,44,35,50,53,56,62,68,3,6,9,18,36,12,21,24,27,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,9,6,3,12,18,36,21,24,27,39,54,57,9,6,3,12,18,21,24,27,36,39,54,57,6,3,9,12,18,21,24,27,36,39,54,57,3,9,6,36,39,12,18,21,24,27,54,57,3,6,39,12,36,18,21,24,27,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,54,57,39,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,36,54,24,27,39,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,36,3,6,9,18,12,21,24,27,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,9,6,3,12,18,21,24,27,36,39,54,57,9,3,6,12,18,21,24,27,36,39,54,57,9,3,6,12,18,21,24,27,36,39,54,57,6,3,9,12,18,36,21,24,27,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,3,6,9,12,18,21,24,27,36,39,54,57,9,6,12,3,18,21,24,27,36,39,54,57,3,12,6,18,21,24,27,36,39,54,57,9,39,36,12,3,21,6,24,18,27,54,57,3,24,18,27,39,6,21,36,54,57];
    M = sparse(ix,jx,C(kx),70,129);

    [L,~,P] = lu(M(:,1:30));
    P = P';
    M = [P*L P(:,31:end)]\M(:,31:end);
    M = full(M(31:end,:));

    [L,U,P] = lu(M(:,1:26));
    P = P';
    M = [P*L P(:,27:end)]\M(:,27:end);
    M1 = M(1:26,:);
    M2 = M(27:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:14)\[R(:,15:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-58:end)+A(:,1:end-59)*B; -B];

    P1 = [74:99 (1:69)*P 70:73];
    P2 = [74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,1,2,3,4,5,6,7,95,8,9,10,11,12,13,14,96,15,16,17,18,19,20,97,98,21,22,23,24,25,26,27,99,29,30,31,32,33,38,40,45,46,47,48,49,50,51,55,57,34,35,42,70];
    T = getT(M,P1(1:end-59),P1(end-58:end),P2);

    [V,~] = eig(T);
    S = V(56:58,:)./repmat(V(59,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end