% Input: coefficient matrix C of size 4x80
% Output: solution matrix S of size 4x20

function S = red_59x79_colpiv_unsynch_relpose(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59];
    jx = [36,37,38,39,72,73,74,75,76,77,78,79,30,31,33,36,60,61,63,66,67,69,72,75,31,32,34,37,61,62,64,67,68,70,73,76,33,34,35,38,63,64,65,69,70,71,74,77,1,4,7,72,73,74,75,76,77,78,79,20,21,24,30,40,41,44,50,51,54,60,66,22,23,26,32,42,43,46,52,53,56,62,68,27,28,29,35,47,48,49,57,58,59,65,71,21,22,25,31,41,42,45,51,52,55,61,67,24,25,27,33,44,45,47,54,55,57,63,69,25,26,28,34,45,46,48,55,56,58,64,70,1,2,10,12,60,61,63,66,67,69,72,75,2,3,14,15,40,41,44,50,51,54,60,66,4,5,10,16,61,62,64,67,68,70,73,76,5,6,11,18,42,43,46,52,53,56,62,68,7,8,12,16,63,64,65,69,70,71,74,77,8,9,13,17,47,48,49,57,58,59,65,71,10,11,14,19,41,42,45,51,52,55,61,67,12,13,15,19,44,45,47,54,55,57,63,69,16,17,18,19,45,46,48,55,56,58,64,70,36,37,38,39,72,73,74,75,76,77,78,79,30,31,33,36,60,61,63,66,67,69,72,75,31,32,34,37,61,62,64,67,68,70,73,76,33,34,35,38,63,64,65,69,70,71,74,77,1,4,7,72,73,74,75,76,77,78,79,20,21,24,30,40,41,44,50,51,54,60,66,22,23,26,32,42,43,46,52,53,56,62,68,27,28,29,35,47,48,49,57,58,59,65,71,21,22,25,31,41,42,45,51,52,55,61,67,24,25,27,33,44,45,47,54,55,57,63,69,25,26,28,34,45,46,48,55,56,58,64,70,1,2,10,12,60,61,63,66,67,69,72,75,2,3,14,15,40,41,44,50,51,54,60,66,4,5,10,16,61,62,64,67,68,70,73,76,5,6,11,18,42,43,46,52,53,56,62,68,7,8,12,16,63,64,65,69,70,71,74,77,8,9,13,17,47,48,49,57,58,59,65,71,10,11,14,19,41,42,45,51,52,55,61,67,12,13,15,19,44,45,47,54,55,57,63,69,16,17,18,19,45,46,48,55,56,58,64,70,36,37,38,39,72,73,74,75,76,77,78,79,30,31,33,36,60,61,63,66,67,69,72,75,31,32,34,37,61,62,64,67,68,70,73,76,33,34,35,38,63,64,65,69,70,71,74,77,1,4,7,72,73,74,75,76,77,78,79,20,21,24,30,40,41,44,50,51,54,60,66,22,23,26,32,42,43,46,52,53,56,62,68,27,28,29,35,47,48,49,57,58,59,65,71,21,22,25,31,41,42,45,51,52,55,61,67,24,25,27,33,44,45,47,54,55,57,63,69,25,26,28,34,45,46,48,55,56,58,64,70,1,2,10,12,60,61,63,66,67,69,72,75,2,3,14,15,40,41,44,50,51,54,60,66,4,5,10,16,61,62,64,67,68,70,73,76,5,6,11,18,42,43,46,52,53,56,62,68,7,8,12,16,63,64,65,69,70,71,74,77,8,9,13,17,47,48,49,57,58,59,65,71,10,11,14,19,41,42,45,51,52,55,61,67,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79];
    kx = [301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,245,249,253,285,289,293,301,305,309,313,317,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,297,245,249,253,285,289,293,301,305,309,313,317,297,245,249,253,285,289,293,301,305,309,313,317,297,249,245,253,285,289,293,301,305,309,313,317,297,249,245,253,285,289,293,301,305,309,313,317,297,253,245,249,285,289,293,301,305,309,313,317,297,253,245,249,285,289,293,301,305,309,313,317,297,249,245,253,285,289,293,301,305,309,313,317,297,253,245,249,285,289,293,301,305,309,313,317,297,253,249,245,285,289,293,301,305,309,313,317,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,246,250,254,286,290,294,302,306,310,314,318,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,298,246,250,254,286,290,294,302,306,310,314,318,298,246,250,254,286,290,294,302,306,310,314,318,298,250,246,254,286,290,294,302,306,310,314,318,298,250,246,254,286,290,294,302,306,310,314,318,298,254,246,250,286,290,294,302,306,310,314,318,298,254,246,250,286,290,294,302,306,310,314,318,298,250,246,254,286,290,294,302,306,310,314,318,298,254,246,250,286,290,294,302,306,310,314,318,298,254,250,246,286,290,294,302,306,310,314,318,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,247,251,255,287,291,295,303,307,311,315,319,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,315,299,247,251,255,287,291,295,303,307,311,315,319,299,247,251,255,287,291,295,303,307,311,315,319,299,251,247,255,287,291,295,303,307,311,315,319,299,251,247,255,287,291,295,303,307,311,315,319,299,255,247,251,287,291,295,303,307,311,315,319,299,255,247,251,287,291,295,303,307,311,315,319,299,251,247,255,287,291,295,303,307,311,315,319,172,84,4,176,92,16,180,104,40,88,12,96,32,8,20,100,36,28,24,184,188,192,196,200,204,208,212,216,220,264,268,272,276,280,284,304,308,312,320,44,48,52,56,60,64,68,72,76,80,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,224,228,232,236,240,244,248,252,256,288,292,296,300,316];
    M = sparse(ix,jx,C(kx),59,79);

    [L,~,P] = lu(M(:,1:19));
    P = P';
    M = [P*L P(:,20:end)]\M(:,20:end);
    M = full(M(20:end,:));

    [L,U,P] = lu(M(:,1:20));
    P = P';
    M = [P*L P(:,21:end)]\M(:,21:end);
    M1 = M(1:20,:);
    M2 = M(21:end,:);

    [Q,R,P] = qr(M2(:,1:end-5));
    A = U\[M1(:,1:end-5)*P M1(:,end-4:end)];
    B = R(:,1:20)\[R(:,21:end) Q'*M2(:,end-4:end)];
    M = [-A(:,end-19:end)+A(:,1:end-20)*B; -B];

    P1 = [41:60 (1:35)*P 36:40];
    P2 = [11,12,13,14,15,16,17,18,19,20,41,42,43,44,45,46,47,48,49,50,27,28,29,30,31,32,51,52,53,54,55,56,36,37,38,57,58,59,40,60];
    T = getT(M,P1(1:end-20),P1(end-19:end),P2);

    [V,~] = eig(T);
    S = V(16:19,:)./repmat(V(20,:),4,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end