
[data,S,R,Sgt,Rgt] = inidata_feas_toa_55(); % generate initial data

C = coefs_toa_55(data); % compute coefficients of polynomial system
Z = red_772x832_colpiv_toa_55(C); % solve polynomial system

min_err = inf;
ind = 0;
for i = 1:size(Z,2)
    Z1 = Z(:,i);
    [S1,R1,flag] = findPositions55(Z1,data,S,R);
    if ~flag
        err = findError(Sgt,Rgt,S1,R1);
        if err<min_err
            min_err = err;
            ind = i;
        end
    end
end

if ind~=0
    Z1 = Z(:,ind);
    [S1,R1,flag] = findPositions55(Z1,data,S,R);
    err = findError(Sgt,Rgt,S1,R1)
end




function [S1,R1,flag] = findPositions55(Z1,data,S,R)
    V = data{1};
    S1 = zeros(3,5);
    R1 = zeros(3,5);
    H1 = V(1:6)+V(10:15)*Z1(1)+V(19:24)*Z1(2)+V(28:33)*Z1(3)+V(37:42)*Z1(4)+V(46:51)*Z1(5);
    H1 = [H1(1) H1(2) H1(3); H1(2) H1(4) H1(5); H1(3) H1(5) H1(6)];
    b1 = V(7:9)+V(16:18)*Z1(1)+V(25:27)*Z1(2)+V(34:36)*Z1(3)+V(43:45)*Z1(4)+V(52:54)*Z1(5);
    [L,flag] = chol(H1);
    if ~flag
        L1 = L';
        S1(:,1) = L1\b1;
        for j=2:5
            S1(:,j) = L1\(S(:,j-1)+b1);
        end
        for i=2:5
            R1(:,i) = L*R(:,i-1);
        end
    end
end

function err = findError(Sgt,Rgt,S,R)
    err = 0;
    m = size(Rgt,2);
    n = size(Sgt,2);
    for i=1:m
        for k=i+1:m
            err = err + (dist(Rgt(:,i),Rgt(:,k))-dist(R(:,i),R(:,k)))^2;
        end
    end
    for j=1:n
        for k=j+1:n
            err = err + (dist(Sgt(:,j),Sgt(:,k))-dist(S(:,j),S(:,k)))^2;
        end
    end
    err = log10(sqrt(err));
end

function d = dist(x,y)
    d = sqrt((x-y)'*(x-y));
end