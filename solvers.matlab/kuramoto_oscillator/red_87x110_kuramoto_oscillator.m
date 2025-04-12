% Input: coefficient matrix C of size 6x16
% Output: solution matrix S of size 6x23

function S = red_87x110_kuramoto_oscillator(C)

    M = sparse([1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8,8,9,9,9,9,9,10,10,10,10,11,11,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,14,14,15,15,15,15,15,15,16,16,16,16,16,16,17,17,17,17,17,17,18,18,18,18,18,18,19,19,19,19,20,20,20,20,20,21,21,21,21,22,22,22,22,22,23,23,23,23,23,23,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,26,26,26,27,27,27,27,27,27,28,28,28,28,28,28,29,29,29,29,29,29,30,30,30,30,30,30,31,31,31,31,31,31,32,32,32,32,32,32,33,33,33,33,33,33,34,34,34,34,34,35,35,35,35,35,36,36,36,36,36,36,37,37,37,37,37,37,38,38,38,38,38,38,39,39,39,39,40,40,40,40,40,41,41,41,41,41,41,42,42,42,42,42,42,43,43,43,43,43,43,44,44,44,44,44,44,45,45,45,45,45,45,46,46,46,46,46,46,47,47,47,48,48,48,48,49,49,49,49,49,49,50,50,50,50,50,51,51,51,51,51,51,52,52,52,52,52,53,53,53,53,53,53,54,54,54,54,54,54,55,55,55,55,55,55,56,56,56,56,56,56,57,57,57,57,57,57,58,58,58,58,58,58,59,59,59,59,59,59,60,60,60,60,60,61,61,61,61,61,61,62,62,62,62,62,62,63,63,63,63,63,63,64,64,64,64,64,65,65,65,65,65,65,66,66,66,66,66,67,67,67,67,67,67,68,68,68,68,68,68,69,69,69,69,70,70,70,70,70,71,71,71,71,71,71,72,72,72,72,72,72,73,73,73,73,73,73,74,74,74,74,74,74,75,75,75,75,75,75,76,76,76,76,76,76,77,77,77,78,78,78,78,78,79,79,79,79,79,80,80,80,80,80,81,81,81,81,81,82,82,82,82,82,82,83,83,83,83,83,84,84,84,84,84,84,85,85,85,85,85,86,86,86,86,86,86,87,87,87,87,87,87],[119,127,129,136,139,159,113,115,121,131,138,153,48,108,115,128,137,149,104,107,126,136,147,45,103,105,112,119,135,44,103,148,150,159,162,46,50,102,125,134,146,98,99,122,133,141,92,93,99,117,132,87,88,114,131,39,86,89,140,153,161,52,80,81,110,77,78,109,128,32,76,79,90,108,120,33,40,74,75,107,127,23,25,73,83,103,158,24,29,37,72,102,118,22,28,35,72,146,156,69,70,101,123,18,65,67,141,155,60,61,94,117,58,59,62,93,116,10,11,55,64,86,152,9,12,16,54,84,150,2,5,13,53,75,105,120,127,137,139,159,161,115,116,132,138,153,155,48,49,52,137,149,154,107,108,128,136,147,153,47,103,105,120,135,152,44,106,148,151,160,162,46,105,127,134,146,150,99,100,123,133,141,143,51,92,95,132,142,87,93,117,131,141,41,86,90,97,116,130,39,43,89,91,154,161,40,84,90,115,129,140,52,80,82,111,77,81,92,110,128,34,49,76,79,91,120,33,48,74,79,89,127,26,39,74,76,149,159,23,31,38,73,106,158,29,30,72,83,105,118,22,28,36,73,148,156,69,71,123,66,70,101,122,18,21,67,68,142,155,60,63,69,96,117,15,58,62,68,95,116,10,55,56,91,152,13,14,54,64,90,112,9,12,17,55,89,150,5,6,53,55,79,105,1,3,10,53,76,103,119,120,129,138,139,161,113,116,121,133,138,155,49,108,115,132,137,154,104,108,131,136,153,45,47,112,130,135,152,103,106,150,151,161,162,50,102,105,129,134,150,98,100,124,133,143,93,95,99,123,132,142,88,93,122,131,141,43,86,91,140,155,161,42,85,90,121,129,140,51,52,81,82,78,81,92,117,128,32,34,90,91,116,120,40,75,79,89,115,127,27,32,85,86,113,119,25,31,38,83,152,158,24,30,37,83,112,118,35,36,72,73,150,156,70,71,123,21,65,68,143,155,61,63,69,101,117,15,59,68,100,116,20,58,67,142,154,19,57,62,67,99,115,11,56,64,97,152,16,17,54,55,140,150,7,8,49,62,95,4,7,57,58,93,108,2,6,13,55,90,105],C([25,37,55,73,91,19,25,37,55,73,91,19,37,25,55,73,91,19,25,37,73,91,19,25,19,37,55,73,91,19,25,37,55,73,91,37,55,25,73,91,19,25,37,73,91,19,19,25,55,73,91,19,25,73,91,19,25,37,55,73,91,91,19,25,73,19,25,73,91,25,19,37,55,73,91,37,55,19,25,73,91,19,25,37,55,73,91,25,37,55,19,73,91,19,37,55,25,73,91,19,25,73,91,19,25,37,73,91,19,25,73,91,19,25,37,73,91,19,25,37,55,73,91,19,37,55,25,73,91,25,37,55,19,73,91,44,38,80,92,20,62,38,44,80,92,20,62,38,44,80,92,20,62,38,44,80,92,20,62,44,20,38,80,92,62,20,44,38,62,80,92,38,44,80,92,20,62,38,44,80,92,20,62,80,20,44,92,62,20,44,80,92,62,44,20,38,62,80,92,20,62,38,44,80,92,38,20,44,80,92,62,92,20,44,80,20,44,62,80,92,44,80,20,38,62,92,38,80,20,44,62,92,20,62,38,44,80,92,20,44,62,38,80,92,38,44,20,62,80,92,20,38,62,44,80,92,20,44,92,20,44,80,92,20,62,38,44,80,92,20,44,62,80,92,44,20,38,62,80,92,20,38,44,80,92,38,44,20,62,80,92,20,38,62,44,80,92,38,44,20,62,80,92,20,44,62,38,80,92,27,45,57,87,93,63,27,45,57,87,93,63,45,27,57,87,93,63,27,45,87,93,63,27,45,57,87,93,63,27,45,57,63,87,93,57,27,45,87,93,63,27,45,87,93,63,27,45,57,87,93,63,27,45,87,93,63,63,27,45,57,87,93,57,27,45,87,93,63,87,93,27,45,27,45,63,87,93,27,45,57,63,87,93,57,27,45,63,87,93,27,45,57,63,87,93,27,45,63,57,87,93,27,45,57,63,87,93,57,63,27,45,87,93,27,45,93,63,27,45,87,93,27,45,63,87,93,45,27,63,87,93,63,27,57,87,93,57,27,45,63,87,93,27,45,57,87,93,57,63,27,45,87,93,27,45,93,57,87,27,45,57,63,87,93,27,45,57,63,87,93]),87,162);

    M0 = sparse([1,2,3,3,4,5,5,6,6,7,8,10,10,11,12,12,13,13,14,15,15,16,16,17,18,19,20,21,22,23,23,24,25,25,26,27,28,28,29,29,30,30,31,31,32,32,33,33,34,34,35,35,36,37,37,38,38,39,39,40,40,41,42,43,44,44,45,45,46,46,47,47,48,48,49,49,50,50,51,51,52,52],[52,55,17,97,57,83,93,82,92,58,59,11,61,101,8,102,9,64,63,86,99,14,103,69,70,71,71,72,73,29,67,73,89,107,74,74,25,108,26,68,47,75,90,108,49,76,87,105,87,105,35,109,77,36,78,43,78,44,79,42,80,80,81,81,58,84,70,84,57,85,71,85,82,92,83,93,62,86,86,99,87,105],[-1,-1,1,-1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,-1,1,1,-1,-1,-1,-1,-1,-1,-1,1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,1,-1,-1,1,-1,1,-1,1,-1,1,-1,-1,-1,-1,1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,1,-1,-1,1,-1,1],52,110);
    M = M(:,53:end)-M(:,1:52)*M0; % Schur complement reduction

    [L,~,P] = lu(M(:,1:68));
    P = P';
    M = [P*L P(:,69:end)]\M(:,69:end);
    M = M(end-18:end,:);

    T0 = zeros(23);
    T0([1,2,3,4,7,8,9,10,11,13,14,15,16,17,19,20,21,22,23],:) = -M(:,20:end);
    T0([373,420,495,524]) = 1;
    T1 = zeros(23);
    T1([1,2,3,4,7,8,9,10,11,13,14,15,16,17,19,20,21,22,23],[1,2,3,4,7,8,9,10,11,13,14,15,16,17,19,20,21,22,23]) = M(:,1:19);
    T1([97,121,265,409]) = 1;

    [V,~] = eig(T0,T1);
    S = V(17:22,:)./repmat(V(23,:),6,1);
    S = S(:,all(isfinite(S)));

end