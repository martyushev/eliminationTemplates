% Input: coefficient matrix C of size 7x35
% Output: solution matrix S of size 3x12

function S = red_13x25_colpiv_3pra_st0(C)

    ix = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23];
    jx = [1,3,5,7,8,11,15,27,5,12,16,28,9,13,17,29,10,14,18,30,7,16,19,31,2,20,24,32,4,21,25,33,6,23,26,34,1,28,31,35,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,1,2,3,4,5,6,7,8,9,10,11,13,15,17,20,22,24,27,29,4,5,8,10,11,12,13,14,15,16,18,20,21,22,23,25,27,28,30,6,7,9,10,13,14,15,16,17,18,19,22,23,24,25,26,29,30,31,1,2,4,6,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,1,2,3,4,5,6,7,8,9,10,11,13,15,17,20,22,24,27,29,4,5,8,10,11,12,13,14,15,16,18,20,21,22,23,25,27,28,30,6,7,9,10,13,14,15,16,17,18,19,22,23,24,25,26,29,30,31,1,2,4,6,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,1,2,3,4,5,6,7,8,9,10,11,13,15,17,20,22,24,27,29,4,5,8,10,11,12,13,14,15,16,18,20,21,22,23,25,27,28,30,6,7,9,10,13,14,15,16,17,18,19,22,23,24,25,26,29,30,31,1,2,4,6,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34];
    kx = [245,182,196,217,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,182,196,217,245,178,108,3,115,17,136,66,10,38,45,24,31,52,59,73,80,87,94,101,122,129,143,150,157,164,171,185,192,199,206,213,220,227,234,241,221,179,109,186,123,200,158,116,137,144,130,151,165,172,193,207,214,228,235,179,116,109,137,123,130,144,151,158,165,172,186,193,200,207,214,221,228,235,179,137,109,116,123,130,144,151,158,165,172,186,193,200,207,214,221,228,235,179,109,116,137,123,130,144,151,158,165,172,186,193,200,207,214,221,228,235,222,180,110,187,124,201,159,117,138,145,131,152,166,173,194,208,215,229,236,180,117,110,138,124,131,145,152,159,166,173,187,194,201,208,215,222,229,236,180,138,110,117,124,131,145,152,159,166,173,187,194,201,208,215,222,229,236,180,110,117,138,124,131,145,152,159,166,173,187,194,201,208,215,222,229,236,223,181,111,188,125,202,160,118,139,146,132,153,167,174,195,209,216,230,237,181,118,111,139,125,132,146,153,160,167,174,188,195,202,209,216,223,230,237,181,139,111,118,125,132,146,153,160,167,174,188,195,202,209,216,223,230,237,181,111,118,139,125,132,146,153,160,167,174,188,195,202,209,216,223,230,237];
    M = sparse(ix,jx,C(kx),23,35);

    M = M(11:end,11:end)-(M(11:end,1:10)/M(1:10,1:10))*M(1:10,11:end); % Schur complement reduction

    [L,~,P] = lu(M(:,1:2));
    P = P';
    M = [P*L P(:,3:end)]\M(:,3:end);
    M = full(M(3:end,:));

    [L,U,P] = lu(M(:,1:7));
    P = P';
    M = [P*L P(:,8:end)]\M(:,8:end);
    M1 = M(1:7,:);
    M2 = M(8:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:4)\[R(:,5:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-11:end)+A(:,1:end-12)*B; -B];

    P1 = [17:23 (1:12)*P 13:16];
    P2 = [17,18,19,20,21,22,23,3,4,5,6,7,10,11,12,15];
    T = getT(M,P1(1:end-12),P1(end-11:end),P2);

    [V,~] = eig(T);
    S = V(9:11,:)./repmat(V(12,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end