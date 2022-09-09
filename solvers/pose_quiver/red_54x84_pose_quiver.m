% Input: coefficient matrix C of size 4x18
% Output: solution matrix S of size 4x30

function S = red_54x84_pose_quiver(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54];
    jx = [1,3,7,12,15,16,17,19,21,39,43,66,2,4,8,13,16,18,21,40,41,44,62,67,5,16,17,18,58,59,64,65,66,67,69,71,9,21,38,42,43,44,46,63,66,67,69,71,10,13,17,22,25,26,27,29,30,43,47,72,12,14,18,23,26,28,30,44,45,48,68,73,15,26,27,28,62,64,70,71,72,73,76,80,19,30,41,46,47,48,51,69,72,73,76,80,20,23,27,31,33,34,47,49,52,74,77,81,22,24,28,32,48,49,50,53,74,75,78,82,25,68,70,74,77,78,79,80,81,82,83,84,29,45,49,51,52,53,54,76,81,82,83,84,2,5,6,7,9,11,36,39,55,60,3,6,8,11,37,38,40,56,58,61,5,11,12,15,16,17,19,21,43,66,6,13,16,18,21,38,41,44,62,67,7,16,17,18,61,64,66,67,69,71,21,40,43,44,46,60,66,67,69,71,15,21,22,25,26,27,29,30,47,72,16,23,26,28,30,41,45,48,68,73,17,26,27,28,67,70,72,73,76,80,30,44,47,48,51,66,72,73,76,80,25,30,31,33,34,49,52,74,77,81,26,32,45,49,50,53,74,75,78,82,27,73,74,77,78,79,81,82,83,84,48,49,52,53,54,72,81,82,83,84,2,5,6,7,9,11,35,39,56,60,3,6,8,11,36,38,40,57,58,61,6,9,12,15,16,17,19,21,43,66,11,13,16,18,21,41,44,58,62,67,8,16,17,18,60,64,66,67,69,71,21,39,43,44,46,61,66,67,69,71,16,19,22,25,26,27,29,30,47,72,21,23,26,28,30,45,48,62,68,73,18,26,27,28,66,70,72,73,76,80,30,43,47,48,51,67,72,73,76,80,26,29,31,33,34,49,52,74,77,81,30,32,49,50,53,68,74,75,78,82,28,72,74,77,78,79,81,82,83,84,47,49,52,53,54,73,81,82,83,84,1,2,3,5,6,7,9,11,39,60,2,3,4,6,8,11,38,40,58,61,5,6,7,8,58,59,60,61,63,65,9,11,38,39,40,42,60,61,63,65,10,12,13,15,16,17,19,21,43,66,12,13,14,16,18,21,41,44,62,67,15,16,17,18,62,64,66,67,69,71,19,21,41,43,44,46,66,67,69,71,20,22,23,25,26,27,29,30,47,72,22,23,24,26,28,30,45,48,68,73,25,26,27,28,68,70,72,73,76,80,29,30,45,47,48,51,72,73,76,80,33,74,75,77,78,79,81,82,83,84,34,49,50,52,53,54,81,82,83,84];
    kx = [1,5,17,33,41,45,49,57,61,53,69,65,1,5,17,33,41,49,57,53,61,69,45,65,1,33,41,45,5,17,49,53,57,61,65,69,1,33,5,53,57,61,69,17,41,45,49,65,1,5,17,33,41,45,49,57,61,53,69,65,1,5,17,33,41,49,57,53,61,69,45,65,1,33,41,45,5,17,49,53,57,61,65,69,1,33,5,53,57,61,69,17,41,45,49,65,1,5,17,33,41,57,53,61,69,45,49,65,1,5,17,33,53,57,61,69,41,45,49,65,1,5,17,33,41,45,49,53,57,61,65,69,1,5,33,53,57,61,69,17,41,45,49,65,34,42,46,50,58,62,30,70,10,66,34,42,50,58,30,62,70,10,46,66,10,30,34,42,46,50,58,62,70,66,10,34,42,50,58,30,62,70,46,66,10,34,42,46,30,50,58,62,66,70,34,30,58,62,70,10,42,46,50,66,10,30,34,42,46,50,58,62,70,66,10,34,42,50,58,30,62,70,46,66,10,34,42,46,30,50,58,62,66,70,34,30,58,62,70,10,42,46,50,66,10,30,34,42,58,62,70,46,50,66,10,34,30,58,62,70,42,46,50,66,10,30,34,42,46,50,58,62,66,70,30,34,58,62,70,10,42,46,50,66,35,43,47,51,59,63,23,71,15,67,35,43,51,59,23,63,71,15,47,67,15,23,35,43,47,51,59,63,71,67,23,35,43,51,59,63,71,15,47,67,15,35,43,47,23,51,59,63,67,71,35,23,59,63,71,15,43,47,51,67,15,23,35,43,47,51,59,63,71,67,23,35,43,51,59,63,71,15,47,67,15,35,43,47,23,51,59,63,67,71,35,23,59,63,71,15,43,47,51,67,15,23,35,43,59,63,71,47,51,67,23,35,59,63,71,15,43,47,51,67,15,23,35,43,47,51,59,63,67,71,23,35,59,63,71,15,43,47,51,67,28,36,40,44,48,52,60,64,72,68,28,36,40,44,52,60,64,72,48,68,28,36,44,48,40,52,60,64,68,72,28,36,40,60,64,72,44,48,52,68,28,36,40,44,48,52,60,64,72,68,28,36,40,44,52,60,64,72,48,68,28,36,44,48,40,52,60,64,68,72,28,36,40,60,64,72,44,48,52,68,28,36,40,44,48,52,60,64,72,68,28,36,40,44,52,60,64,72,48,68,28,36,44,48,40,52,60,64,68,72,28,36,40,60,64,72,44,48,52,68,28,36,40,44,48,52,60,64,68,72,28,36,40,60,64,72,44,48,52,68];
    M = sparse(ix,jx,C(kx),54,84);

    [L,~,P] = lu(M(:,1:34));
    P = P';
    M = [P*L P(:,35:end)]\M(:,35:end);
    M = M(end-19:end,:);

    T = zeros(30);
    T([1,2,3,4,6,7,8,11,12,13,14,17,18,19,20,21,26,27,28,30],:) = -M(:,1:20)\M(:,21:end);
    T([245,309,430,495,646,772,803,834,865,899]) = 1;

    [V,~] = eig(T);
    S = V(26:29,:)./repmat(V(30,:),4,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end