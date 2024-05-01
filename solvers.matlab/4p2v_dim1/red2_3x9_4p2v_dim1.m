% Input: cell arrays TT0 and TT1, value of free variable v
% Output: solution matrix S of size 2x6

function S = red2_3x9_4p2v_dim1(TT0,TT1,v)

    T0 = TT0{1}+TT0{2}*v+TT0{3}*v^2+TT0{4}*v^3;
    T1 = TT1{1}+TT1{2}*v+TT1{3}*v^2+TT1{4}*v^3;

    [V,~] = eig(T0,T1);
    S = V(4:5,:)./repmat(V(6,:),2,1);
    S = S(:,all(isfinite(S)));

end