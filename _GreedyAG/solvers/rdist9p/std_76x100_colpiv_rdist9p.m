% Input: coefficient matrix C of size 4x52

function [w,x,y,z] = std_76x100_colpiv_rdist9p(C)

    i_dx = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,71,71,71,71,71,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76];
    j_dx = [82,84,87,88,90,93,95,96,97,98,99,100,68,70,74,75,77,83,85,88,89,91,94,97,69,71,76,77,79,84,86,90,91,92,95,98,52,54,58,60,61,82,83,84,93,94,95,99,37,38,69,74,76,82,84,87,88,90,93,96,15,17,25,26,27,30,37,45,52,68,69,82,26,28,32,35,64,68,70,74,75,77,83,88,27,29,34,35,36,69,71,76,77,79,84,90,30,37,45,52,54,58,68,69,82,83,84,93,45,47,54,56,60,69,70,71,84,85,86,95,44,46,50,53,55,57,59,68,70,83,85,94,8,11,21,24,33,42,43,50,64,65,75,28,35,62,65,66,70,72,77,78,80,85,91,9,12,22,23,27,29,34,35,36,69,76,7,10,20,21,23,26,28,32,35,64,68,74,19,29,41,47,49,56,62,63,71,72,73,86,12,14,29,36,63,66,67,71,79,3,5,10,11,13,18,28,40,43,46,62,70,17,19,27,28,29,45,47,54,69,70,71,84,16,18,26,28,42,44,46,50,53,68,70,83,4,6,12,13,14,19,29,41,47,62,63,71,2,4,9,10,12,17,19,27,28,29,45,69,18,28,40,43,46,48,51,55,62,70,72,85,1,3,7,8,10,16,18,26,28,42,44,68,10,13,23,24,28,35,62,65,66,70,77,25,27,31,32,34,37,38,69,74,76,82,87,33,39,42,43,50,51,57,64,65,75,78,89,29,36,63,66,67,71,73,79,80,81,86,92,82,84,87,88,90,93,95,96,97,98,99,100,68,70,74,75,77,83,85,88,89,91,94,97,69,71,76,77,79,84,86,90,91,92,95,98,52,54,58,60,61,82,83,84,93,94,95,99,37,38,69,74,76,82,84,87,88,90,93,96,15,17,25,26,27,30,37,45,52,68,69,82,26,28,32,35,64,68,70,74,75,77,83,88,27,29,34,35,36,69,71,76,77,79,84,90,30,37,45,52,54,58,68,69,82,83,84,93,45,47,54,56,60,69,70,71,84,85,86,95,44,46,50,53,55,57,59,68,70,83,85,94,8,11,21,24,33,42,43,50,64,65,75,28,35,62,65,66,70,72,77,78,80,85,91,9,12,22,23,27,29,34,35,36,69,76,7,10,20,21,23,26,28,32,35,64,68,74,19,29,41,47,49,56,62,63,71,72,73,86,12,14,29,36,63,66,67,71,79,3,5,10,11,13,18,28,40,43,46,62,70,17,19,27,28,29,45,47,54,69,70,71,84,16,18,26,28,42,44,46,50,53,68,70,83,4,6,12,13,14,19,29,41,47,62,63,71,2,4,9,10,12,17,19,27,28,29,45,69,18,28,40,43,46,48,51,55,62,70,72,85,1,3,7,8,10,16,18,26,28,42,44,68,10,13,23,24,28,35,62,65,66,70,77,93,94,95,96,97,98,99,100,2,3,4,9,10,12,17,27,4,5,6,12,13,14,19,29,57,83,85,88,89,91,94,97,84,85,86,90,91,92,95,98,58,59,60,61,93,94,95,99,82,83,84,87,88,90,93,96,30,37,44,45,52,68,69,82,50,68,70,74,75,77,83,88,69,70,71,76,77,79,84,90,52,53,54,58,82,83,84,93,54,55,56,60,84,85,86,95,51,70,72,77,78,80,85,91,27,28,29,34,35,36,69,76,26,28,32,35,42,64,68,74,47,48,49,56,71,72,73,86,29,36,62,63,66,67,71,79,12,13,14,29,36,19,29,40,41,47,62,63,71,17,18,19,27,28,29,45,69,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,42,44,45,52,64,68,69,74,76,82,87,16,17,18,19,26,27,28,29,30,32,33,34,35,36,37,38,40,41,42,43,44,45,46,47,50,52,53,54,58,62,63,64,65,66,67,68,69,70,71,74,75,76,77,79,82,83,84,87,88,90,93,96,39,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
    C_dx = [113,125,149,153,161,173,181,189,193,197,201,205,113,125,149,153,161,173,181,189,193,197,201,205,113,125,149,153,161,173,181,189,193,197,201,205,113,125,173,181,201,149,153,161,189,193,197,205,113,149,125,153,161,173,181,189,193,197,201,205,113,125,149,153,161,173,189,181,201,193,197,205,113,125,149,161,153,173,181,189,193,197,201,205,113,125,149,153,161,173,181,189,193,197,201,205,113,149,125,173,181,201,153,161,189,193,197,205,113,125,173,181,201,149,153,161,189,193,197,205,113,125,153,173,181,193,201,149,161,189,197,205,113,125,149,161,193,173,181,201,189,197,205,113,149,125,153,161,173,181,189,193,197,201,205,113,125,149,153,173,181,189,193,197,201,205,113,125,149,153,161,173,181,189,197,193,201,205,113,149,125,173,181,201,153,161,189,193,197,205,113,125,173,189,181,193,197,201,205,113,125,149,153,161,173,189,181,193,201,197,205,113,125,149,153,161,173,181,201,189,193,197,205,113,125,149,161,153,173,181,193,201,189,197,205,113,125,149,153,161,173,189,181,201,193,197,205,113,125,149,153,161,173,181,189,193,197,201,205,113,149,125,153,173,181,193,201,161,189,197,205,113,125,149,153,161,173,181,189,197,193,201,205,113,125,149,153,173,189,181,193,197,201,205,113,125,149,153,161,173,189,181,193,197,201,205,153,193,113,125,173,181,201,149,161,189,197,205,113,149,125,153,161,173,181,189,193,197,201,205,114,126,150,154,162,174,182,190,194,198,202,206,114,126,150,154,162,174,182,190,194,198,202,206,114,126,150,154,162,174,182,190,194,198,202,206,114,126,174,182,202,150,154,162,190,194,198,206,114,150,126,154,162,174,182,190,194,198,202,206,114,126,150,154,162,174,190,182,202,194,198,206,114,126,150,162,154,174,182,190,194,198,202,206,114,126,150,154,162,174,182,190,194,198,202,206,114,150,126,174,182,202,154,162,190,194,198,206,114,126,174,182,202,150,154,162,190,194,198,206,114,126,154,174,182,194,202,150,162,190,198,206,114,126,150,162,194,174,182,202,190,198,206,114,150,126,154,162,174,182,190,194,198,202,206,114,126,150,154,174,182,190,194,198,202,206,114,126,150,154,162,174,182,190,198,194,202,206,114,150,126,174,182,202,154,162,190,194,198,206,114,126,174,190,182,194,198,202,206,114,126,150,154,162,174,190,182,194,202,198,206,114,126,150,154,162,174,182,202,190,194,198,206,114,126,150,162,154,174,182,194,202,190,198,206,114,126,150,154,162,174,190,182,202,194,198,206,114,126,150,154,162,174,182,190,194,198,202,206,114,150,126,154,174,182,194,202,162,190,198,206,114,126,150,154,162,174,182,190,198,194,202,206,114,126,150,154,174,190,182,194,198,202,206,175,179,183,191,195,199,203,207,175,179,183,191,195,199,203,207,175,179,183,191,195,199,203,207,179,175,183,191,195,199,203,207,175,179,183,191,195,199,203,207,175,179,183,203,191,195,199,207,175,179,183,191,195,199,203,207,175,191,179,183,203,195,199,207,179,175,183,191,195,199,203,207,175,179,183,191,195,199,203,207,175,179,183,203,191,195,199,207,175,179,183,203,191,195,199,207,179,175,183,191,195,199,203,207,175,179,183,191,195,199,203,207,175,183,191,199,179,195,203,207,175,179,183,203,191,195,199,207,175,191,179,183,195,199,203,207,175,179,183,203,207,175,191,179,183,203,195,199,207,175,179,183,191,195,199,203,207,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,92,96,100,116,120,128,132,136,140,152,156,164,168,172,176,192,124,144,148,188,160,180,184,196,200,204,208,4,8,12,16,28,36,40,48,60,80,88,92,96,104,116,152,20,24,32,44,64,68,72,76,124,140,144,148,188,52,56,84,100,108,112,120,128,132,136,156,160,164,168,172,176,180,184,192,196,200,204,208,88,4,8,12,16,20,24,32,44,60,64,68,72,76,124,140,144,148,188,28,36,40,48,52,56,80,84,92,96,100,104,108,112,116,120,128,132,136,152,156,160,164,168,172,176,180,184,192,196,200,204,208];
    M = sparse(i_dx,j_dx,C(C_dx),76,100);

    [L,~,Pi] = lu(M(:,1:39));
    Pi = Pi';
    M = [Pi*L Pi(:,40:end)]\M(:,40:end);
    M = full(M(40:end,:));

    [L,UR,Pi] = lu(M(:,1:22));
    Pi = Pi';
    M = [Pi*L Pi(:,23:end)]\M(:,23:end);
    MP = M(1:22,:);
    NP = M(23:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:15)\[U(:,16:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-23:end)+A(:,1:end-24)*B; -B];

    xP = [40,41,42,43,1,2,44,45,46,47,48,49,7,50,8,9,51,10,11,12,52,53,54,55,56,21,22,57,23,24,25,58,59,60,32,33,34,61,38];
    P1 = [(1:34)*Pi 35:39];
    T = getT(M,[40:61 P1(1:end-24)],P1(end-23:end),xP);

    [V,D] = eig(T);
    sol = [V([20,21,22],:)./repmat(V(24,:),3,1); diag(D).'];

    I = find(not(isnan(sol(1,:))) & not(isinf(sol(1,:))));
    %I = I(not(imag(sol(1,:)))); % uncomment this line for real roots only
    w = sol(1,I);
    x = sol(2,I);
    y = sol(3,I);
    z = sol(4,I);

end