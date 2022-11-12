% Input: coefficient matrix C of size 3x29
% Output: solution matrix S of size 3x19

function S = red_41x60_refract5p(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41];
    jx = [1,2,3,4,5,6,12,13,14,15,24,28,29,30,31,34,35,38,42,43,44,45,46,48,50,51,52,56,7,8,9,10,12,13,14,16,17,18,19,21,25,26,46,47,48,49,50,51,52,53,54,55,57,58,59,60,8,9,10,11,13,14,15,17,18,19,20,22,23,24,26,27,28,29,31,33,36,37,39,47,51,53,55,58,12,13,14,15,21,22,23,24,28,29,30,31,32,33,34,37,38,40,46,47,48,49,50,52,54,55,56,59,21,22,23,24,25,26,27,31,32,33,34,35,36,37,39,40,41,49,50,51,52,53,54,56,57,58,59,60,2,43,44,45,46,47,48,52,4,5,28,29,31,42,44,47,5,6,29,30,32,44,45,48,9,13,14,22,47,49,51,55,10,14,15,23,24,28,33,49,13,46,47,48,50,51,52,56,14,24,28,29,31,34,47,51,29,30,31,32,35,47,48,52,18,22,26,49,51,53,55,58,19,23,24,27,33,36,49,53,22,50,51,52,54,55,56,59,24,31,33,34,37,49,51,55,31,32,34,35,38,51,52,56,26,54,55,56,57,58,59,60,33,34,36,37,39,53,55,58,34,35,37,38,40,55,56,59,37,38,39,40,41,58,59,60,1,42,43,44,45,46,47,48,52,2,3,4,5,28,29,31,44,47,4,5,6,29,30,32,43,45,48,7,9,12,13,21,22,46,50,54,8,10,13,14,22,47,49,51,55,9,11,14,15,23,24,28,33,49,12,14,46,47,48,50,51,52,56,13,15,24,28,29,31,34,47,51,28,29,30,31,32,35,46,48,52,16,18,21,22,25,26,50,54,57,17,19,22,26,49,51,53,55,58,18,20,23,24,27,33,36,49,53,21,49,50,51,52,54,55,56,59,22,23,24,31,33,34,37,51,55,24,31,32,34,35,38,50,52,56,25,53,54,55,56,57,58,59,60,26,27,33,34,36,37,39,55,58,33,34,35,37,38,40,54,56,59,36,37,38,39,40,41,57,59,60];
    kx = [1,4,10,19,25,28,31,34,37,40,64,46,52,55,70,79,82,85,7,13,16,22,43,49,58,61,67,76,1,4,7,10,13,16,19,31,34,37,40,43,58,61,22,25,28,46,49,52,55,64,67,70,76,79,82,85,1,4,7,10,13,16,19,31,34,37,40,43,46,52,58,64,25,28,55,70,79,82,85,22,49,61,67,76,1,4,7,10,31,34,40,46,19,25,28,52,55,64,70,79,82,85,13,16,22,37,43,49,58,61,67,76,1,4,10,19,31,34,40,25,28,46,52,55,64,70,79,82,85,7,13,16,22,37,43,49,58,61,67,76,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,62,68,71,77,74,80,83,86,62,68,71,80,83,74,86,77,62,68,71,74,77,80,83,86,62,80,71,74,83,86,68,77,71,74,80,83,86,62,68,77,62,68,77,71,74,80,83,86,62,71,74,80,83,86,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,62,68,71,74,77,80,83,86,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,71,74,80,83,86,62,68,77,60,66,69,72,75,78,81,84,87,60,66,72,75,81,84,87,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,78,81,75,84,87,60,66,69,72,78,75,81,84,87,60,66,69,72,81,84,75,87,78,60,66,69,72,75,78,81,84,87,60,66,81,72,75,84,87,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,78,81,75,84,87,60,66,69,78,72,75,81,84,87,60,66,72,75,81,84,87,69,78,60,66,69,72,75,78,81,84,87,60,66,72,75,81,84,87,69,78,66,72,75,81,84,87,60,69,78,60,66,69,72,75,78,81,84,87,60,66,72,75,81,84,87,69,78,66,72,75,81,84,87,60,69,78,66,72,75,81,84,87,60,69,78];
    M = sparse(ix,jx,C(kx),41,60);

    [L,~,P] = lu(M(:,1:27));
    P = P';
    M = [P*L P(:,28:end)]\M(:,28:end);
    M = M(end-13:end,:);

    T = zeros(19);
    T([1,3,4,6,7,8,10,11,12,14,15,17,18,19],:) = -M(:,1:14)\M(:,15:end);
    T([116,195,275,336,358]) = 1;

    [V,~] = eig(T);
    S = V(16:18,:)./repmat(V(19,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end