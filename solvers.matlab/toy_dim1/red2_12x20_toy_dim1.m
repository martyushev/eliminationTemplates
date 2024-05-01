% Input: cell arrays TT0 and TT1, value of free variable z
% Output: solution matrix S of size 3x8

function S = red2_12x20_toy_dim1(TT0,TT1,z)

    T0 = TT0{1}+TT0{2}*z+TT0{3}*z^2;
    T1 = TT1{1}+TT1{2}*z+TT1{3}*z^2;

    [V,~] = eig(T0,T1);
    S = V(5:7,:)./repmat(V(8,:),3,1);
    S = S(:,all(isfinite(S)));

end