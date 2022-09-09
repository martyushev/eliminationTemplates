% Input: coefficient matrix C of size 3x29
% Output: solution matrix S of size 3x19

function S = red_41x60_colpiv_refract5p(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41];
    jx = [1,2,3,4,6,8,9,10,12,13,17,18,21,25,26,27,28,29,30,35,36,37,38,40,48,49,50,56,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,47,48,49,50,51,52,53,54,55,57,58,59,60,5,6,7,8,9,11,12,13,15,16,19,20,22,32,33,34,36,37,39,42,43,44,46,49,52,53,55,58,6,8,9,10,11,12,13,14,16,17,20,21,23,35,36,37,38,39,40,45,46,47,48,50,54,55,56,59,11,12,13,14,15,16,17,18,19,20,22,23,24,45,46,47,48,49,50,51,52,53,54,56,57,58,59,60,26,28,29,30,38,39,40,50,2,3,8,9,13,27,29,39,3,4,9,10,14,29,30,40,33,36,37,39,46,47,49,55,6,8,11,12,16,34,37,47,36,38,39,40,48,49,50,56,8,9,12,13,17,37,39,49,9,10,13,14,18,39,40,50,43,46,47,49,52,53,55,58,11,12,15,16,19,44,47,53,46,48,49,50,54,55,56,59,12,13,16,17,20,47,49,55,13,14,17,18,21,49,50,56,52,54,55,56,57,58,59,60,16,17,19,20,22,53,55,58,17,18,20,21,23,55,56,59,20,21,22,23,24,58,59,60,25,27,28,29,30,38,39,40,50,1,2,3,8,9,13,26,29,39,2,3,4,9,10,14,28,30,40,31,33,35,36,38,45,46,48,54,32,34,36,37,39,46,47,49,55,5,6,8,11,12,16,33,37,47,35,37,38,39,40,48,49,50,56,6,8,9,12,13,17,36,39,49,8,9,10,13,14,18,38,40,50,41,43,45,46,48,51,52,54,57,42,44,46,47,49,52,53,55,58,7,11,12,15,16,19,43,47,53,45,47,48,49,50,54,55,56,59,11,12,13,16,17,20,46,49,55,12,13,14,17,18,21,48,50,56,51,53,54,55,56,57,58,59,60,15,16,17,19,20,22,52,55,58,16,17,18,20,21,23,54,56,59,19,20,21,22,23,24,57,59,60];
    kx = [10,19,25,28,40,46,52,55,64,70,79,82,85,1,4,7,13,16,22,31,34,37,43,49,58,61,67,76,1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,52,55,58,61,64,67,70,76,79,82,85,10,19,40,25,28,46,52,55,64,70,79,82,85,1,4,7,13,16,22,31,34,37,43,49,58,61,67,76,10,19,25,28,40,46,52,55,64,70,79,82,85,1,4,7,13,16,22,31,34,37,43,49,58,61,67,76,10,19,25,28,40,46,52,55,64,70,79,82,85,1,4,7,13,16,22,31,34,37,43,49,58,61,67,76,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78];
    M = sparse(ix,jx,C(kx),41,60);

    [L,~,P] = lu(M(:,1:7));
    P = P';
    M = [P*L P(:,8:end)]\M(:,8:end);
    M = full(M(8:end,:));

    [L,U,P] = lu(M(:,1:17));
    P = P';
    M = [P*L P(:,18:end)]\M(:,18:end);
    M1 = M(1:17,:);
    M2 = M(18:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:17)\[R(:,18:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-18:end)+A(:,1:end-19)*B; -B];

    P1 = [37:53 (1:32)*P 33:36];
    P2 = [14,15,37,16,38,39,21,22,23,40,24,25,41,26,42,43,27,28,29,44,30,31,45,32,46,47,33,34,48,35,49,50,36,51,52,53];
    T = getT(M,P1(1:end-19),P1(end-18:end),P2);

    [V,~] = eig(T);
    S = V(16:18,:)./repmat(V(19,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end